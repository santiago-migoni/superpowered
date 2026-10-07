---
name: writing-constitution
description: Use when defining or reviewing product purpose, principles, objectives, or boundaries, creating or updating a product constitution, or preparing a new feature without an applicable approved constitution.
---

# Writing Constitution

Establish durable product direction through a constitution. Product alignment
does not authorize a feature: each change also needs an approved scope.

This stage covers constitutions only. Use the requested document language;
keep metadata keys and status values unchanged. Plugin language configuration
is future work.

## Entry and Context

Locate `docs/superpowers/CONSTITUTION.md` and relevant existing product
documentation. Follow a superseded document's canonical reference. If an
equivalent source lives elsewhere, agree on reuse or migration rather than
maintaining duplicate constitutions. An approved equivalent must provide the
purpose, objectives, principles, and boundaries needed for the proposed work.

Use [the template](../../templates/CONSTITUTION.md) and
[its metadata and maintenance rules](../../templates/README.md) when creating
or updating a constitution. Search relevant sources, not the entire repository
indiscriminately. Code explains implementation; it cannot approve a mission
or business priority.
For persistent work, follow [the shared Git workflow](../using-superpowers/references/git-workflow.md):
commit the reviewed presentation and later approval record; verify exact bases
before edits. A blocked Git milestone is pending, not a new snapshot fallback.

| Request | Action |
|---|---|
| New feature, no applicable approved constitution | Establish and approve product direction before feature design. |
| Approved constitution applies | Read relevant sections; continue without another full interview or approval. |
| Review only | Report findings; do not edit solely because a review was requested. |
| Create or update constitution | Produce a draft or scoped revision for review. |
| Point correction, read-only analysis, or read-only feasibility probe | Continue its existing workflow; creating a full constitution is not a prerequisite. |

## Create or Update

1. Recover known decisions and their sources. Summarize what is confirmed,
   proposed, and unknown; do not repeat answered questions.
   Organize them by document: the constitution holds durable user outcomes,
   product principles, product-level success criteria, and boundaries across
   increments. Field lists, interface and persistence choices, delivery
   exclusions, and acceptance checks belong to the increment's design or
   existing scope record. Connect that scope to the applicable PRI-, OBJ-,
   and EXI- identifiers and constitution version. If no design exists yet,
   retain the scope in the handoff to brainstorming; no extra document is
   required. A feature request can support an existing objective; a new
   objective expresses a distinct durable user outcome, not the delivery itself.
2. Ask short questions, one at a time, starting with the problem, people served,
   and value. Offer wording your human partner can correct. Unknown baselines,
   targets, and dates remain explicit open items.
3. Save a draft at `docs/superpowers/CONSTITUTION.md`, or the agreed canonical
   location. Preserve stable identifiers and update only affected sections.
   Before changing approved decisions, preserve the previous content and its
   approval through an exact Git commit and repository-relative path. Register
   approved uncommitted bytes before editing; do not substitute an older HEAD.
4. Present the document or complete scoped diff, its rationale, and pending
   decisions. A session may end with a useful draft.
5. Record explicit approval of the presented version. Include who approved,
   when, and a durable reference to the decision. If chat approval has no
   recoverable link, preserve the approving statement and its scope in the
   decision history and reference that entry. Remove example rows and reconcile
   section statuses with the approval actually given.

## Approval and Handoff

Use `draft` for new unapproved content, `in_review` for proposed changes to
approved decisions. Record `approved` only for the exact presented content and
scope explicitly approved; evidence-only maintenance can retain unchanged
decision authority under the shared rules without claiming new approval.
Partial approval leaves the whole document pending. Pending measurements may
remain in an approved version if explicitly accepted; unresolved product
decisions do not become approved by association. Follow the template guide for
independent revisions, exact bases, dates, and approval references. On creation,
change or approval, apply its related-reference check; reconcile authorized
current references and report protected stale sections without editing them.
Reviewing without edits can update
`reviewed_at` only when recording the review is authorized.

For new features, wait for applicable approved direction before feature design.
Read-only exploration can continue. If a revision is pending, use unaffected
decisions from the preserved approved version; resolve conflicts and missing
decisions affecting the feature first.

Return the document path, state, and remaining decisions. Resume brainstorming
only if a feature request was already authorized; completing a constitution
alone does not start feature work. Bounded changes keep conversational designs.
Architecture, roadmap and publication are not automatic follow-ups. Scoped
document commits follow the shared Git milestones; they do not authorize those
other workflows or execution.

## Common Mistakes

| Temptation | Required response |
|---|---|
| "The demo is soon; design the feature first." | Establish applicable approved direction first. |
| "It advances an objective, so include it." | Keep additional features as proposals until authorized. |
| "The mission was approved, so mark the document approved." | Record the partial scope; keep the document pending. |

Red flags: inferring business approval from code, treating a draft as authority,
overwriting the last approved version, or changing principles to justify a feature.
