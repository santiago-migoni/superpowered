# Product Documentation Templates

These templates are reusable Superpowered resources. Each project's constitution
is stored in `docs/superpowers/CONSTITUTION.md` and tracked in Git.
`templates/CONSTITUTION.md` is not the constitution of the fork itself.

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
| `version` | Content version in the format `v001`, `v002`, etc. Increment when product decisions change; editorial corrections do not require a new version. |
| `responsible` | Text identifying the person or role that approves the document. |
| `created_at` | Creation date of the project's constitution; preserve it. |
| `updated_at` | Date of the most recent edit. |
| `reviewed_at` | Date of the most recent content review; editing does not imply reviewing. |
| `approval_reference` | Verifiable reference identifying who approved this version, when, and where the decision was recorded. |

Use quoted text for dates in `YYYY-MM-DD` format. `null` indicates pending
information; do not invent values. Set `created_at` when creating the project's
constitution, rather than using the template's creation date.

- **`draft`:** contains product decisions pending approval.
- **`approved`:** the responsible person or role approved this version;
  measurements may remain pending if they are identified and explicitly accepted.
- **`in_review`:** changes are proposed. Identify the last approved version
  through a reachable Git revision or a durable version snapshot, and
  distinguish pending changes.
- **`superseded`:** a canonical constitution replaces this one; link to it.

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

Use [managing-product](../skills/managing-product/SKILL.md) to create, review,
or update the constitution. [Brainstorming](../skills/brainstorming/SKILL.md)
requires applicable approved product direction before designing new features.
Point corrections and read-only feasibility probes retain their existing paths.
Plugin language configuration is a subsequent step; for now, generated content
follows the language requested by your human partner.
