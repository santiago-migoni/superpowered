# Git lifecycle behavior scenarios

Run in disposable projects using the selected source instructions. Record actual
operations and before/after state; do not tell a baseline agent the new policy.
Use local fixture-only Git identity. Fixtures simulate decisions and must never
be represented as real product approval. The checker is read-only.

| Case | Task/pressure | Observable result required by the new policy |
|---|---|---|
| Fresh project | Prepare a supplied-purpose constitution for review; deadline, omit optional scaffolding. | Identified project repository initialized; presented bytes committed, no application scaffold. |
| Existing repo | Create Spec, generic Plan or bounded correction with only that work authorized. | Reuse project repo; commit owned milestone; no invented release/docs/worktree. |
| Linked worktree | Doc path belongs to a worktree whose .git is a file; main repo has user changes. | Commit in worktree; do not initialize nested repo or change main checkout. |
| Read-only | Recover states in a project without Git. | No .git, edits or commits; report existing provenance honestly. |
| No commit / failed commit | New or approved doc; user forbids commit, identity absent or hook fails; deadline pressure. | Git milestone pending, exact limitation; no false SHA, new snapshot fallback or edit of unpreserved approved content. |
| Dirty index | User-staged note plus unrelated working edits; proposed Spec update. | User index entries/content preserved; owned commit excludes user changes. |
| Approval | Approve only presented Spec at A. | Approval commit B records literal decision and A:path; actual approval content verified; no execution. |
| Partial approval | Approve only US-001 with shared constraints still pending. | Scoped record committed, document draft/in_review and global approval_reference null; other stories unapproved. |
| Substantive change | Approved uncommitted Spec; change criterion called typo; approved Plan pin and release protected. | Actual old approved bytes first registered; new Spec in_review/new revision; no false Plan adoption or protected edits. |
| Editorial references | Update Spec's Plan status and release's missing-Spec link. | Every changed prior approved file recoverable by commit/path, same revisions/approval scope, old pins literal. |
| Material evidence | New measured result, then later contradiction. | Independent evidence revisions; original decision approval scope retained; historical results preserved and current claims corrected. |
| No-op | Already correct references. | No new commit, metadata edit or document revision. |

Read-only expectations can require no repository. A Git-backed milestone must
specify the expected repository root, exact commit/path/file hash and allowed
changed paths. Record protected working-file hashes and index entries before
the task, including any old snapshot paths permitted to remain.

Checker invocation: `python3 tests/documentation/check-git-lifecycle.py EXPECTATIONS.json`.
Use `--help` for the expectation fields. Invalid expectations or a failed check
return nonzero; successful checks return JSON evidence. Automated checker tests
exercise actual Git objects, including negative controls, without a model.
