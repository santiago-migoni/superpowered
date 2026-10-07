# Product Documentation Templates

These templates are reusable Superpowered resources. Each project's documents
are stored in `docs/superpowers/` and tracked in Git:

- [CONSTITUTION.md](CONSTITUTION.md): durable product direction.
- [ARCHITECTURE.md](ARCHITECTURE.md): system responsibilities, relationships and technical decisions.
- [STRUCTURE.md](STRUCTURE.md): repository and code organization.
- [INFRASTRUCTURE.md](INFRASTRUCTURE.md): execution resources, environments and operation.
- [ROADMAP.md](ROADMAP.md): release priority, sequence and relationships.
- [RELEASE.md](RELEASE.md): outcome, scope, dependencies and evidence for one product release.
- [SPEC.md](SPEC.md): user stories, acceptance criteria and shared constraints for one release.
- [PLAN.md](PLAN.md): implementation tasks and verification for that release's specification.

These are templates for adopting projects, not descriptions of the fork itself.
Use `writing-constitution` for constitutions and
[writing-design](../skills/writing-design/SKILL.md) for the technical documents.
Use [writing-roadmap](../skills/writing-roadmap/SKILL.md) for the roadmap index
and release records. Use [writing-spec](../skills/writing-spec/SKILL.md) for
release specifications and [writing-plans](../skills/writing-plans/SKILL.md) for
their implementation plans. Plugin language configuration is separate work.

## Create or Review a Constitution

1. Review existing product documentation and locate its approved source. If a
   constitution already exists, review it before creating another. If it lives
   at a different path, agree on a reference or migration that preserves a
   single canonical source without duplicating separately maintained content.
2. Complete the template with your human partner and identified sources. Code
   exploration can provide technical context; it does not establish a product
   mission, priority, or approval.
3. Keep unknown fields marked as pending. Separate proposals, approved decisions,
   and observed evidence. Do not fill in targets or dates merely to make the
   document look complete.
4. Present the draft to the responsible person or role. Record the scope of
   their decision: approving one section does not automatically approve the rest.
5. Save the document and its approval references in Git. Remove instructions
   and example rows that no longer apply.

## States and References

The YAML metadata at the top is the single source of the document's metadata.
Do not duplicate it in the body. Section statuses and decision history describe
their own scope; they do not replace the document's status.

| Field | Purpose |
|---|---|
| `title` | Document title. |
| `status` | A single value: `draft`, `approved`, `in_review`, or `superseded`. |
| `version` | Independent document revision: `v001`, `v002`, etc. Apply the revision rules below; this is not the product release number. |
| `responsible` | Text identifying the person or role that approves the document. |
| `created_at` | Creation date of the project's document; preserve it. |
| `updated_at` | Date of the most recent edit. |
| `reviewed_at` | Date of the most recent content review; editing does not imply reviewing. |
| `approval_reference` | Verifiable decision record identifying the exact approved content, responsible person, date and scope. Maintenance does not enlarge that approval. |

Use quoted text for dates in `YYYY-MM-DD` format. `null` indicates pending
information; do not invent values. Set `created_at` when creating the project's
document, rather than using the template's creation date.

- **`draft`:** contains content or decisions pending review or approval.
- **`approved`:** the applicable decisions are approved with exact content and
  scope identified; measurements may remain pending if explicitly accepted.
  Maintenance retains only unchanged decision authority as described below.
- **`in_review`:** changes are proposed. Identify the last approved version
  through a reachable Git revision or a durable version snapshot, and
  distinguish pending changes.
- **`superseded`:** a canonical document replaces this one; link to it.

When recording approval, complete `responsible` and `approval_reference` for
the exact presented version. When proposing changes to approved decisions, use
`in_review` and leave `approval_reference: null` until the new version is
approved. Preserve the previous approval in the decision history and reference
the exact previous approved content. Use a reachable Git revision when it
contains that content. If it is uncommitted, save a durable version snapshot
including metadata and approval outside `.superpowers/` before editing, then
link to that snapshot. Do not invent a Git revision or substitute an older one
that omits approved changes. Editorial corrections may retain approval if they do not alter
decisions.

The most recent review records a date; it does not guarantee that the content
is current. If discrepancies with later decisions arise, surface them before
using the affected content as authority. An unapproved edit does not replace
an approved decision.

## Document Revisions and Related References

Apply these rules across writing-constitution, writing-design, writing-roadmap,
writing-spec and release planning in writing-plans. Keep one current canonical
file per document; historical bases are evidence, not parallel maintained copies.
Each document has its own revision. A product release such as `v0.1.0`, a
document revision such as `v003`, and the plugin version are independent.

| Event | Revision and authority |
|---|---|
| Elaborate a working draft | Start at v001; iterate within that working revision until presenting it. Do not create snapshots for every question or save. |
| Substantively revise presented content | Increment once for the next working revision, not for each intermediate edit. New unapproved content stays draft. Changes to approved decisions use in_review and approval_reference null; retain the previous approved authority separately. |
| Record approval or fix editorial wording, links or current status references | Retain the revision and unchanged approval scope. Approval must identify the exact content presented; recording it is not a substantive revision. |
| Change descriptions of implemented structure/infrastructure or add material delivery, completion or verification evidence | Increment once per scoped maintenance update, grouping its intermediate edits/checks; a later material update starts another revision. Preserve unchanged decision approvals and their original exact scope; evidence is not a new decision approval. If decisions also change, use in_review and approval_reference null for the proposed revision. |
| Read-only review or no-op | Do not change files, revisions or dates. An explicitly authorized review record may update reviewed_at without a content revision. |

Editorial means the meaning, obligations, acceptance criteria, approach and
evidence claims stay unchanged. Rewording a criterion to require new behavior is
substantive even when called a typo. A reference change to a different behavioral
base requires impact review; it is not automatically editorial. Keep created_at;
update updated_at on edits and reviewed_at only for an actual authorized review.

Partial approval records only the accepted scope; the whole document remains
draft or in_review until its remaining decisions are approved or explicitly
accepted as open. Unaffected approved decisions remain available from their
identified base. Keep approval_reference null for whole-document approval while
it is draft or in_review; record partial approvals in the scoped decision history.
Evidence-only maintenance may retain approved when no approved
decision changes: state which decision approval remains applicable and which
evidence is new, rather than claiming that the original approver approved the
new complete revision. Approval, execution authorization, delivery and validated
outcomes remain separate.

When later evidence contradicts an earlier result, retain the earlier record
as historical and revise the current claim/status to what the available evidence
supports. A failed check does not automatically erase a delivered increment or
reopen an unchanged decision; it can invalidate the claimed outcome or verification.

Preserve exact presented content when recording approval and exact approved
content before modifying it. Prefer a reachable Git revision containing those
bytes, including metadata; reuse an existing identical durable snapshot when
available. Otherwise preserve only the needed base outside .superpowers/ and
link it from the canonical record. Do not use HEAD for uncommitted content,
overwrite historical evidence, force a snapshot directory layout, or duplicate
an already reproducible base. Record substantive changes, approval and evidence
scope in the existing decision/change history; a bounded editorial correction
needs only a concise trace when it affects authority or reproducibility.

On creation, authorized modification or approval, inspect relevant references
along Constitution → Architecture/Structure/Infrastructure → Roadmap/release →
Spec → Plan, including current references back to an approved dependent document.
Use canonical links and stable IDs; inspect affected neighbors, not every file.
Reconcile stale existence, status and source references when the authorized work
includes their maintenance. Narrow file limits and read-only requests take
precedence: report the exact protected path/section, stale claim and needed
correction without editing it. This check does not authorize creating missing
documents, expanding scope or launching another workflow.

Keep approval declarations and historical references literal. Do not repoint
an approved Plan to an unapproved changed Spec or rewrite completed tasks and
results. Identify affected future tasks and blockers before adopting a changed
base. Reconciliation alone does not synchronize revision numbers or reopen
unchanged approvals.

An exact reference identifies an immutable approved base, distinct from a link
to the current canonical document. Hashes are optional; when used, state their
domain (for example complete file including metadata) and verify the bytes.
Never refresh an approved-base hash to mutable current content. If an existing
current-file hash becomes stale after an editorial edit, repair that current
reference within authorization, preserving the approved-base reference; report
it otherwise. Avoid reciprocal current-file hashes and self-referential hashes;
use immutable bases for exact dependency references instead.

Keep `PRI-`, `OBJ-`, and `EXI-` identifiers stable: add new identifiers without
renumbering or reusing retired ones. Specifications can reference them without
copying the entire constitution. When a decision depends on a particular version,
include its Git revision or durable snapshot reference.

## Proportional Use

The constitution contains durable user outcomes, product-level success criteria,
and boundaries across increments. Keep field lists, interface and persistence
choices, delivery exclusions, and acceptance checks in the increment's design
or existing scope record. Link that scope to the applicable PRI-, OBJ-, and
EXI- identifiers and constitution version. Before a design exists, retain the
requested scope in the conversational handoff to brainstorming; this does not
require an additional document or authorize a design or plan automatically.

Consult the sections relevant to the task. A bounded change can reference
applicable principles or objectives in its conversational design; using this
template does not require an additional specification or plan.

Update the constitution when what it defines changes. Tasks, stage priorities,
and delivery outcomes belong in the roadmap; technical components and contracts
belong in the architecture. A task does not require approval of the entire
constitution again.

Use [writing-constitution](../skills/writing-constitution/SKILL.md) to create, review,
or update the constitution. [Brainstorming](../skills/brainstorming/SKILL.md)
requires applicable approved product direction before designing new features.
Point corrections and read-only feasibility probes retain their existing paths.
Plugin language configuration is a subsequent step; for now, generated content
follows the language requested by your human partner.

## Create or Maintain an Architecture

1. Locate the existing canonical architecture and relevant technical decisions.
   Reuse them or agree on migration before creating another source. Reference
   the applicable constitution and source version without copying its content.
2. Inspect relevant code, configuration, contracts and available runtime
   evidence. Record the revision or identified snapshot used. Describe what
   exists now; if there is no implementation, state that explicitly and retain
   the intended design in Architectural Decisions and Proposed Changes.
3. Keep three facts separate: decision approval, implementation and verification.
   A document marked `approved` can contain approved choices not yet implemented.
   Use implementation references for implemented claims, and actual checks with
   their environment and limits for verified claims. Leave unknowns explicit.
4. Keep stable ADR identifiers and reference existing decision records. Record
   who decided, when, why and with what consequences. Existing code establishes
   implementation, not business or architectural approval by itself.
5. Update affected components, contracts and flows with the delivery that
   changes them. Move a planned component into the implemented description only
   when supported by implementation evidence; retain pending runtime checks.
   Record the source and affected version in the change history.
6. Proposed technical choices require the applicable design approval. Descriptive
   updates resulting from an approved implementation can accompany that delivery
   without reopening unchanged decisions or demanding whole-document approval.
   A new or changed architectural decision still needs an explicit decision.
   Preserve the previous approved content and evidence before changing it, using
   the Git revision or durable snapshot rules above.
7. Keep priorities in the roadmap and delivery tasks in plans. Consult and update
   only relevant sections; the existence of this template does not require an
   architecture interview or a complete rewrite for every bounded correction.

The document metadata describe its review and approval state. Per-decision
statuses and implementation states describe their own scope. Reviewing alone
does not authorize edits or changes to `reviewed_at`; record approval only for
the version actually presented. Architectural descriptions and evidence remain
in permanent versioned documentation, independent of `.superpowers/` cleanup.

## Keep the Technical Documents Focused

| Document | Canonical content | References to related content |
|---|---|---|
| Architecture | Logical components, responsibilities, contracts, flows, constraints and decision rationale. | Code locations in Structure; execution resources and operational evidence in Infrastructure. |
| Structure | Repositories, paths, modules, entry points and placement or naming conventions. | Component responsibilities and architectural decisions in Architecture; deployment procedures in Infrastructure or existing runbooks. |
| Infrastructure | Environments, resources, networking, persistence configuration, deployment and operational mechanisms. | Logical contracts and data ownership in Architecture; configuration file locations in Structure. |

A decision that affects several documents has one canonical record, normally an
architectural decision. The other documents reference it and describe their own
affected facts. For example, Architecture records the database choice and data
ownership; Structure records the data-access module location; Infrastructure
records database provisioning, storage and recovery evidence.

Create or maintain Structure by inspecting the relevant repository revision,
recording actual paths and conventions, and mapping modules to architectural
components. Keep proposed reorganizations separate until implemented. An
observed convention does not by itself establish approval of a new rule.

Create or maintain Infrastructure from identified configuration and available
runtime evidence for each environment. Distinguish declared resources from
observed deployment and verified behavior. Reference canonical operational
procedures and secret locations without copying secret values. If there is no
deployed environment, state that explicitly and record intended resources as
proposals; do not fabricate operational results.

Apply the shared metadata, approval preservation and source-reference rules to
both documents. Update only affected sections when code organization or
infrastructure changes. Existing documents and runbooks remain canonical unless
a migration is agreed; reference them rather than maintain competing copies.
Document creation is proportional to the project and requested work. These
templates do not make every document a prerequisite for every task.

## Create or Maintain a Roadmap

Use an index at `docs/superpowers/ROADMAP.md` and one canonical record per product
release at `docs/superpowers/releases/vX.Y.Z.md`. The index owns priority and
sequence; a release owns its outcome, scope, exclusions, dependencies and
success evidence. Reference specs for detailed behavior and acceptance and
plans for execution; do not create them automatically.

Alignment proceeds from constitution through relevant architecture, structure
and infrastructure to roadmap, spec and plan. Consult applicable decisions and
source versions; missing technical details remain explicit dependencies rather
than forcing a complete design interview. Upstream conflicts need an identified
review before the affected scope is adopted.

Product versions such as `v0.1.0` identify deliveries; metadata `version: v001`
identifies document revisions. Keep the existing metadata rules above. Approval
of a release is independent of approval of index priorities or other releases.
Represent delivery as `planned`, `in_progress` or `delivered` and outcome
validation as `pending`, `partially_validated` or `validated` in the release
record. These fields do not replace document approval metadata.

Record actual delivery and measured results separately; tests or completion do
not by themselves validate the user outcome. Update only affected records and
evidence, preserving unchanged priorities and approvals. Apply the common
revision and related-reference rules above without synchronized revision numbers
or a mandatory snapshot layout.

## Specify and Plan a Release

Use one specification and one plan per release:

```text
docs/superpowers/
├── releases/v0.1.0.md
└── specs/v0.1.0/
    ├── SPEC.md
    └── PLAN.md
```

The release owns its outcome, boundaries, dependencies and delivery evidence.
SPEC.md details expected behavior with user stories and acceptance criteria;
PLAN.md organizes implementation tasks and checks against that spec. Reference
upstream content rather than copying it. Release approval does not automatically
approve its spec or plan; neither template requires creating other documents
outside the authorized work.

Keep stories in the spec and checkbox tasks in the plan, without separate files
per story or task. Use stable US-001 and T-001 identifiers for simple traceability.
A task can serve several stories and a story can require several tasks. Put
shared technical constraints in the spec rather than inventing user stories for
them. Omit empty open-item and blocker sections; use only relevant detail.

Identify the applicable release and exact spec revision. Apply the existing
metadata and approval preservation rules; product release numbers and document
revisions remain distinct. A change to scope or behavior belongs in the spec
and, when needed, the upstream release or technical decision before it becomes
an authorized task. Routine implementation choices within authorized scope do
not require separate approval rounds.

Spec approval accepts the defined change; plan approval accepts the approach.
Execution requires authorization, which can accompany approval in one message.
Record task completion and actual acceptance-check results separately. Passing
these checks does not automatically validate the release's overall outcome;
record applicable delivery and outcome evidence in its canonical release.

For release work, writing-spec and writing-plans use these templates. Planning
without an assigned release retains its existing workflow; these resources do
not impose release documentation on bounded corrections. For execution tools
that extract tasks, writing-plans expands checkbox tasks under `Task N` headings
while retaining T-001 identifiers and story references. Apply the common revision
and related-reference rules above.
