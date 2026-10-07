# Git History for Persistent Work

Git is required for persistent deliverables: product documents, written designs,
plans, code and durable results. Use the adopting project's repository; the
plugin installation's repository does not own that project's history.
Temporary briefs, review packages and ledgers in .superpowers/ stay ignored.
Read-only questions and conversational designs do not create Git milestones.

## Locate the Project Before Writing

Identify the authorized project root and affected paths. From that project run
`git rev-parse --show-toplevel` and inspect `git status --short` and the existing
index. A .git file is valid in a linked worktree; do not require a .git directory.
Confirm the document paths belong to the intended repository. Do not choose an
unrelated ancestor repository, initialize a nested repository, use the plugin
cache, or move canonical documents merely to make Git work. Clarify an ambiguous
root. Follow existing native worktree ownership and human worktree preferences.

For a new project with an identified root, initialization is part of authorized
persistent work: initialize there when writes and commits are permitted. Git
setup does not authorize product scaffolding, dependency installation or a
remote. Read-only work never initializes or changes a repository.

Git unavailable, missing author identity, denied Git writes, a failed commit or
an explicit no-commit request means the Git milestone is pending. Report the
concrete reason. Do not silently set global identity, fabricate a SHA or use a
new Markdown snapshot as fallback. Clarify missing project identity when needed.
Preserve read-only analysis/proposals in the response. If an approved base cannot
first be preserved in Git, do not edit it. New uncommitted drafts may be retained
as incomplete work when writing is authorized, clearly labeled uncommitted;
they are not presented as Git-backed milestones or approved executable bases.

## Commit Owned Milestones

Group intermediate edits into a reviewed presentation, approval recording or
authorized update; do not commit every interview answer or no-op. Document
revision, product release number and plugin version are independent of commits.

Before a commit, identify owned paths and compare the intended diff, working
bytes and pre-existing index entries. Preserve user changes. Stage only the
owned change; do not use broad git add -A, force-add ignored documents, reset,
stash or amend/rewrite old evidence. If a path mixes unapproved user edits with
your work, resolve ownership before committing it. Ignored canonical documents
need an explicitly authorized tracking change, not a hidden force-add.

Unrelated staged paths must not enter the commit. An explicit-path commit such
as `git commit --only -m "docs: present release spec" -- docs/superpowers/specs/v0.1.0/SPEC.md`
can leave other staged paths intact; use it only when those complete working
files are owned/authorized. Confirm unrelated index entries and bytes afterward.
Do not clean or commit the whole worktree just to obtain a clean status.

After committing, resolve the full object ID, inspect changed paths and verify
each expected file with `git show COMMIT:repository/relative/path`. Its bytes
must match what you claim to present/preserve. A successful command alone, an
old HEAD, a hash of an uncommitted file or a diff summary does not prove that.
Report the verified commit and paths; if the commit failed, report pending work.

## Exact Bases and Approval

An exact source reference is a resolving commit plus repository-relative path,
for example `FULL_COMMIT:docs/superpowers/specs/v0.1.0/SPEC.md`. Include the
document revision and decision scope when relevant. A canonical link identifies
the current document; it does not pin the approved content.

1. Self-review the draft, commit the exact presented content as A and present
   A:path for human review. If review changes substantive content, commit and
   present that revised content before recording its approval.
2. Only after explicit human approval, record responsible person/role, date,
   literal declaration, scope and A:path in the document's decision history.
   Commit that record as B. B is evidence of recording approval; it does not
   invent approval of unpresented changes or authorize execution.
3. Keep approval_reference pointing to the scoped decision entry. That entry
   identifies A; it must not contain B's own hash. A later dependency can pin
   B:path when it needs both the approved content and its decision record.
4. Partial approval retains the pending whole-document status and records only
   its actual scope. Commits can contain proposals or pending evidence; Git
   existence is never human approval, implementation or measured validation.

Before changing any approved document, including a related release edited only
for current references, verify a commit contains its actual prior content and
approval record. Reuse that exact commit. If the approved bytes are uncommitted,
register those actual bytes first under existing authorization; inspect any
mixed user changes. An older commit missing the recorded approval is not the
base. If the record cannot be committed, stop that edit and report the blocker.

Existing snapshot-era content can be imported into the project history with
its actual provenance and prior decisions intact. Record that import now; do
not fabricate a historical Git date or prior approval of new content. Historical
snapshots and declarations remain literal; do not delete them as migration.
New work uses one canonical file and Git history, not another versions/ tree.

Keep exact approved dependency pins immutable. A changed Spec in_review does
not replace the Plan's approved base. Review affected future tasks and adopt a
new pin only under actual approval/authorization. Editorial reconciliation may
change canonical links/statuses, not historical declarations or approved pins.
Optional checksums must state their domain; never refresh an approved-base hash
to current proposal bytes. Avoid reciprocal current-file and self hashes.

## Completion and Handoff

Verify applicable document commits and approval scope before executing affected
tasks. Continue existing task BASE..HEAD ranges and evidence checks. Commit
durable outcomes/decisions needed after scratch cleanup in the canonical Plan,
release or existing permanent record within authorization; do not mark a blocked
task complete or blanket-track the temporary ledger to satisfy Git.

Before claiming a persistent milestone or cleaning scratch, confirm those
owned deliverables and references are recoverable from Git. Leave unrelated
dirty files alone. State any pending commits/checks honestly. Local commits do
not authorize execution, push, merge, tags, release publication or deployment;
those retain their existing authorization and finishing workflows.
