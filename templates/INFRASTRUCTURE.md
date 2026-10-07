---
title: Infrastructure
status: draft
version: v001
responsible: null
created_at: null
updated_at: null
reviewed_at: null
approval_reference: null
---

# Software Infrastructure of [product name]

<!-- Template: describe resources, environments and operational configuration
using identified sources. Configuration does not prove that resources are
deployed, healthy or recoverable. Keep observed state, declared configuration
and proposed changes distinct. Mark unknowns and remove instructions and
example rows when completing the document. -->

## Scope and Source References

- **Environments covered:** [Local, test, staging or production environments
  actually inspected; explicitly identify exclusions and unknowns.]
- **Architecture reference:** [Canonical architecture, source version and
  relevant components or decisions; explicitly pending if unavailable.]
- **Configuration reference:** [Exact Git commit and paths of deployment
  configuration; reference its location in STRUCTURE.md when applicable.]
- **Runtime evidence:** [Checks, environment and observation date, or pending
  inspection. Do not infer a live environment from configuration alone.]

## Environments and Execution Resources

| Environment | Resource or service | Executed component and purpose | Configuration source | Observed state and evidence |
|---|---|---|---|---|
| [Environment] | [Host, container, managed service or local process] | [Architecture component reference] | [Canonical configuration] | [Observed state and date, or unknown] |

## Networking and External Access

| Environment | Connection or entry point | Routing and access configuration | Source and runtime evidence |
|---|---|---|---|
| [Environment] | [Relevant endpoint or service connection] | [DNS, proxy, TLS, ports or access boundary as applicable] | [Configuration and checks, or pending verification] |

<!-- Logical application contracts belong in ARCHITECTURE.md. Describe how
connections are provisioned and exposed here, with environment-specific facts. -->

## Storage, Backup and Recovery

| Environment and resource | Persistence configuration | Backup and retention | Recovery procedure reference | Verification evidence or gap |
|---|---|---|---|---|
| [Database, volume or object store] | [Location, persistence lifecycle and configuration source] | [Implemented policy or explicitly pending] | [Canonical runbook or pending procedure] | [Actual restore checks and limits, or unverified] |

<!-- Data ownership and consistency decisions belong in ARCHITECTURE.md.
A configured backup is not evidence of successful recovery. -->

## Configuration and Secret References

| Environment | Setting or secret name | Purpose | Authoritative configuration or secret location |
|---|---|---|---|
| [Environment] | [Name only] | [Required behavior or dependent resource] | [Configuration path or secret manager reference; never secret values] |

## Deployment and Operation

| Environment | Operation | Mechanism and procedure reference | Responsible person or role | Evidence or pending validation |
|---|---|---|---|---|
| [Environment] | [Provision, deploy, update, rollback or start/stop] | [Existing automation, configuration or canonical runbook] | [Role or pending confirmation] | [Actual execution and limits, or unverified] |

<!-- Reference detailed procedures where they already live. Record unavailable
procedures explicitly rather than inventing commands or deployment guarantees. -->

## Observability and Operational Limits

| Environment | Signal or limit | Collection, alerting or enforcement mechanism | Evidence or known gap |
|---|---|---|---|
| [Environment] | [Logs, health, metrics, capacity or availability] | [Existing configuration or explicitly proposed mechanism] | [Observed behavior and checks, or unknown] |

<!-- Architectural quality requirements belong in ARCHITECTURE.md. Describe the
operational mechanisms and evidence that support them here. -->

## Proposed Changes

| Change and environment | Difference from current infrastructure | Decision or specification reference | Evidence needed for deployment and verification |
|---|---|---|---|
| [Proposed or approved but undeployed change] | [Affected resources or configuration] | [Canonical decision or pending approval] | [Deployment evidence and required operational checks] |

## Open Items

| Missing information or unresolved decision | Evidence or decision needed | Responsible person or role |
|---|---|---|
| [Unknown] | [Inspection, validation or explicit decision] | [Person or role; pending confirmation] |

## Change History

| Date | Version | Change and rationale | Configuration, runtime or decision reference |
|---|---|---|---|
| [YYYY-MM-DD] | [Version] | [Affected environment or resource] | [Exact Git commit:path, operational evidence and applicable approval] |
