# Planning a Product Release

Use one `PLAN.md` beside the canonical release `SPEC.md`, normally at
`docs/superpowers/specs/vX.Y.Z/`. Reuse existing equivalents rather than create
competing plans. Read [PLAN.md](../../../templates/PLAN.md) and the
[shared guide](../../../templates/README.md); keep its metadata and sections.
This route replaces the dated path, mandatory legacy header and subsystem-plan
split for release work. Decompose implementation into tasks within one plan.

## Recover and Plan

Read the spec's exact revision, approval scope, user stories and shared
constraints, relevant release dependencies, code and technical decisions.
Release approval does not approve the spec or plan. If both drafts are requested,
planning can proceed with explicit dependencies on unapproved decisions; it
does not make the work executable. Ask only missing questions that affect tasks.

Follow [the shared Git workflow](../../using-superpowers/references/git-workflow.md)
for exact approved spec commit/path references, Plan presentation and subsequent
approval-recording commits. HEAD cannot identify uncommitted approved changes;
register the actual approved base before editing. A blocked Git milestone is
pending, without new snapshot fallback. Never repoint to an unapproved spec,
substitute an older commit missing approval or approve from release metadata.

Use Reference and Approach, Tasks, Verification and relevant Blockers. Put stable
T-001 identifiers and US-001 references on checkbox tasks. Show affected paths,
dependencies and relevant implementation details where needed to execute them.
Each story's criteria must have a corresponding verification step inside a
numbered task; use a final numbered verification task for cross-story checks
when needed. The Verification section references those steps and records their
results; it is not a separate queue the executor can skip. Record actual
results and evidence only after checks run. Shared tasks may serve several
stories. Keep blocked contracts explicit rather than invent endpoints, signatures
or technologies. Missing decisions can block affected tasks without preventing
planning the rest.

For authorized use of executing-plans or subagent-driven-development, give each
task an extractable numbered heading and enough detail for a task brief:

```markdown
## Tasks

### Task 1: T-001 — Record inventory observations
- [ ] T-001 — Implement the observation contract. US-001.
**Files:** [inspected paths to create/modify/test]
**Interfaces:** [decided contracts consumed/produced, when relevant]
- [ ] [Concrete implementation step]
- [ ] [Acceptance check for US-001 with command and expected result]

## Verification
- [ ] US-001 — [Check owned by Task 1, result and evidence when run]
```

The numbered heading supports existing task extraction; T-001 remains the stable
task identifier. Add detail for actual dependencies and risks rather than copying
the entire spec or forcing a fixed number of tests or review-focus items. General
constraints live in the spec or Reference and Approach; executors read both.

## Review, Maintenance and Handoff

Review coverage, coherent paths/contracts, task dependencies, negative cases and
proportionality. Confirm every Verification entry has a numbered task that runs
it, or an explicit blocker; unit tests alone do not cover unassigned acceptance
checks. A behavior or scope change discovered while planning requires
review of the affected spec and upstream decision before execution; routine
choices within the authorized scope do not require another approval round.
Read-only review leaves files and metadata unchanged.

Apply shared metadata, baseline preservation and approval-reference rules. Record
the exact plan revision and approval scope. Apply the guide's independent
revision and related-reference rules on creation, change or approval; reconcile
authorized current references and report protected stale sections. Do not
silently adopt an unapproved changed spec or refresh its approved-base hash.
Preserve completed work and evidence when authorized updates change
only future tasks. Review affected tasks when the referenced spec changes.

Return path, spec revision, coverage, status and blockers. Plan approval accepts
the approach; execution requires explicit authorization, which may accompany
approval in one message. Planning-only requests stop at presentation. When the
presented plan is approved and execution is authorized, retain the selected
method; if none was selected, ask once which execution method to use. Use the
existing executing-plans or subagent-driven-development handoff; do not execute
while the required decisions remain pending. Task completion and acceptance
checks do not automatically mark a release delivered or its outcome validated.
