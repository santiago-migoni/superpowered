---
name: writing-roadmap
description: Use when creating, reviewing, prioritizing or updating a product roadmap, release scopes, delivery progress or evidence of release outcomes.
---

# Writing Roadmap

Maintain product priorities in a roadmap index and outcomes and scope in one
file per product release. Documentation approval, delivery and validated results
are independent facts. This skill does not prepare publication or deployment.

## Recover Direction and Scope

Identify whether the request is review only, creation, a proposed priority/scope
change, or recording an authorized delivery. Reuse answered questions and approved
decisions; ask only for missing information that affects this result.

Locate `docs/superpowers/ROADMAP.md`, `releases/` and existing equivalents. Reuse
canonical sources or agree on migration before creating competing documents.
Read the index first, then only releases and upstream sections relevant to the
request. Do not load every historical release or rewrite the entire roadmap.

Follow the alignment hierarchy:

```text
Constitution
└── Architecture, Structure, Infrastructure
    └── Roadmap
        └── Spec
            └── Plan
```

Consult applicable purpose, objectives, principles and boundaries, and relevant
technical decisions and constraints. Record their source versions and authority;
code and historical notes do not establish approval. Missing or incomplete
technical descriptions can remain explicit dependencies; a complete technical
design is not required to draft a roadmap. Review-only or bounded recording work
does not require a new constitution interview.

For a new product direction or conflicting release scope, use writing-constitution
for the affected direction and writing-design for affected technical decisions.
Identify the conflict and needed review rather than silently redefine upstream
decisions or treat an unresolved dependency as permission to implement.

## Index and Release Records

Use [ROADMAP.md](../../templates/ROADMAP.md) for the index and
[RELEASE.md](../../templates/RELEASE.md) for `releases/vX.Y.Z.md`. Use product
release versions such as `v0.1.0`; do not invent the next version, a delivery date
or an approved scope when these remain undecided. A candidate version is a
proposal, not a commitment. Document metadata `version: v001` identifies a
revision of that document, not a product release.

| Record | Canonical responsibility |
|---|---|
| ROADMAP.md | Priority, rationale, sequence and relationships between releases, with links to their records. |
| releases/vX.Y.Z.md | Expected outcome, applicable objectives, scope, exclusions, dependencies, success evidence and existing spec references for that release. |
| Spec | Detailed behavior and acceptance of a concrete change. |
| Plan | Implementation tasks, order and execution checks. |

Link rather than copy release scope into the index or spec behavior into a release.
Keep dependencies owned by the release; the index may explain ordering through
those references. Use relevant constitution IDs and technical decision references.
Do not turn benchmark lists into approved scope. Create only the records needed
for the requested work, without generating specs, plans or application scaffolding.

## Decisions, Approval and Maintenance

Follow [shared metadata and maintenance rules](../../templates/README.md), the
requested document language, independent revisions and exact-base rules. On
Git milestones, follow [the shared workflow](../using-superpowers/references/git-workflow.md),
including exact prior commits of related approved releases before editorial edits.
If Git preservation is blocked, report pending work without snapshot fallback. On
creation, change or approval, check related references and reconcile authorized
current links/statuses; report protected stale sections. Do not add mandatory
archive trees or synchronize unrelated document revisions.

- **Review only:** return findings and gaps without editing content or metadata.
- **Propose priorities or scope:** show the affected changes, rationale,
  dependencies and pending decisions. Preserve the exact approved baseline before
  editing it. New records are `draft`; changed approved decisions use `in_review`,
  a new content version and `approval_reference: null` until approved.
- **Record approval:** identify responsible person/role, declaration, date,
  exact version and scope. Approval of one release does not approve the index's
  order, another release, technical choices, specs or plans. Partial approval
  leaves the rest pending. Explicitly accepted gaps may remain in an approved
  documentary base; unselected proposals stay unapproved.
- **Record delivery:** update only affected progress and evidence under the
  existing authorization. Do not reorder releases, enlarge scope or reopen
  unchanged decisions merely because an increment was delivered. Apply the
  guide's evidence revision rules, preserving the exact scope of unchanged
  approvals without claiming approval of new evidence. Do not change unrelated
  records for symmetry.

Represent delivery separately as `planned`, `in_progress` or `delivered`, and
outcome evidence as `pending`, `partially_validated` or `validated`. A draft
release record is not an approved delivery commitment; an approved record can
still be planned. Record actual delivery sources and evidence limits. Tests or
a build can support implementation but do not establish the intended user result.
Use `validated` only for the result and scope supported by evidence; retain
unmeasured outcomes or recovery checks as pending.

## Handoff

Return affected paths, document approval states, release progress, source
references and open decisions. Do not use documentary approval as authorization
to implement, publish or deploy. Continue spec or plan work only when separately
requested; brainstorming and writing-plans retain their existing change-design
and implementation-planning responsibilities.
