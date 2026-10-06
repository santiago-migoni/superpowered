---
title: Architecture
status: draft
version: v001
responsible: null
created_at: null
updated_at: null
reviewed_at: null
approval_reference: null
---

# Architecture of [product name]

<!-- Template: describe system responsibilities, relationships and technical
decisions using identified sources. Repository organization belongs in
STRUCTURE.md; execution resources and operational configuration belong in
INFRASTRUCTURE.md. Reference those documents rather than duplicate them.
An approved decision is not evidence of implementation or runtime validation.
Keep unimplemented choices in decision records and proposed changes. Mark
unknown information explicitly and remove instructions and example rows when
completing the document. -->

## System Context and Boundaries

- **System responsibility:** [What the existing system does and its boundary.]
- **Product direction:** [Canonical constitution or equivalent, version and
  relevant principles or objectives; reference rather than repeat it.]
- **Implementation reference:** [Repository revision or identified source
  snapshot used for this description; record local changes if relevant.]
- **Current state:** [What is implemented; explicitly state if no application
  exists yet. Identify what has not been inspected.]
- **Related descriptions:** [Canonical structure and infrastructure documents,
  with relevant sections and source versions, or explicitly pending.]

| External system or actor | Interaction and boundary | Implementation source | Runtime evidence or pending check |
|---|---|---|---|
| [System or actor] | [Observed interaction and trust boundary] | [Code, configuration or other identified source] | [Evidence and environment, or pending verification] |

## Components and Responsibilities

<!-- Describe logical components and their responsibilities here. Reference
their code locations in STRUCTURE.md and their execution resources in
INFRASTRUCTURE.md. A planned component belongs in Proposed Changes until there
is implementation evidence. -->

| Component | Responsibility | Boundary and dependencies | Implementation source |
|---|---|---|---|
| [Component] | [What it owns] | [What it depends on and what it does not own] | [Source reference] |

[Optional diagram of the implemented components and their relationships.
Distinguish unknown areas from inspected ones.]

## Interfaces and Contracts

| Interface | Producer and consumer | Contract and failure behavior | Implementation source |
|---|---|---|---|
| [Interface] | [Components or external systems] | [Protocol, relevant inputs/outputs, errors and compatibility boundary] | [Source or existing contract reference] |

## Data Flows and Canonical Sources

| Flow | Origin and destination | Canonical source and ownership | Consistency or failure behavior | Evidence |
|---|---|---|---|---|
| [Flow] | [Observed path] | [Authoritative store or source and who may change it] | [What is implemented, or explicitly unknown] | [Source and relevant verification] |

[Reference important flows such as writes, reads, background work or recovery
when they exist. Keep proposed flows in Proposed Changes.]

## Technical Constraints and Quality Attributes

| Constraint or attribute | Required behavior and decision source | Current implementation or verification evidence | Gap or unknown |
|---|---|---|---|
| [Constraint or attribute] | [Explicit requirement and its authority, or proposed requirement] | [What the code establishes and what was actually checked] | [Unimplemented or unverified behavior] |

<!-- Separate requirements from observed results. Code inspection can show an
implementation; it does not establish performance, recovery or deployment
guarantees without the corresponding evidence. -->

## Architectural Decisions

### ADR-001 — [Decision name]

- **Choice:** [Technical choice and affected boundary.]
- **Rationale:** [Why this choice addresses the identified need.]
- **Alternatives considered:** [Relevant alternatives and trade-offs.]
- **Consequences:** [Benefits, costs, constraints and migration implications.]
- **Decision status:** [proposed / approved / superseded / rejected]
- **Decision source:** [Responsible person or role, date and approval reference,
  or pending approval. Do not infer approval solely from existing code.]
- **Implementation state:** [not_implemented / implemented / unknown]
- **Implementation and verification evidence:** [Source revision and checks
  with their environment and limits; explicitly mark pending verification.]

<!-- Keep ADR identifiers stable. Reference an existing canonical decision
record instead of maintaining a duplicate. Historical implementation and its
evidence remain identifiable when a decision is replaced. -->

## Proposed Changes and Pending Implementation

| Change | Decision or specification reference | Difference from current architecture | Evidence needed before describing it as implemented or verified |
|---|---|---|---|
| [Change] | [ADR identifier and canonical source] | [Affected components, contracts or flows] | [Implementation references and required checks] |

<!-- Include approved but unimplemented decisions here as well as proposals.
Approval, implementation and verification are independent facts. Delivery
priority belongs in the roadmap; tasks and commands belong in plans. -->

## Open Items

| Missing information or unresolved decision | Evidence or decision needed | Responsible person or role |
|---|---|---|
| [Unknown] | [Inspection, validation or explicit decision] | [Person or role; pending confirmation] |

## Change History

| Date | Version | Change and rationale | Implementation or decision reference |
|---|---|---|---|
| [YYYY-MM-DD] | [Version] | [Affected architectural description or decision] | [Commit, durable snapshot or approval evidence] |
