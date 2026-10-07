#!/usr/bin/env python3
"""Read-only assertions over a disposable Git lifecycle fixture; stdlib only."""
import argparse
import fnmatch
import hashlib
import json
from pathlib import Path, PurePosixPath
import re
import subprocess
import sys

FIELDS = """Expectations JSON: repo, expected_root, mode (git/no_git);
optional expected_head (full SHA), milestones [{commit, allowed_paths,
files: {repo_relative_path: sha256}}], references [{consumer_commit,
consumer_path, source_commit, source_path, sha256}], protected [{path,
sha256 (null means absent), index (exact git ls-files --stage -z output)}],
forbidden_new_globs and existing_paths. References must contain the literal
SOURCE_SHA:SOURCE_PATH pin in the consumer. A SHA256 covers complete file bytes.
This checker reads state; it does not initialize Git, commit, modify files or
evaluate human approval, semantic scope, automatic skill activation or outcomes.
"""


def check(expectations):
    root = Path(expectations["repo"]).resolve(strict=True)
    failures = []
    checks = 0

    def expect(condition, label):
        nonlocal checks
        checks += 1
        if not condition:
            failures.append(label)

    def git(*args):
        return subprocess.check_output(["git", "-C", str(root), *args], stderr=subprocess.PIPE)

    def relative(value):
        path = PurePosixPath(value)
        if not value or path.is_absolute() or ".." in path.parts or ".git" in path.parts:
            raise ValueError(f"not a repository-relative artifact path: {value}")
        return value

    def commit(value):
        if not re.fullmatch(r"[0-9a-f]{40}|[0-9a-f]{64}", value):
            raise ValueError(f"expected a full Git object id, got {value}")
        git("cat-file", "-e", value + "^{commit}")
        return value

    def blob(sha, path):
        return git("cat-file", "blob", commit(sha) + ":" + relative(path))

    def digest(data):
        return hashlib.sha256(data).hexdigest()

    try:
        actual_root = Path(git("rev-parse", "--show-toplevel").decode().strip()).resolve()
    except subprocess.CalledProcessError:
        actual_root = None
    mode = expectations.get("mode", "git")
    if mode not in ("git", "no_git"):
        raise ValueError("mode must be git or no_git")
    expect(actual_root == (None if mode == "no_git" else Path(expectations["expected_root"]).resolve()),
           "repository root/mode mismatch")
    if mode == "no_git":
        expect(not expectations.get("milestones") and not expectations.get("references"),
               "a no_git case cannot claim Git milestones or pins")
    elif actual_root is None:
        return {"ok": False, "checks": checks, "failures": failures}

    if "expected_head" in expectations:
        expect(git("rev-parse", "HEAD").decode().strip() == expectations["expected_head"],
               "HEAD changed for an expected no-op")
    for milestone in expectations.get("milestones", []):
        sha = commit(milestone["commit"])
        paths = {p.decode() for p in git("diff-tree", "--root", "--no-commit-id", "--name-only",
                                        "-r", "-z", sha).split(b"\0") if p}
        allowed = {relative(p) for p in milestone["allowed_paths"]}
        expect(paths <= allowed, f"unrelated paths in commit {sha}: {sorted(paths - allowed)}")
        for path, expected_hash in milestone.get("files", {}).items():
            expect(digest(blob(sha, path)) == expected_hash, f"milestone content mismatch: {sha}:{path}")
    for ref in expectations.get("references", []):
        source = commit(ref["source_commit"])
        path = relative(ref["source_path"])
        expect(digest(blob(source, path)) == ref["sha256"], f"approved base hash mismatch: {source}:{path}")
        consumer = blob(ref["consumer_commit"], ref["consumer_path"]).decode()
        expect(source + ":" + path in consumer, f"missing expected approved pin in {ref['consumer_path']}")
    for item in expectations.get("protected", []):
        path = relative(item["path"])
        actual = root / path
        if not actual.resolve().is_relative_to(root):
            raise ValueError(f"protected artifact escapes root: {path}")
        expected_hash = item.get("sha256")
        expect((not actual.exists()) if expected_hash is None else
               (actual.is_file() and digest(actual.read_bytes()) == expected_hash),
               f"protected working bytes changed: {path}")
        if "index" in item:
            expect(git("ls-files", "--stage", "-z", "--", path).decode() == item["index"],
                   f"protected index entry changed: {path}")
    if expectations.get("forbidden_new_globs"):
        existing = set(expectations.get("existing_paths", []))
        for p in root.rglob("*"):
            if p.is_file() and ".git" not in p.relative_to(root).parts:
                path = p.relative_to(root).as_posix()
                if path not in existing:
                    expect(not any(fnmatch.fnmatchcase(path, pattern)
                                   for pattern in expectations["forbidden_new_globs"]),
                           f"new forbidden snapshot path: {path}")
    return {"ok": not failures, "checks": checks, "failures": failures}


def main():
    parser = argparse.ArgumentParser(description=__doc__, epilog=FIELDS,
                                     formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("expectations", type=Path)
    args = parser.parse_args()
    try:
        result = check(json.loads(args.expectations.read_text()))
    except (OSError, ValueError, KeyError, TypeError, subprocess.CalledProcessError) as error:
        result = {"ok": False, "checks": 0, "failures": [f"invalid expectation or missing Git artifact: {error}"]}
    print(json.dumps(result, ensure_ascii=False, indent=2))
    return 0 if result["ok"] else 1


if __name__ == "__main__":
    sys.exit(main())
