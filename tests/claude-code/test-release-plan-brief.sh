#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
WORK="$(mktemp -d)"
trap 'rm -rf "$WORK"' EXIT
cat > "$WORK/PLAN.md" <<'PLAN'
---
status: draft
---
# Implementation Plan
## Reference and Approach
**Spec:** SPEC.md v003
## Tasks
### Task 1: T-001 — Observation
- [ ] Implement observation. US-001.
#### Checks
```markdown
### Task 2: This is an example, not a task
```
### Task 2: T-002 — Authorization
- [ ] Apply authorization. US-002.
#### Checks
- [ ] Exercise denied access.
## Verification
- [ ] Verify all stories.
## Blockers
No blockers.
PLAN
bash "$ROOT/skills/subagent-driven-development/scripts/task-brief" "$WORK/PLAN.md" 1 "$WORK/one.md" >/dev/null
bash "$ROOT/skills/subagent-driven-development/scripts/task-brief" "$WORK/PLAN.md" 2 "$WORK/two.md" >/dev/null
python3 - "$WORK" <<'PY'
from pathlib import Path
import sys
p=Path(sys.argv[1]);one=(p/'one.md').read_text();two=(p/'two.md').read_text()
assert 'US-001' in one and 'This is an example' in one and 'US-002' not in one
assert 'US-002' in two and 'denied access' in two
assert '## Verification' not in two and '## Blockers' not in two, 'Task brief swallowed release-wide verification/blockers'
PY
if bash "$ROOT/skills/subagent-driven-development/scripts/task-brief" "$WORK/PLAN.md" 3 "$WORK/absent.md" >/dev/null 2>&1; then
  echo 'Missing task unexpectedly extracted' >&2
  exit 1
fi
echo 'Release plan task extraction passed'
