#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
SCRIPT_UNDER_TEST="$REPO_ROOT/scripts/package-codex-plugin.sh"

FAILURES=0
TEST_ROOT="$(mktemp -d)"

cleanup() {
  rm -rf "$TEST_ROOT"
}
trap cleanup EXIT

pass() {
  echo "  [PASS] $1"
}

fail() {
  echo "  [FAIL] $1"
  FAILURES=$((FAILURES + 1))
}

assert_equals() {
  local actual="$1"
  local expected="$2"
  local description="$3"

  if [[ "$actual" == "$expected" ]]; then
    pass "$description"
  else
    fail "$description"
    echo "    expected: $expected"
    echo "    actual:   $actual"
  fi
}

assert_contains() {
  local haystack="$1"
  local needle="$2"
  local description="$3"

  if printf '%s' "$haystack" | grep -Fq -- "$needle"; then
    pass "$description"
  else
    fail "$description"
    echo "    expected to find: $needle"
  fi
}

assert_not_matches() {
  local haystack="$1"
  local pattern="$2"
  local description="$3"

  if printf '%s' "$haystack" | grep -Eq -- "$pattern"; then
    fail "$description"
    echo "    did not expect to match: $pattern"
  else
    pass "$description"
  fi
}

list_archive() {
  local archive_path="$1"

  case "$archive_path" in
    *.tar.gz|*.tgz)
      tar -tzf "$archive_path"
      ;;
    *.zip)
      unzip -Z1 "$archive_path"
      ;;
    *)
      unzip -Z1 "$archive_path"
      ;;
  esac
}

normalize_archive_paths() {
  sed 's#/$##' | LC_ALL=C sort
}

extract_archive() {
  local archive_path="$1"
  local destination="$2"

  mkdir -p "$destination"
  case "$archive_path" in
    *.tar.gz|*.tgz)
      tar -xzf "$archive_path" -C "$destination"
      ;;
    *.zip)
      unzip -q "$archive_path" -d "$destination"
      ;;
    *)
      unzip -q "$archive_path" -d "$destination"
      ;;
  esac
}

read_archive_file() {
  local archive_path="$1"
  local file_path="$2"

  case "$archive_path" in
    *.tar.gz|*.tgz)
      tar -xOf "$archive_path" "$file_path"
      ;;
    *.zip)
      unzip -p "$archive_path" "$file_path"
      ;;
    *)
      unzip -p "$archive_path" "$file_path"
      ;;
  esac
}

write_metadata_fixture() {
  local destination="$1"
  local skill

  while IFS= read -r skill; do
    mkdir -p "$destination/skills/$skill/agents"
    cat >"$destination/skills/$skill/agents/openai.yaml" <<EOF
interface:
  display_name: "$skill"
  short_description: "Fixture metadata for $skill"
EOF
  done < <(find "$REPO_ROOT/skills" -mindepth 1 -maxdepth 1 -type d -print | sed 's#.*/##' | sort)
}

echo "Codex package archive tests"

metadata_source="$TEST_ROOT/metadata-source"
archive="$TEST_ROOT/superpowers"
tar_archive="$TEST_ROOT/superpowers.tar.gz"
extracted="$TEST_ROOT/extracted"
tar_extracted="$TEST_ROOT/tar-extracted"
write_metadata_fixture "$metadata_source"

source_hooks="$(python3 -c 'import json; print(json.load(open("'"$REPO_ROOT"'/.codex-plugin/plugin.json")).get("hooks"))')"
assert_equals "$source_hooks" "{}" "source Codex manifest suppresses local hook auto-discovery"

if output="$("$SCRIPT_UNDER_TEST" --allow-dirty --metadata-source "$metadata_source" --output "$archive" 2>&1)"; then
  pass "package script exits successfully"
else
  fail "package script exits successfully"
  printf '%s\n' "$output" | sed 's/^/      /'
fi

if [[ -f "$archive" ]]; then
  pass "package script writes archive"
else
  fail "package script writes archive"
fi

assert_contains "$output" "Archive:" "reports archive path"
assert_contains "$output" "Format:  zip" "reports default zip format"
assert_contains "$output" "SHA-256:" "reports archive checksum"

extract_archive "$archive" "$extracted"

archive_paths="$(list_archive "$archive" | normalize_archive_paths)"
unexpected_pattern='(^superpowers/|^\.agents/|^hooks/|package\.json$|^\.git|^\.pytest_cache|^\.ruff_cache|^scripts/|^tests/|^docs/|^evals/|^lib/|^\.claude|^\.cursor|^\.kimi|^\.opencode|^\.pi|^AGENTS\.md$|^CLAUDE\.md$|^GEMINI\.md$|^RELEASE-NOTES\.md$|^CHANGELOG\.md$)'
assert_not_matches "$archive_paths" "$unexpected_pattern" "archive excludes source-only paths"
assert_contains "$archive_paths" ".codex-plugin/plugin.json" "archive includes Codex manifest"
assert_contains "$archive_paths" "skills/brainstorming/SKILL.md" "archive includes skills"
assert_contains "$archive_paths" "skills/brainstorming/agents/openai.yaml" "archive includes OpenAI skill metadata"
assert_contains "$archive_paths" "assets/app-icon.png" "archive includes app icon"
assert_contains "$archive_paths" "assets/superpowers-small.svg" "archive includes composer icon"
for field in logo composerIcon; do
  icon_path="$(read_archive_file "$archive" .codex-plugin/plugin.json | python3 -c 'import json,sys; print(json.load(sys.stdin)["interface"][sys.argv[1]].removeprefix("./"))' "$field")"
  assert_contains "$archive_paths" "$icon_path" "archive includes referenced $field"
  assert_equals "$(shasum -a 256 "$extracted/$icon_path" | awk '{print $1}')" \
    "$(git -C "$REPO_ROOT" show "HEAD:$icon_path" | shasum -a 256 | awk '{print $1}')" \
    "archive preserves committed $field bytes"
done
if git -C "$REPO_ROOT" cat-file -e HEAD:templates/CONSTITUTION.md 2>/dev/null; then
  assert_contains "$archive_paths" "templates/CONSTITUTION.md" "archive includes product constitution template"
  assert_contains "$archive_paths" "templates/README.md" "archive includes product template guide"
  assert_equals "$(read_archive_file "$archive" templates/CONSTITUTION.md)" \
    "$(git -C "$REPO_ROOT" show HEAD:templates/CONSTITUTION.md)" \
    "archive preserves committed constitution template content"
fi

manifest_summary="$(read_archive_file "$archive" .codex-plugin/plugin.json | python3 -c 'import json,sys; data=json.load(sys.stdin); print("\t".join([data["name"], data["version"], data["skills"], str(data.get("hooks"))]))')"
expected_version="$(python3 -c 'import json; print(json.load(open("'"$REPO_ROOT"'/.codex-plugin/plugin.json"))["version"])')"
assert_equals "$manifest_summary" "superpowered	$expected_version	./skills/	$source_hooks" "archive manifest preserves fork name and source hooks"
assert_equals "$(read_archive_file "$archive" .codex-plugin/plugin.json | python3 -c 'import json,sys; print(json.load(sys.stdin)["interface"]["displayName"])')" \
  "Superpowered" "archive preserves fork display name"

skill_count="$(find "$extracted/skills" -mindepth 1 -maxdepth 1 -type d | wc -l | tr -d ' ')"
metadata_count="$(find "$extracted/skills" -path '*/agents/openai.yaml' -type f | wc -l | tr -d ' ')"
assert_equals "$metadata_count" "$skill_count" "every packaged skill has OpenAI metadata"

if [[ -x "$extracted/skills/subagent-driven-development/scripts/task-brief" ]]; then
  pass "archive preserves executable script mode"
else
  fail "archive preserves executable script mode"
fi

zip_times="$(python3 - "$archive" <<'PY'
import sys
import zipfile

with zipfile.ZipFile(sys.argv[1]) as archive:
    print("\n".join(sorted({str(info.date_time) for info in archive.infolist()})))
PY
)"
assert_equals "$zip_times" "(1980, 1, 1, 0, 0, 0)" "zip archive normalizes entry timestamps"

if tar_output="$("$SCRIPT_UNDER_TEST" --allow-dirty --metadata-source "$metadata_source" --format tar.gz --output "$tar_archive" 2>&1)"; then
  pass "package script writes explicit tar.gz archive"
else
  fail "package script writes explicit tar.gz archive"
  printf '%s\n' "$tar_output" | sed 's/^/      /'
fi
assert_contains "$tar_output" "Format:  tar.gz" "reports explicit tar.gz format"

extract_archive "$tar_archive" "$tar_extracted"
tar_archive_paths="$(list_archive "$tar_archive" | normalize_archive_paths)"
assert_equals "$tar_archive_paths" "$archive_paths" "zip and tar.gz archives contain the same paths"

tar_task_brief_mode="$(tar -tzvf "$tar_archive" skills/subagent-driven-development/scripts/task-brief | awk '{print $1}')"
assert_equals "$tar_task_brief_mode" "-rwxr-xr-x" "tar.gz archive preserves executable script mode"

tar_metadata_times="$(python3 - "$tar_archive" <<'PY'
import sys, tarfile
with tarfile.open(sys.argv[1]) as archive:
    print(sorted({member.mtime for member in archive.getmembers()}))
PY
)"
assert_equals "$tar_metadata_times" "[0]" "tar.gz archive normalizes entry timestamps"

metadata_archive="$TEST_ROOT/metadata-source.tar.gz"
metadata_zip="$TEST_ROOT/metadata-source.zip"
archive_from_tar_source="$TEST_ROOT/superpowers-from-tar-source.zip"
archive_from_zip_source="$TEST_ROOT/superpowers-from-zip-source.zip"
(
  cd "$metadata_source"
  tar -czf "$metadata_archive" .
  zip -X -q -r "$metadata_zip" .
)

if output="$("$SCRIPT_UNDER_TEST" --allow-dirty --metadata-source "$metadata_archive" --output "$archive_from_tar_source" 2>&1)"; then
  pass "package script accepts tarball metadata source"
else
  fail "package script accepts tarball metadata source"
  printf '%s\n' "$output" | sed 's/^/      /'
fi

if cmp -s "$archive" "$archive_from_tar_source"; then
  pass "tarball metadata source produces identical archive"
else
  fail "tarball metadata source produces identical archive"
fi

if output="$("$SCRIPT_UNDER_TEST" --allow-dirty --metadata-source "$metadata_zip" --output "$archive_from_zip_source" 2>&1)"; then
  pass "package script accepts zip metadata source"
else
  fail "package script accepts zip metadata source"
  printf '%s\n' "$output" | sed 's/^/      /'
fi

if cmp -s "$archive" "$archive_from_zip_source"; then
  pass "zip metadata source produces identical archive"
else
  fail "zip metadata source produces identical archive"
fi

incomplete_metadata="$TEST_ROOT/incomplete-metadata"
mkdir -p "$incomplete_metadata/skills/brainstorming/agents"
cp "$metadata_source/skills/brainstorming/agents/openai.yaml" \
  "$incomplete_metadata/skills/brainstorming/agents/openai.yaml"

set +e
missing_output="$("$SCRIPT_UNDER_TEST" --allow-dirty --metadata-source "$incomplete_metadata" --output "$TEST_ROOT/missing.tar.gz" 2>&1)"
missing_status=$?
set -e
if [[ "$missing_status" -ne 0 ]]; then
  pass "package script rejects incomplete metadata source"
else
  fail "package script rejects incomplete metadata source"
fi
assert_contains "$missing_output" "ERROR: metadata source is incomplete" "incomplete metadata reports clear error"

# Freeze new resources even when this suite runs before they are committed.
# The prior-package fixture deliberately lacks metadata for the fork skills.
if [[ -f "$REPO_ROOT/skills/writing-constitution/agents/openai.yaml" ]]; then
  fallback_repo="$TEST_ROOT/fallback-repo"
  fallback_metadata="$TEST_ROOT/prior-package-metadata"
  fallback_archive="$TEST_ROOT/fallback.zip"
  git clone -q --no-local "$REPO_ROOT" "$fallback_repo"
  cp "$SCRIPT_UNDER_TEST" "$fallback_repo/scripts/package-codex-plugin.sh"
  # Freeze the current skill set, including removals from a rename.
  rm -rf "$fallback_repo/skills"
  cp -R "$REPO_ROOT/skills" "$fallback_repo/skills"
  mkdir -p "$fallback_repo/templates"
  cp -R "$REPO_ROOT/templates/." "$fallback_repo/templates/"
  # Also give an existing skill local metadata to verify external precedence.
  mkdir -p "$fallback_repo/skills/brainstorming/agents"
  cp "$REPO_ROOT/skills/writing-constitution/agents/openai.yaml" \
    "$fallback_repo/skills/brainstorming/agents/openai.yaml"
  git -C "$fallback_repo" add scripts/package-codex-plugin.sh skills templates
  git -C "$fallback_repo" -c user.name='Package Test' -c user.email='package-test@example.invalid' \
    -c core.hooksPath=/dev/null commit -q -m 'Freeze packaging regression fixture'
  cp -R "$metadata_source" "$fallback_metadata"
  rm -rf "$fallback_metadata/skills/writing-constitution" "$fallback_metadata/skills/writing-design"

  # A dirty edit must not replace the fallback from the selected Git ref.
  printf '\n# uncommitted fixture metadata\n' >> \
    "$fallback_repo/skills/writing-constitution/agents/openai.yaml"
  if fallback_output="$(bash "$fallback_repo/scripts/package-codex-plugin.sh" \
    --allow-dirty --metadata-source "$fallback_metadata" --output "$fallback_archive" 2>&1)"; then
    pass "package accepts prior metadata without the new skill"
    fallback_paths="$(list_archive "$fallback_archive" | normalize_archive_paths)"
    assert_contains "$fallback_paths" "skills/writing-constitution/SKILL.md" "fallback archive includes renamed skill"
    assert_not_matches "$fallback_paths" "^skills/managing-product/" "fallback archive excludes replaced skill"
    assert_contains "$fallback_paths" "templates/CONSTITUTION.md" "fallback archive includes constitution template"
    assert_contains "$fallback_paths" "templates/README.md" "fallback archive includes template guide"
    assert_contains "$fallback_paths" "skills/writing-design/SKILL.md" "fallback archive includes technical documentation skill"
    for template in ARCHITECTURE STRUCTURE INFRASTRUCTURE; do
      template_path="templates/$template.md"
      assert_contains "$fallback_paths" "$template_path" "fallback archive includes $template template"
      assert_equals "$(read_archive_file "$fallback_archive" "$template_path")" \
        "$(git -C "$fallback_repo" show "HEAD:$template_path")" \
        "fallback archive preserves $template template bytes"
    done
    if [[ -f "$fallback_repo/skills/writing-design/agents/openai.yaml" ]]; then
      assert_equals "$(read_archive_file "$fallback_archive" skills/writing-design/agents/openai.yaml)" \
        "$(git -C "$fallback_repo" show HEAD:skills/writing-design/agents/openai.yaml)" \
        "technical documentation skill uses bundled fallback metadata"
    else
      fail "technical documentation skill has bundled fallback metadata"
    fi
    assert_equals "$(read_archive_file "$fallback_archive" skills/writing-constitution/agents/openai.yaml)" \
      "$(git -C "$fallback_repo" show HEAD:skills/writing-constitution/agents/openai.yaml)" \
      "fallback uses metadata from selected ref, not dirty edits"
    assert_equals "$(read_archive_file "$fallback_archive" skills/brainstorming/agents/openai.yaml)" \
      "$(cat "$fallback_metadata/skills/brainstorming/agents/openai.yaml")" \
      "external metadata takes precedence over bundled metadata"
    fallback_tar_archive="$TEST_ROOT/fallback.tar.gz"
    if fallback_tar_output="$(bash "$fallback_repo/scripts/package-codex-plugin.sh" \
      --allow-dirty --metadata-source "$fallback_metadata" --output "$fallback_tar_archive" 2>&1)"; then
      assert_equals "$(list_archive "$fallback_tar_archive" | normalize_archive_paths)" "$fallback_paths" \
        "tar.gz fallback archive contains the same resources as zip"
      assert_equals "$(read_archive_file "$fallback_tar_archive" skills/writing-constitution/agents/openai.yaml)" \
        "$(git -C "$fallback_repo" show HEAD:skills/writing-constitution/agents/openai.yaml)" \
        "tar.gz preserves bundled fallback metadata"
      if [[ -f "$fallback_repo/skills/writing-design/agents/openai.yaml" ]]; then
        assert_equals "$(read_archive_file "$fallback_tar_archive" skills/writing-design/agents/openai.yaml)" \
          "$(git -C "$fallback_repo" show HEAD:skills/writing-design/agents/openai.yaml)" \
          "tar.gz preserves technical documentation skill metadata"
      else
        fail "tar.gz technical documentation skill has bundled metadata"
      fi
      for template in ARCHITECTURE STRUCTURE INFRASTRUCTURE; do
        template_path="templates/$template.md"
        assert_equals "$(read_archive_file "$fallback_tar_archive" "$template_path")" \
          "$(git -C "$fallback_repo" show "HEAD:$template_path")" \
          "tar.gz preserves $template template bytes"
      done
    else
      fail "tar.gz package accepts prior metadata without the new skill"
      printf '%s\n' "$fallback_tar_output" | sed 's/^/      /'
    fi
    default_archive="$TEST_ROOT/_tmp/sup-codex-packaging/superpowered-$expected_version.zip"
    if default_output="$(bash "$fallback_repo/scripts/package-codex-plugin.sh" \
      --allow-dirty --metadata-source "$fallback_metadata" 2>&1)"; then
      assert_contains "$default_output" "Archive: $default_archive" "default archive name uses fork identity"
      if [[ -f "$default_archive" ]]; then
        pass "default archive exists with fork name"
      else
        fail "default archive exists with fork name"
      fi
    else
      fail "package script writes default fork archive"
      printf '%s\n' "$default_output" | sed 's/^/      /'
    fi
  else
    fail "package accepts prior metadata without the new skill"
    printf '%s\n' "$fallback_output" | sed 's/^/      /'
  fi

  rm -rf "$fallback_metadata/skills/brainstorming"
  # systematic-debugging has neither source nor bundled metadata in this fixture.
  rm -rf "$fallback_metadata/skills/systematic-debugging"
  set +e
  fallback_missing_output="$(bash "$fallback_repo/scripts/package-codex-plugin.sh" \
    --allow-dirty --metadata-source "$fallback_metadata" --output "$TEST_ROOT/fallback-missing.zip" 2>&1)"
  fallback_missing_status=$?
  set -e
  if [[ "$fallback_missing_status" -ne 0 ]]; then
    pass "fallback still rejects a skill missing metadata from both sources"
  else
    fail "fallback still rejects a skill missing metadata from both sources"
  fi
  assert_contains "$fallback_missing_output" "Missing OpenAI agent metadata for skill: systematic-debugging" \
    "fallback names skill missing metadata from both sources"
fi

dirty_repo="$TEST_ROOT/dirty-repo"
git clone -q --no-local "$REPO_ROOT" "$dirty_repo"
printf '\n# dirty fixture\n' >>"$dirty_repo/README.md"
set +e
dirty_output="$(
  cd "$dirty_repo"
  scripts/package-codex-plugin.sh \
    --metadata-source "$metadata_source" \
    --output "$TEST_ROOT/dirty.zip" 2>&1
)"
dirty_status=$?
set -e
if [[ "$dirty_status" -ne 0 ]]; then
  pass "package script rejects dirty worktree by default"
else
  fail "package script rejects dirty worktree by default"
fi
assert_contains "$dirty_output" "Working tree has uncommitted changes:" "dirty worktree reports changed files"

if [[ "$FAILURES" -eq 0 ]]; then
  echo "All Codex package archive tests passed"
else
  echo "$FAILURES Codex package archive test(s) failed"
  exit 1
fi
