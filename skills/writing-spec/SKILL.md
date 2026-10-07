---
name: writing-spec
description: Use when creating, reviewing or updating a product release specification, user stories, acceptance criteria or shared behavioral requirements.
---

# Writing Spec

Define what one release must do and how its behavior will be accepted. Use one
canonical SPEC.md per release; stories live inside it, tasks in its PLAN.md.

## Recover the Applicable Base

Identify review, drafting, change or approval recording. Read the relevant
release, existing spec and applicable constitution and technical decisions.
Reuse answered questions and canonical equivalents; agree on migration before
creating competing documents. Ask one relevant missing decision at a time.
Read-only review reports findings without editing files or metadata.

Record source versions and distinguish approved decisions, proposals and actual
evidence. Release approval does not approve the spec; benchmark lists do not
approve capabilities. If a requested story conflicts with release scope or
upstream constraints, identify it as a proposal and the affected decision;
continue unaffected drafting without silently adopting the conflict. Use
writing-roadmap, writing-constitution or writing-design only for authorized
changes to the corresponding source.

## Write the Specification

Use [SPEC.md](../../templates/SPEC.md) and the
[shared guide](../../templates/README.md). For an identified release, save at
`docs/superpowers/specs/vX.Y.Z/SPEC.md`. Reuse an existing canonical location.
If the release is unknown, clarify it rather than invent a version. Work without
a release retains brainstorming's existing design path and location.

Keep these parts:

- Context and outcome: link the release and applicable direction/design.
- Scope and exclusions: summarize relevant boundaries and reference their source.
- User stories: stable US-001 identifiers, user, capability and benefit, with
  observable acceptance criteria including relevant failure and access behavior.
- Shared constraints: cross-story rules and referenced technical decisions.
- Open items: actual unresolved decisions, their effect and needed resolution;
  omit the section when empty.

One release can contain several stories without a file per story. Technical
constraints need not become artificial user stories. Detail behavior enough to
check it; leave implementation tasks to the plan. Preserve unknown contracts,
targets and source gaps explicitly instead of choosing them to finish a draft.
An unresolved criterion remains a gap, not an acceptance check that passed.

Self-review story coverage against the release, observable criteria, conflicting
requirements and unintended scope. Fix wording; present substantive unresolved
decisions rather than selecting them without authorization.

## Approval and Continuity

Apply shared metadata and baseline-preservation rules. Use the requested language;
product release numbers and document revisions differ. Preserve exact approved
content before proposing changes, including uncommitted approvals through a
durable snapshot when no reachable Git revision contains them. Record who
approved, when, the exact revision and scope; partial approval leaves the rest
pending. Do not copy approval from the release or architecture.

Return the spec path, applicable sources, status and remaining decisions. Spec
approval accepts the defined change, not a future plan or execution. Use
writing-plans when planning is also requested; if preparing both drafts, keep
the plan's dependency on unapproved spec decisions explicit. Existing explicit
authorization can cover approval and execution in one message; it cannot approve
an artifact that has not yet been presented.

Updating an approved spec's behavior requires review of the affected plan before
executing its tasks. Completing acceptance checks supports the specified
behavior; release delivery and overall outcome evidence remain in the release.
