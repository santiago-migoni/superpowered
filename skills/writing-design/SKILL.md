---
name: writing-design
description: Use when creating, reviewing, reconciling or updating a product's architecture, code structure or infrastructure documentation, including affected technical descriptions during an authorized delivery.
---

# Writing Design

Maintain permanent technical descriptions with identifiable sources, decisions
and evidence. Work on the documents and sections affected by the authorized
task; documenting a system does not authorize implementing or deploying it.

## Entry and Canonical Sources

Recover the requested result and classify it as review only, descriptive
creation/update, or a proposed technical decision. Retain answered questions;
ask only for missing information that affects this result. Explicit unknowns
can remain in a useful draft.

Locate relevant documents in `docs/superpowers/` and existing equivalents,
decision records and runbooks. Follow superseded sources to their replacements.
Reuse canonical sources or agree on migration before creating competing copies.
Bound exploration to affected repositories, components and environments.

Consult applicable constitution constraints. A descriptive review or bounded
correction does not require creating a constitution or all three technical
documents. If the request includes a new feature or a product-direction change,
retain the existing writing-constitution and brainstorming prerequisites for
that work. Missing technical documents alone do not block a bounded correction.

| Document and template | Owns |
|---|---|
| [ARCHITECTURE.md](../../templates/ARCHITECTURE.md) | Logical components, responsibilities, contracts, flows, constraints and architectural decisions. |
| [STRUCTURE.md](../../templates/STRUCTURE.md) | Repositories, paths, modules, packages, entry points and code-placement conventions. |
| [INFRASTRUCTURE.md](../../templates/INFRASTRUCTURE.md) | Environments, execution resources, networking, persistence configuration, deployment and operational evidence. |

A decision has one canonical record. Reference it from other documents and
describe their own affected facts: database choice and data ownership in
architecture, data-access code location in structure, provisioning and recovery
in infrastructure. Refer to existing operational procedures rather than copy
them into separately maintained instructions.

## Inspect and Describe

1. Identify inspected code, configuration, contracts and available runtime
   evidence. Record exact source Git commits/paths, relevant
   local changes, environment and inspection limits.
2. Describe current facts in the relevant sections. Logical responsibilities
   belong in architecture; observed code organization in structure; resources
   and operations by environment in infrastructure. An observed pattern is not
   automatically an approved convention.
3. Record decision approval, implementation/deployment and verification as
   independent facts. Code can establish implementation; configuration declares
   resources. Runtime checks support only the behavior, environment and limits
   actually checked. Configured backups do not prove successful recovery.
4. Keep proposed and approved-but-unimplemented choices in decision records and
   proposed-change sections. If no application or deployed environment exists,
   state that explicitly. Unknowns, uninspected areas and pending checks remain
   explicit; do not fill them with assumptions.
5. Reference secret names and canonical locations without copying their values.
   A documentation task does not require provisioning resources, executing
   deployment procedures, scaffolding code or unrelated refactoring.

When sources conflict, report the affected discrepancy and their versions.
Describe observations as observations; resolve the relevant decision before
treating a conflicting source as authority. Unaffected approved decisions can
continue to guide the authorized task.

## Create, Review or Update

Follow [the shared metadata and maintenance rules](../../templates/README.md).
Follow [the shared Git workflow](../using-superpowers/references/git-workflow.md)
for presentation, approval-recording and update commits, including related files.
Apply its independent revision, exact-base and related-reference rules when
creating, changing or approving a document. Reconcile authorized current
references; report protected stale sections without editing them.
Use the requested document language; keep metadata keys and conventional states
unchanged. Plugin language configuration is separate work.

| Request | Result |
|---|---|
| Review only | Findings, source references and gaps; no edits to content or metadata. |
| Create descriptions | Draft only the requested documents, removing examples and retaining explicit unknowns. |
| Maintain an approved delivery | Update affected descriptions and evidence under that authorization; keep unrelated decisions intact. |
| Propose or change technical decisions | A scoped revision with rationale, alternatives, consequences and the decision still pending approval. |

Preserve stable ADR identifiers and reference existing decision records. Before
changing approved decisions, preserve the exact approved content and its approval
using its exact Git commit and repository-relative path. Register approved
uncommitted bytes before editing; HEAD cannot preserve content it lacks. Git
blockers leave preservation pending, without creating a new snapshot fallback.

New documents use `draft`. Proposed changes to approved decisions use `in_review`,
a new content version and `approval_reference: null`. Present the complete scoped
diff, rationale, sources and open decisions. Record approval only for the version
and scope actually approved; partial approval does not approve the whole document.
An approved document can retain explicitly accepted pending verification.

Descriptive updates resulting from approved implementation can accompany that
delivery without reopening unchanged decisions or demanding approval of the
whole document. Increment the descriptive/evidence revision under the shared
rules, retaining only the unchanged decision approval and its exact scope;
do not claim approval of the new evidence. Preserve the
authorization and evidence, and seek a decision only for new or changed choices.
Editing alone does not imply review; recording `reviewed_at` requires an actual
review and authorization to record it.

## Handoff and Limits

Return document paths, changed sections, states, source references and remaining
decisions or checks. A documentation-only task ends there. Resume feature work
only when already requested and its existing prerequisites are satisfied.

Brainstorming owns the design of a particular change; writing-plans owns its
implementation tasks. This skill owns permanent technical descriptions. Keep
product direction in the constitution and priorities in the roadmap. Do not
restart brainstorming for an unchanged decision or use document approval as
permission to implement, deploy or publish.

Common mistakes: duplicating canonical decisions, describing intended layout as
existing code, inferring production readiness from configuration, overwriting
approved uncommitted content, editing during review-only work, or rewriting all
three documents for a change affecting only one.
