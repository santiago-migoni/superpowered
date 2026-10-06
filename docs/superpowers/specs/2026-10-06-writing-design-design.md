# Writing Design: Technical Documentation Workflow

Date: 2026-10-06
Status: proposed design; written-spec review pending
Scope: create, review and maintain architecture, structure and infrastructure
documents without replacing feature design or implementation planning

## Intent and Existing Decisions

The human partner selected one `writing-design` skill for three distinct
technical documents, alongside `writing-constitution` and a future
`writing-roadmap`. The spelling is `writing-design`, as agreed in the naming
discussion. Existing templates and metadata rules are reused.

This specification proposes the skill's detailed workflow and integration. It
does not record approval of those details, implementation or installation.

## Responsibility and Document Ownership

| Document | Canonical responsibility |
|---|---|
| `ARCHITECTURE.md` | System boundaries, logical components and responsibilities, contracts, data flows, quality constraints and architectural decisions. |
| `STRUCTURE.md` | Repositories, directories, modules, packages, entry points and code-placement conventions. |
| `INFRASTRUCTURE.md` | Environments, execution resources, networking, persistence configuration, deployment and operational evidence. |

Default project locations are `docs/superpowers/`. Existing equivalent documents
and runbooks can remain canonical; establish references or an agreed migration
before creating competing copies. A shared decision has one canonical record,
referenced by the affected documents. Each document describes its own facts.

A single skill follows the already selected division of responsibilities.
Separate skills per technical document would fragment cross-document changes;
absorbing this workflow into brainstorming would mix permanent descriptions
with the specification of a particular change.

## Entry Conditions and Scope

The skill applies when the requested work is creating, reviewing or updating
the technical documents, reconciling conflicting technical sources, or
maintaining affected descriptions as part of an authorized delivery.

1. Recover the authorized task and identify which documents and sections it
   affects. Work on those sections; one infrastructure request does not require
   writing architecture and structure from scratch.
2. Locate relevant technical sources, existing decisions, and applicable
   constitution constraints. Bound exploration to the requested system,
   repositories and environments.
3. Classify the work as review only, descriptive creation/update, or a proposed
   technical decision. Explain any unresolved conflict that affects the task.
4. Retain information already supplied; ask only unresolved questions that
   affect the requested result. Explicit unknowns can remain in a useful draft.

Review-only work returns findings without editing documents or metadata. A
descriptive technical review does not require creating a full constitution.
If the request includes a new feature or a change to product direction, retain
the existing constitution and brainstorming prerequisites for that work.

The absence of a technical document alone does not block a bounded correction,
require all three documents, or initiate a new technical interview.

## Evidence and Proposed Design

Inspect relevant code, configuration, contracts and available runtime evidence.
Identify the source revision or durable snapshot, relevant local changes,
environment and limits of inspection. Do not represent uninspected areas as
known or a live environment as established from configuration alone.

Record independently:

- Decision status and its approval source.
- Implementation or deployment state, supported by identified sources.
- Verification evidence, environment and remaining checks.

If no application exists, state that explicitly. Intended components, repository
layout and infrastructure remain proposed or approved but unimplemented. The
skill can describe and propose them without scaffolding code or provisioning
resources as a side effect of documenting them.

Infrastructure documentation references secret names and canonical locations,
not secret values. Existing configuration, successful startup, backup settings
and verified recovery establish different facts.

## Creation, Updates and Approval

Use the three existing English templates and their shared guide. Generated
prose follows the requested language; metadata keys and conventional states
remain unchanged. No new configuration or metadata schema is introduced.

- New documents start as drafts with explicit unknowns.
- Preserve stable ADR identifiers and existing decision records.
- Before changing approved decisions, preserve the exact prior approved content
  and approval using a reachable Git revision or durable snapshot outside
  `.superpowers/`. HEAD is unsuitable if it omits approved uncommitted content.
- Proposed changes to approved decisions use `in_review`, a new content version
  and no approval reference for the pending version.
- Present the complete scoped diff, its reasons, supporting sources and open
  decisions. Record approval only for the version and scope actually approved.
- Partial approval does not approve the entire document. Accepted pending checks
  remain explicit; document approval does not establish runtime verification.
- Descriptive updates from an approved implementation can accompany that
  delivery without reopening unchanged decisions. Follow the existing guide's
  version rules when the described system, organization or infrastructure
  changes; preserve the relevant implementation authorization and evidence.
- Reviewing or editing does not automatically update `reviewed_at`; recording
  a review requires authorization and an actual review.

Creating or approving technical documentation does not by itself authorize
feature implementation, deployment, publication or unrelated refactoring.

## Relationship With Existing Skills

`writing-constitution` owns durable product direction. `brainstorming` owns the
scope, alternatives and design of a requested change. `writing-plans` owns its
implementation tasks. The future `writing-roadmap` owns initiative priorities
and outcome tracking. `writing-design` owns permanent technical descriptions
and their decision references.

The initial brainstorming integration will consult relevant existing technical
documents and identify which descriptions the proposed change affects. When
creation or maintenance of those documents is part of the requested work, use
`writing-design` for that portion without introducing another feature-design
interview. Preserve brainstorming's existing spec, plan and approval paths.

Completing documentation alone ends with document paths, states, sources and
remaining decisions. Resume a feature workflow only when that work was already
requested and its existing prerequisites are met. Do not invoke brainstorming
and writing-design recursively for an unchanged decision.

## Delivery Boundary

Implementation will add `skills/writing-design/SKILL.md` and bundled OpenAI
metadata, update the active README and template guide, add the scoped
brainstorming integration, and extend relevant packaging coverage. Changes to
other workflow skills are deferred unless evaluation reveals a concrete broken
handoff within this scope.

Roadmap creation, release management, product code, infrastructure provisioning,
language configuration and publication are outside this implementation.
Prior uncommitted work in the repository remains separately identifiable.

## Evaluation and Acceptance

Use writing-skills to establish a baseline before authoring the production
skill. For behavioral guidance, compare at least five fresh-context samples per
variant on the same pressure scenario, manually inspect every sample, and
preserve inputs, resulting actions and evaluation limits. Add distinct pressure
cases for the remaining boundaries rather than claim coverage from one example.

Required cases include:

1. Existing code and declared infrastructure without runtime access: describe
   inspected implementation and configuration, retain operational unknowns.
2. An approved technical design with no application: keep intended components,
   code layout and infrastructure out of implemented-state claims.
3. An infrastructure-only update: retain existing architecture, structure and
   canonical runbooks; avoid duplicate decisions or automatic provisioning.
4. Review-only work under pressure to tidy metadata: return findings without
   mutations.
5. Changed approved but uncommitted decisions: preserve the exact source and
   approval before proposing a new version.
6. Approved feature delivery affecting all three descriptions: update affected
   facts and references without reopening unrelated decisions or expanding scope.
7. Conflicting existing documents or product constraints: surface the affected
   conflict and keep observations distinct from unapproved decisions.
8. Partial approval and pending recovery evidence: preserve approval scope and
   distinguish configured backups from verified restoration.

Check skill discovery metadata, canonical references, template resolution in the
package, existing registration and hook contracts, and archive contents. Source
evaluations and packaging checks do not establish installed Codex App activation.
Report native installation and session-continuity validation separately when
performed.

## Next Stage

Review this written specification before creating the implementation plan.
Plan review and execution-method selection precede production skill changes.
