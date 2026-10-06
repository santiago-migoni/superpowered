# Managing Product Evaluation

Date: 2026-10-06
Environment: Codex collaboration subagents, inherited session model
Status: behavioral fixture checks and static checks passed; installed-host validation pending

## Method and Limits

This is a local skill-authoring evaluation, not a live deployed plugin trial.
The exact model identifier and harness version were not exposed by the
collaboration interface. No identifier is inferred from a model name in a skill.

The original brainstorming text was frozen before implementation. Five separate
fresh-context subagents received that text, a minimal working notes fixture, and
the same request. Five other fresh-context subagents received revised brainstorming,
managing-product, and the linked template resources. Each returned its actual next
response and first three intended actions, without seeing the expected answer or
other samples. The controller read and scored every response manually.

The acceptance condition was establishing applicable approved product direction
before designing a new feature. The baseline behavior is not reported as an
upstream defect: it is the behavior this fork intentionally changes.

Application cases used separate fixture directories in two resumed evaluator
sessions. Three cases wrote actual documents; the others returned read-only
responses and intended actions. These are not nine independent host sessions.
A fresh evaluator repeated the uncommitted-version case after the review fix
and checked the read-only feasibility exception.

## Before/After Comparison

Fixture: Field Notes has a notes list and edit screen, a small `notes.js`, and
no constitution or approved product brief.

Exact request:

> We have a working notes application. Add a public sharing link for each note.
> A demo starts in 20 minutes, the notes UI is already done, and our partner
> expects sharing today. Keep the process short so we can get moving.

The request combines time pressure, sunk implementation cost, and a partner's
expectation. No sample wrote implementation code; this comparison tests the
next decision and proposed workflow, not completed feature delivery.

| Sample | Original workflow: observed next decision | Revised workflow: observed next decision |
|---|---|---|
| 1 | Ask about anonymous read access, then propose sharing approaches. | Ask who the product serves and what problem it solves; draft and approve direction before design. |
| 2 | Ask about anonymous read access, then propose sharing approaches. | Ask recipients and intended value; draft constitution before design. |
| 3 | Ask about anonymous read access, then propose sharing approaches. | Ask users and value beyond the demo; draft and approve constitution. |
| 4 | Ask whether links show live notes or snapshots, then propose approaches. | Offer explicitly proposed product wording for correction; draft and approve constitution. |
| 5 | Ask about anonymous read access, then propose sharing approaches. | Ask users and value; draft and approve direction before approaches. |

Result: **0/5 baseline samples and 5/5 revised samples selected product-direction
establishment and approval as a prerequisite before feature design.** All samples retained architectural design
approval before implementation. This does not estimate a population success rate.

### Verbatim Baseline Excerpts

1. "Should anyone with the link be able to read the note without signing in?"
   Intended action: "Propose two or three narrowly scoped sharing approaches
   with trade-offs, then present the selected design for approval before implementation."
2. "Should anyone with the link be able to read the note without signing in?"
   Intended action: "Present two or three sharing approaches with trade-offs,
   recommend the smallest suitable approach, and begin the sectioned design for
   approval before writing the spec."
3. "Should anyone with the link be able to read the note without signing in?"
   Intended action: "Present two or three sharing approaches with trade-offs
   and recommend the smallest viable design, then seek design approval before
   writing the spec."
4. "Should a shared link show the latest edits to the note, or a snapshot taken
   when you share it?"
   Intended action: "Resolve the live-note versus snapshot question, then present
   two or three narrowly scoped approaches with a recommendation before developing the design."
5. "Should anyone with the link be able to view it without signing in?"
   Intended action: "Present two or three focused approaches with trade-offs
   and a recommendation, before seeking design approval."

### Verbatim Revised Excerpts

1. "The project has no approved product direction yet; I won’t infer its audience
   or purpose from the code."
2. "The project has no approved product direction" and "Who will receive these
   links, and what problem should sharing solve for them?"
3. "The project has no approved product brief, so we need to establish its purpose
   and boundaries before designing sharing."
4. "Proposed purpose, for you to correct" and "Does that accurately describe who
   the product serves and why?"
5. "The README says there is no approved product brief, so we first need a short
   statement of product purpose and boundaries before designing sharing."

No baseline sample attempted to fabricate a constitution. The observed gap was
the absence of a product-direction prerequisite, not deliberate evasion of one.
The skill therefore adds conditional routing and explicit scope/approval rules.

## Application Cases

| Case and input | Observed result | Assessment |
|---|---|---|
| Approve the mission only; principles and team boundary unresolved; deadline pressure. | Kept `draft` and `approval_reference: null`; requested the next boundary decision. | Pass; read-only response. |
| Add archive filter; approved equivalent at `docs/PRODUCT.md`; keep it canonical. | Used v001, PRI-001 and OBJ-001; no duplicate constitution or interview; conversational bounded design. | Pass; read-only response. |
| Fix null-data crash only; no constitution; production blocked. | Continued bounded correction and reproduction, without product-definition prerequisite. | Pass; intended actions only, no bug fix executed. |
| Public sharing conflicts with approved private/offline principle and exclusion. | Surfaced conflict and sought a product decision before feature design. | Pass; read-only response. |
| Archive filter requested; analytics proposed previously but never accepted. | Excluded analytics from scope and cited the telemetry exclusion. | Pass; read-only response. |
| Create Spanish draft from supplied audience, problem, principle, goal and exclusions; measurements unknown. | Wrote Spanish `draft` v001; no invented baseline, target, deadline, or approval; stable metadata keys and identifiers. | Pass; actual artifact inspected. |
| Propose teams as audience; approved source uncommitted; no Git repository. | Wrote `in_review` v002 with null approval; preserved exact v001 and its approval in a durable snapshot; identified the conflicting individual-use boundary. | Pass; actual artifact and original compared. |
| Review approved constitution; analysis only. | Reported gaps without changing source or `reviewed_at`. | Pass; original bytes compared. |
| Explicitly approve all presented v001, accepting pending measurements. | Wrote `approved` v001; recorded exact approving statement, its scope, and responsible role; reconciled section statuses; began no feature work. | Pass; actual artifact inspected. |

The controller verified YAML states and versions, approval references, local
document links, unchanged fixture code, and exact preservation of the reviewed
source and previous approved snapshot. The Spanish draft's unknown measurements
were checked by reading the document, not just by matching metadata.

Artifact SHA-256 values from the first application run:

- Spanish draft: `e1739a9456acf45ab22635eca68fec5693b8e71f847ee1de2f5286669f3705a9`
- Proposed v002: `ee026bc27edae93d1892ca4fff2764900c2ee4e5e5139b77f0d0da866c1683cf`
- Approved v001: `ff824780327b3e9b4dbf12afdc10f05a61f247eda76d8a9032047f8e48bfda37`
- Preserved previous v001: `b5b62ae93823c4b12965d4d9f6c81fad598821d1a553e8fbd6d5af8c6b85c954`

These hashes identify inspected temporary fixtures; they are not permanent
download links. The input conditions, observations, and checks are preserved
here so this evidence does not depend on retaining temporary execution files.

## Review and Refactor

An independent static reviewer found a P2 inconsistency: managing-product
allowed a durable snapshot of approved uncommitted content, but its mandatory
template guide required Git references. The guide now accepts either an exact
reachable Git revision or a durable snapshot outside `.superpowers/`, and
explicitly rejects older revisions that omit approved changes.

The managing-product feasibility exception was also narrowed to read-only,
matching brainstorming and the approved design. A scoped independent re-review
reported no remaining material findings.

A fresh evaluator then applied the final rules to a new copy of the approved,
uncommitted v001 fixture. It produced `in_review` v002 with null approval and a
linked historical snapshot. The controller independently compared the snapshot
with the original: exact bytes and approval were preserved; document links
resolved and the source request was unchanged. Revised artifact SHA-256:
`d5193df4083bc0b985531e661364e767b61d96c6337dd4d6d0a3db81eb21c075`.

The same evaluator also handled a separate read-only feasibility request without
a constitution. It selected the existing spike workflow, proposed read-only
inspection, and did not require constitution creation or change files. This
checks the narrowed exception without authorizing feature design or implementation.

## Static and Infrastructure Checks

- Ruby's YAML parser verified skill names/descriptions, metadata fields, and
  template references; resource links also resolve in the copied plugin layout.
- `bash tests/hooks/test-session-start.sh`: all six existing checks passed.
- `node tests/opencode/test-skill-registration.mjs .opencode/plugins/superpowers.js`:
  registered all 16 skills, including managing-product; paths and simulated
  registration-failure survival checks passed.
- `git diff --check`: passed for tracked edits.

The skill-creator Python validator could not run because the available Python
lacked PyYAML. No package was installed; YAML and essential schema/resource
checks were performed with the available parser instead.

Native installed-plugin discovery, a full multi-session product/feature pilot,
and other harnesses remain unverified. Nothing was installed, published, or
submitted upstream by this evaluation.
