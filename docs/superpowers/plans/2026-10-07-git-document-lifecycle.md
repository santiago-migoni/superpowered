# Git Document Lifecycle Implementation Plan

> **For agentic workers:** Use writing-skills to evaluate behavior changes before editing the skills. Implementation starts only after this plan is approved; retain the execution method selected by the human partner.

**Goal:** Make Git the required history for persistent product documentation and align the plugin's design, planning, execution and completion transitions with that history.

**Architecture:** One shared Git workflow reference, with narrow integrations in existing skills. Keep document revisions and approval semantics in templates/README.md. Existing execution scripts and temporary workspaces keep their responsibilities.

**Tech Stack:** Markdown skills/templates, Git, existing Bash/Python test tooling; no new runtime dependencies.

**Spec:** The agreed policy in this conversation, summarized below; existing source baseline is commit `78e46bcc07457aba47b6dadecb1cad91a46b333d` (Codex 6.8.0). Approval of the presented plan is recorded below.

## Agreed scope and constraints

- Persistent documentation, decisions, code and durable evidence use the adopting project's Git repository. The plugin's repository is a separate source history.
- Reuse the applicable repository, including linked worktrees; initialize an identified project root when a new project has no repository and the task permits writes/commits. Clarify an ambiguous root before initialization. Read-only requests do not initialize or commit.
- Git is required for persisted milestones. A request forbidding commits, missing Git, missing author identity or denied write permissions leaves the Git milestone pending; report the concrete limitation. Do not replace it with a new Markdown snapshot or invent a commit.
- Group intermediate edits into presentation, approval-recording and authorized-update milestones. Document revision, product release and plugin version remain independent; not every commit increments a document revision.
- Commit A identifies presented content. After explicit approval, commit B records the decision and references A plus the document path and approval scope. Do not embed B's own hash in B or infer approval from commit existence.
- Preserve an exact existing approved base in Git before editing it. If approved content is uncommitted, register those actual bytes first, with their existing approval provenance; do not substitute an older HEAD or fabricate historical commit dates.
- Historical snapshots remain literal evidence. Do not delete them or rewrite prior approvals as a side effect. New work uses Git history and one canonical file per document.
- Related current references are reconciled within authorization. Approved dependencies stay pinned until an authorized changed base is approved; completed tasks and historical results remain literal.
- Temporary .superpowers workspaces remain ignored. Durable outcomes needed after cleanup belong in versioned deliverables; not every temporary log becomes a tracked artifact.
- Preserve pre-existing user changes, including index state. Stage only the owned change; do not sweep unrelated staged files into a commit, force-add ignored documents, reset/stash user work or initialize nested repositories automatically.
- Commit permission does not authorize execution, push, merge or publication. No new feature interview, extra document per bounded change, automatic tags per document or generic scaffold is introduced.

## Review Focus

1. Wrong repository: documentation outside the cwd, linked worktrees and paths under an unrelated parent repository. T-001/T-002 own boundary checks.
2. Dirty index and mixed ownership: user-staged files and pre-existing edits in affected paths. T-001/T-002/T-005 verify preservation and scoped commits.
3. Approval provenance: approved uncommitted bytes, partial approvals, editorial updates and self-referential hashes. T-003 owns these scenarios.
4. Old dependency versus new proposal: a Plan references approved Spec while current Spec is in_review. T-003/T-004 own pinning and impact tests.
5. Missing or forbidden Git persistence: read-only request, no-commit instruction, missing identity or commit failure. T-002/T-005 require truthful pending state and no snapshot fallback.

## Tasks

### Task 1: T-001 — Establish behavior baselines and executable fixture checks

**Files:**
- Create: `tests/documentation/git-lifecycle-scenarios.md`.
- Create: `tests/documentation/check-git-lifecycle.py`.
- Later record results: `docs/superpowers/specs/2026-10-07-git-document-lifecycle-validation.md` and an evidence JSON beside it.

**Interfaces:** Scenario fixtures and transcripts feed an independent read-only checker. It receives a fixture path, expected milestone/reference records and pre-work hashes/index inventory; it checks actual Git state and file bytes, not whether skill prose contains keywords. Fixtures live in an isolated temporary directory.

- [ ] Define cases for fresh project, existing repo, linked worktree, read-only/no-commit, dirty index, approval, partial approval, substantive change, editorial related-reference update, evidence update and no-op.
- [ ] Run representative cases against current 6.8.0 instructions in fresh sessions before editing skills. Record actual operations, returned paths and Git state. Report passes, gaps and failures honestly; do not invent a RED result when the agent complies.
- [ ] Make the checker demonstrate detection of a missed commit, wrong approved-base pin and unrelated file committed using controlled fixtures; valid fixtures must pass. The checker creates no production implementation or fake product approval.
- [ ] Expected: pre-work hashes/index state and before/after transcripts are retained; missing required Git history is observable. Use `python3 tests/documentation/check-git-lifecycle.py --help` for the documented checker invocation once implemented.

### Task 2: T-002 — Define the shared Git workflow and entry points

**Files:**
- Create: `skills/using-superpowers/references/git-workflow.md`.
- Modify: `skills/using-superpowers/SKILL.md`.
- Modify: `skills/using-superpowers/references/codex-tools.md` only where current Git/worktree guidance needs alignment.

**Interfaces:** The reference owns repository discovery, initialization boundaries, milestone commits and commit verification. It is loaded for persistent deliverable work, not every read-only answer. It respects native worktree ownership and existing human instructions.

- [ ] Specify Git discovery through `git rev-parse`, including a .git file in linked worktrees; confirm that the intended document paths belong to the identified project repository.
- [ ] Specify new-project initialization, initial content recording and author/commit failure handling, without fallback snapshots or an unrelated parent/nested repository.
- [ ] Define scoped staging/commit behavior with prior index/worktree state and explicit path ownership. A failed or prohibited commit is reported as pending, not as a saved Git milestone.
- [ ] Define evidence of a milestone: resolving commit, correct document path and exact expected bytes through `git show COMMIT:PATH`; report the identifier only after verification.
- [ ] Connect the bootstrap with a short conditional reference; preserve existing voice, rationalization tables and process routing.
- [ ] Run the T-001 repo/worktree/read-only/dirty-index cases in fresh sessions. Expected: correct boundary, only authorized commits, unrelated state unchanged and no new versions/ tree.

### Task 3: T-003 — Integrate all product-document routes and remove the fallback

**Files:**
- Modify: `templates/README.md`, `templates/PLAN.md`, `templates/ARCHITECTURE.md`, `templates/STRUCTURE.md`, `templates/INFRASTRUCTURE.md`.
- Modify: `skills/writing-constitution/SKILL.md`, `skills/writing-design/SKILL.md`, `skills/writing-roadmap/SKILL.md`, `skills/writing-spec/SKILL.md`.
- Modify: `skills/writing-plans/references/release-plans.md`.

**Interfaces:** Product rules retain statuses, independent revisions and IDs; exact dependencies become commit + repository-relative path. Approval records identify presented content and human decision scope. Existing snapshot references stay historical.

- [ ] Replace Git-or-snapshot preservation for new canonical work with required Git bases and milestones. Link the shared operational reference instead of repeating its commands in five skills.
- [ ] Present committed draft content; record subsequent approval in another commit. Keep approval_reference pointing to a scoped decision record, which identifies the presented commit. Preserve partial-approval null/global-status rules.
- [ ] Handle already approved uncommitted content and snapshot-era inputs by recording their actual current provenance in Git; no fabricated earlier commit or automatic deletion of archives.
- [ ] Apply the rule to every related approved document edited during reconciliation, including release records. Preserve its exact prior Git content even for editorial updates.
- [ ] Verify substantive Spec revision and affected Plan future tasks; approved pins/history remain on the old base until the changed base is adopted under actual authorization.
- [ ] Run approval, partial approval, same-revision editorial update, evidence-only revision and related-release cases. Expected: exact content recoverable with git show, no false approval/execution, existing histories and stable IDs preserved.

### Task 4: T-004 — Align design, generic planning, execution and completion

**Files:**
- Modify: `skills/brainstorming/SKILL.md`, `skills/writing-plans/SKILL.md`.
- Modify: `skills/executing-plans/SKILL.md`, `skills/subagent-driven-development/SKILL.md` only at dependency/commit handoffs.
- Modify: `skills/verification-before-completion/SKILL.md`, `skills/finishing-a-development-branch/SKILL.md` only at durable-deliverable verification points.
- Modify: `skills/using-git-worktrees/SKILL.md` only if boundary guidance conflicts with T-002; otherwise retain it unchanged.

**Interfaces:** Existing task/review BASE..HEAD ranges and execution ledgers remain intact. Both dated and release plans use the shared Git milestones. Read-only and bounded conversational routes retain their proportional workflow.

- [ ] Align brainstormed written-spec presentation and post-self-review commits so the presented bytes actually match the recorded commit.
- [ ] Make generic and release Plan presentation identify persisted content; keep plan approval, method choice and execution authorization separate.
- [ ] Verify applicable approved dependency commits before affected execution. Preserve current task commit ranges and review-package behavior; no mandatory whole-document reapproval for unchanged decisions.
- [ ] Verify tracked durable outcomes before declaring Git-backed completion or deleting scratch; preserve unsupported checks as pending. Do not blanket-track temporary ledger files.
- [ ] Run generic-plan, release-plan and bounded-correction scenarios. Expected: no invented release, extra specification or automatic execution/push; documented dependencies and executed ranges remain reproducible.

### Task 5: T-005 — Verify integration, packaging and document the local results

**Files:**
- Modify: `tests/codex/test-package-codex-plugin.sh` to assert the new shared reference's selected-ref bytes in ZIP and tar.gz fixtures.
- Complete T-001 validation/evidence records.
- Modify: `docs/BACKLOG.md` to distinguish source implementation, local evaluations and native validation pending.

- [ ] Run fresh pressure sessions across the T-001 matrix with updated skills. Independently inspect commits, pinned content, index/worktree preservation, unchanged approvals/results and absence of new snapshot fallbacks.
- [ ] Run `bash tests/codex/test-package-codex-plugin.sh` and `bash tests/codex/test-marketplace-manifest.sh`. Expected: selected-ref resource checks and metadata fallback pass; packages contain the shared reference.
- [ ] Run `bash tests/claude-code/test-release-plan-brief.sh`, `bash tests/claude-code/test-executing-plans-scripts.sh` and `bash tests/claude-code/test-sdd-workspace.sh`. Expected: existing extraction, ledger and workspace tests pass.
- [ ] Run `git diff --check` and resolve new relative reference links. Review the full scoped diff; disclose any failures/untested host behavior and verify no unrelated staged content entered milestone commits.
- [ ] Save baseline/updated outcomes and actual fixture evidence. Passing local sessions is not a claim of native automatic activation.

### Task 6: T-006 — Publish when authorized and validate installed behavior

**Files:**
- Release-only: `.codex-plugin/plugin.json` and release/validation notes under the existing Codex release process.

- [ ] After implementation review, perform the requested version bump, commit and push when authorized. Do not add tags or synchronize other harness versions solely for symmetry.
- [ ] After the human partner updates Codex App, prepare a fresh project copy under an isolated test root, initialize its own Git repository and register the imported actual document/source base. Preserve the original sandbox.
- [ ] In new native conversations, test draft presentation, approval, continuity, substantive Spec change with approved Plan pin, editorial related-release update and failure/no-commit handling without manually naming the skills.
- [ ] Inspect native transcripts and repositories: commit/path resolves to exact presented/approved bytes; histories and task results preserved; no snapshot fallback; no unrequested execution or delivery claim.
- [ ] Close validation only for observed cases. Git-unavailable/prohibited cases must remain explicit pending outcomes, not successful persistence.

## Execution handoff

The recommended implementation method is inline execution: shared policy and
cross-skill edits depend on one consistent contract. Independent evaluators may
run the baseline/pressure scenarios required by writing-skills. The execution
method and approval of this plan remain for the human partner; no skill behavior,
test implementation, plugin release or sandbox migration is performed by creating
this planning document.

## Approval — 2026-10-07

The human partner approved the plan with the exact statement: «Aprobado el plan.»
The presented content is commit `9ab032ccc5a7ff45c06950277153bc5c0c073dd7`, path
`docs/superpowers/plans/2026-10-07-git-document-lifecycle.md`. Implementation proceeds
inline with independent behavior evaluators as described in the plan. T-006 keeps
publication and installed native validation conditional on their stated authorization
and host update; no release or push is implied by this approval record.
