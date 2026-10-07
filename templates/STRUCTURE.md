---
title: Structure
status: draft
version: v001
responsible: null
created_at: null
updated_at: null
reviewed_at: null
approval_reference: null
---

# Software Structure of [product name]

<!-- Template: describe the actual organization of repositories and code using
identified sources. Explain where things belong without copying architectural
decisions or operational procedures. Mark unknowns and remove instructions and
example rows when completing the document. -->

## Scope and Source References

- **Repositories covered:** [Canonical repositories and inspected boundaries.]
- **Implementation reference:** [Exact Git commit and paths for each repository;
  identify relevant uncommitted work and uninspected areas.]
- **Architecture reference:** [Canonical architecture, source version and
  relevant components; explicitly pending if unavailable.]
- **Current state:** [Organization observed; explicitly state if code does not
  exist yet. Keep an intended layout under Proposed Changes.]

## Repository Layout

```text
[Relevant directories and entry points from the inspected repository.]
```

| Path | Purpose | Content or ownership boundary | Source reference |
|---|---|---|---|
| [Existing path] | [What belongs here] | [What this area contains and owns] | [Repository and revision] |

<!-- Show relevant paths, not an exhaustive file inventory. Identify generated
or external content when its location matters; avoid listing temporary output. -->

## Modules, Packages and Entry Points

| Module or package | Code location | Architectural component reference | Entry points and dependency locations |
|---|---|---|---|
| [Existing module] | [Canonical path] | [Component or explicitly unmapped] | [Entrypoints, manifests or imports with source references] |

<!-- Record where dependencies are declared and observed in code. Explain the
reason for component boundaries in ARCHITECTURE.md rather than repeating it. -->

## Placement and Naming Conventions

| Content type | Canonical location and naming | Convention source or approval reference |
|---|---|---|
| [Source, tests, documentation, configuration or migrations] | [Observed convention or explicitly proposed rule] | [Repository evidence or explicit decision] |

<!-- Distinguish an observed pattern from an agreed rule. Include only
conventions that help contributors place or find relevant content. -->

## Proposed Changes

| Change | Difference from current layout | Decision or specification reference | Evidence needed to describe it as implemented |
|---|---|---|---|
| [Proposed reorganization] | [Affected paths or modules] | [Canonical decision or pending approval] | [Revision and relevant import, build or discovery checks] |

## Open Items

| Missing information or unresolved decision | Evidence or decision needed | Responsible person or role |
|---|---|---|
| [Unknown] | [Inspection, validation or explicit decision] | [Person or role; pending confirmation] |

## Change History

| Date | Version | Change and rationale | Implementation or decision reference |
|---|---|---|---|
| [YYYY-MM-DD] | [Version] | [Affected organization or convention] | [Exact Git commit:path and applicable approval/evidence] |
