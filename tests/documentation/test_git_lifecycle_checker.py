"""Negative controls and real Git fixtures for the read-only lifecycle checker."""
import hashlib
import json
import os
from pathlib import Path
import subprocess
import tempfile
import unittest

CHECKER = Path(__file__).with_name("check-git-lifecycle.py")


class LifecycleCheckerTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.root = Path(self.tmp.name)
        self.repo = self.root / "project"
        self.repo.mkdir()
        self.env = dict(os.environ, GIT_CONFIG_NOSYSTEM="1", GIT_CONFIG_GLOBAL=os.devnull)
        self.git("init", "-q")
        self.git("config", "user.name", "Fixture Author")
        self.git("config", "user.email", "fixture@example.invalid")
        self.git("config", "commit.gpgsign", "false")
        self.write("SPEC.md", "draft v001\n")
        self.base = self.commit(["SPEC.md"])

    def git(self, *args):
        return subprocess.check_output(["git", "-C", str(self.repo), *args], env=self.env)

    def write(self, path, text):
        p = self.repo / path
        p.parent.mkdir(parents=True, exist_ok=True)
        p.write_text(text)

    def commit(self, paths):
        self.git("add", "--", *paths)
        self.git("commit", "-qm", "fixture milestone")
        return self.git("rev-parse", "HEAD").decode().strip()

    def expected(self):
        return {"repo": str(self.repo), "expected_root": str(self.repo), "mode": "git",
                "milestones": [{"commit": self.base, "allowed_paths": ["SPEC.md"],
                                "files": {"SPEC.md": hashlib.sha256(b"draft v001\n").hexdigest()}}]}

    def check(self, expected, success=True):
        f = self.root / "expectations.json"
        f.write_text(json.dumps(expected))
        result = subprocess.run(["python3", str(CHECKER), str(f)], capture_output=True, env=self.env)
        report = json.loads(result.stdout)
        self.assertEqual(report["ok"], success, report)
        if success:
            self.assertEqual(result.returncode, 0, result.stderr.decode() + result.stdout.decode())
        else:
            self.assertNotEqual(result.returncode, 0, result.stdout.decode())
            self.assertTrue(report["failures"])
        return result

    def test_valid_milestone_and_approval_pin(self):
        self.write("PLAN.md", f"Approved base: {self.base}:SPEC.md\n")
        approval = self.commit(["PLAN.md"])
        e = self.expected()
        e["references"] = [{"consumer_commit": approval, "consumer_path": "PLAN.md",
                            "source_commit": self.base, "source_path": "SPEC.md",
                            "sha256": hashlib.sha256(b"draft v001\n").hexdigest()}]
        before = self.git("status", "--porcelain=v1", "-z")
        self.check(e)
        self.assertEqual(self.git("status", "--porcelain=v1", "-z"), before)

    def test_uncommitted_presented_content_is_detected(self):
        self.write("SPEC.md", "changed v002\n")
        e = self.expected()
        e["milestones"][0]["files"]["SPEC.md"] = hashlib.sha256(b"changed v002\n").hexdigest()
        self.check(e, False)

    def test_pin_prefix_collisions_are_rejected(self):
        pin = f"{self.base}:SPEC.md"
        for wrong_pin in (pin + ".proposal", pin + "/other", pin + "-old",
                          pin + "_backup", pin + "(proposal)", pin + " backup",
                          "f" + pin, "prefix/" + pin):
            with self.subTest(pin=wrong_pin):
                self.write("PLAN.md", f"Approved base: `{wrong_pin}`\n")
                approval = self.commit(["PLAN.md"])
                e = self.expected()
                e["references"] = [{"consumer_commit": approval, "consumer_path": "PLAN.md",
                                    "source_commit": self.base, "source_path": "SPEC.md",
                                    "sha256": hashlib.sha256(b"draft v001\n").hexdigest()}]
                self.check(e, False)

    def test_exact_pin_accepts_markdown_boundaries(self):
        pin = f"{self.base}:SPEC.md"
        for content in (pin, f"Approved base: {pin}\n", f"Base: `{pin}`.",
                        f"[Approved base]({pin})", f'Base: "{pin}"',
                        f"<{pin}>", f"Base: {pin}; US-001 approved.",
                        f"Base: {pin}.\n"):
            with self.subTest(content=content):
                self.write("PLAN.md", content)
                approval = self.commit(["PLAN.md"])
                e = self.expected()
                e["references"] = [{"consumer_commit": approval, "consumer_path": "PLAN.md",
                                    "source_commit": self.base, "source_path": "SPEC.md",
                                    "sha256": hashlib.sha256(b"draft v001\n").hexdigest()}]
                self.check(e)

    def test_wrong_approved_dependency_is_detected(self):
        self.write("SPEC.md", "proposal v002\n")
        new = self.commit(["SPEC.md"])
        self.write("PLAN.md", f"Approved base: {new}:SPEC.md\n")
        approval = self.commit(["PLAN.md"])
        e = self.expected()
        e["references"] = [{"consumer_commit": approval, "consumer_path": "PLAN.md",
                            "source_commit": self.base, "source_path": "SPEC.md",
                            "sha256": hashlib.sha256(b"draft v001\n").hexdigest()}]
        self.check(e, False)

    def test_unrelated_path_committed_is_detected(self):
        self.write("user-note.md", "private user edit\n")
        self.write("SPEC.md", "owned proposal\n")
        commit = self.commit(["SPEC.md", "user-note.md"])
        e = self.expected()
        e["milestones"] = [{"commit": commit, "allowed_paths": ["SPEC.md"], "files": {}}]
        self.check(e, False)

    def test_merge_cannot_hide_an_unrelated_path(self):
        original = self.git("branch", "--show-current").decode().strip()
        self.git("checkout", "-qb", "fixture-side")
        self.write("user-note.md", "unrelated staged contribution\n")
        self.commit(["user-note.md"])
        self.git("checkout", "-q", original)
        self.write("SPEC.md", "owned proposal\n")
        self.commit(["SPEC.md"])
        self.git("merge", "--no-ff", "-qm", "fixture merge", "fixture-side")
        merged = self.git("rev-parse", "HEAD").decode().strip()
        e = self.expected()
        e["milestones"] = [{"commit": merged, "allowed_paths": ["SPEC.md"], "files": {}}]
        self.check(e, False)

    def test_protected_index_and_working_bytes_are_checked(self):
        self.write("user-note.md", "staged\n")
        self.git("add", "user-note.md")
        index = self.git("ls-files", "--stage", "-z", "--", "user-note.md").decode()
        self.write("user-note.md", "working\n")
        e = self.expected()
        e["protected"] = [{"path": "user-note.md", "sha256": hashlib.sha256(b"working\n").hexdigest(),
                           "index": index}]
        self.check(e)
        self.git("add", "user-note.md")
        self.check(e, False)

    def test_new_snapshot_fallback_is_detected(self):
        e = self.expected()
        e["forbidden_new_globs"] = ["docs/versions/**"]
        e["existing_paths"] = []
        self.write("docs/versions/SPEC-v001.md", "new fallback\n")
        self.check(e, False)

    def test_read_only_non_git_project_and_noop(self):
        empty = self.root / "readonly"
        empty.mkdir()
        self.check({"repo": str(empty), "expected_root": str(empty), "mode": "no_git"})
        e = self.expected()
        e["expected_head"] = self.base
        self.check(e)
        self.write("SPEC.md", "next\n")
        self.commit(["SPEC.md"])
        self.check(e, False)

    def test_linked_worktree_accepts_git_file_and_correct_root(self):
        worktree = self.root / "worktree"
        self.git("worktree", "add", "-q", "-b", "fixture-worktree", str(worktree))
        e = self.expected()
        e["repo"] = e["expected_root"] = str(worktree)
        self.assertTrue((worktree / ".git").is_file())
        self.check(e)
        e["expected_root"] = str(self.repo)
        self.check(e, False)

    def test_pin_hash_mismatch_and_path_traversal_are_detected(self):
        self.write("PLAN.md", f"Approved base: {self.base}:SPEC.md\n")
        c = self.commit(["PLAN.md"])
        e = self.expected()
        e["references"] = [{"consumer_commit": c, "consumer_path": "PLAN.md", "source_commit": self.base,
                            "source_path": "SPEC.md", "sha256": "0" * 64}]
        self.check(e, False)
        e = self.expected()
        e["protected"] = [{"path": "../outside", "sha256": "0" * 64}]
        self.check(e, False)


if __name__ == "__main__":
    unittest.main()
