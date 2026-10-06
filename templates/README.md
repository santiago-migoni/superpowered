# Product Documentation Templates

These templates are reusable Superpowered resources. Each project's documents
are stored in `docs/superpowers/` and tracked in Git:

- [CONSTITUTION.md](CONSTITUTION.md): durable product direction.
- [ARCHITECTURE.md](ARCHITECTURE.md): system responsibilities, relationships and technical decisions.
- [STRUCTURE.md](STRUCTURE.md): repository and code organization.
- [INFRASTRUCTURE.md](INFRASTRUCTURE.md): execution resources, environments and operation.

These are templates for adopting projects, not descriptions of the fork itself.
Use `writing-constitution` for constitutions and
[writing-design](../skills/writing-design/SKILL.md) for the technical documents.
Roadmap management and plugin language configuration are subsequent steps.

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
| `version` | Content version in the format `v001`, `v002`, etc. Increment when decisions or the described system, code organization or infrastructure change; editorial corrections do not require a new version. |
| `responsible` | Text identifying the person or role that approves the document. |
| `created_at` | Creation date of the project's document; preserve it. |
| `updated_at` | Date of the most recent edit. |
| `reviewed_at` | Date of the most recent content review; editing does not imply reviewing. |
| `approval_reference` | Verifiable reference identifying who approved this version, when, and where the decision was recorded. |

Use quoted text for dates in `YYYY-MM-DD` format. `null` indicates pending
information; do not invent values. Set `created_at` when creating the project's
document, rather than using the template's creation date.

- **`draft`:** contains content or decisions pending review or approval.
- **`approved`:** the responsible person or role approved this version;
  measurements may remain pending if they are identified and explicitly accepted.
- **`in_review`:** changes are proposed. Identify the last approved version
  through a reachable Git revision or a durable version snapshot, and
  distinguish pending changes.
- **`superseded`:** a canonical document replaces this one; link to it.

Before setting `approved`, complete `responsible` and `approval_reference` for
the current version. When proposing changes to approved decisions, use
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
