# Writing Design Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add a tested `writing-design` skill that creates, reviews and maintains the three technical documents within authorized scope.

**Architecture:** One skill reuses the existing Architecture, Structure and Infrastructure templates and shared metadata guide. A scoped brainstorming handoff identifies affected descriptions without creating another feature-design interview or making missing technical documents a universal prerequisite.

**Tech Stack:** Markdown skill instructions, YAML OpenAI metadata, existing Bash packaging and hook tests, existing Node.js registration contract tests, fresh-context agent evaluations. No new runtime dependencies.

**Spec:** [Approved technical-documentation workflow](../specs/2026-10-06-writing-design-design.md); approval applies to the content presented at revision `806b229`.

**Execution override:** The human partner instructed direct implementation
without using Superpowered. This plan is a reference; its plugin invocation,
plan-review, method-selection and independent-agent review instructions do not
govern the current execution. Checks below record the work actually performed.

**Result:** Source implementation is complete under that direct authorization.
[The evaluation report](../specs/2026-10-06-writing-design-eval-results.md) records
the checks actually performed and their limits. The unchecked original plan
steps below remain a planning reference, not outstanding approval requirements.
Source evaluation was completed locally. Commit, version update and push were
subsequently authorized separately; installed-host activation remains untested.

## Global Constraints

- "Default project locations are `docs/superpowers/`."
- "Review-only work returns findings without editing documents or metadata."
- "The absence of a technical document alone does not block a bounded correction, require all three documents, or initiate a new technical interview."
- "Generated prose follows the requested language; metadata keys and conventional states remain unchanged."
- "Creating or approving technical documentation does not by itself authorize feature implementation, deployment, publication or unrelated refactoring."
- "Prior uncommitted work in the repository remains separately identifiable."
- "Roadmap creation, release management, product code, infrastructure provisioning, language configuration and publication are outside this implementation."

## Review Focus

1. Approved but unimplemented design must remain separate from implemented descriptions (Task 1 case 2).
2. Review-only requests must not mutate document content or metadata (Task 1 case 4).
3. Approved uncommitted content must be recoverable exactly, not through an older HEAD (Task 1 case 5).
4. Existing canonical sources and conflicting decisions must remain identifiable (Task 1 cases 3 and 7).
5. Feature handoffs must preserve stage approvals and avoid recursion, repeated interviews or expanded scope (Task 2 handoff checks).

## Workspace and File Ownership

The current workspace contains the authorized but uncommitted constitution
rename, template additions and proposal changes. Record their status and content
before execution; never reset or stage them indiscriminately. If isolation is
needed, use the worktree workflow and explicitly transfer the relevant current
source into the evaluation fixture: starting from HEAD alone omits these inputs.

| File | Responsibility |
|---|---|
| `skills/writing-design/SKILL.md` | Entry, evidence, ownership, approval and handoff contract. |
| `skills/writing-design/agents/openai.yaml` | Display name, concise description and explicit invocation. |
| `skills/brainstorming/SKILL.md` | Consult relevant technical descriptions and route authorized maintenance. |
| `README.md` | Current skill listing and workflow explanation. |
| `templates/README.md` | Link the templates to their implementing skill. |
| `tests/codex/test-package-codex-plugin.sh` | Archive and bundled-metadata coverage for the new skill and its resources. |
| `docs/superpowers/specs/2026-10-06-writing-design-eval-results.md` | Reproducible scenarios, observed baseline/updated outputs, scores and limits. |

Reuse the three templates without changing their schema. Amend their content
only if evaluation exposes a concrete contradiction within the approved scope.

### Task 1: Evaluate and Implement the Standalone Skill

**Files:** Create the skill, its OpenAI metadata and the evaluation report listed above.

**Interfaces:** Consumes the three existing templates, their guide and approved specification. Produces `writing-design`, its discovery metadata and evidence for the eight specification cases.

- [ ] **Step 1: Freeze evaluation inputs.** Record hashes of current templates and guide. Define fixtures for all eight numbered cases in the specification, including repository/configuration sources, approvals and what was inspected. Store the exact requests and scoring criteria in the report before testing; exclude the future skill from control inputs.
- [ ] **Step 2: Establish the baseline.** Run at least five separate fresh-context control samples of a primary pressure scenario: infrastructure documentation requested under a deadline, with deployment configuration and an approved backup decision but no runtime access or restore evidence. Pressure asks for production readiness and successful recovery claims. Record actual next actions and proposed content, manually score every sample, and quote actual failures. Include the same templates and guide in both variants. Do not invent failures; if all controls comply, reconsider the scenario or guidance need and report that outcome before claiming improvement.
- [ ] **Step 3: Author the minimal skill.** Use frontmatter `name: writing-design`; description identifies technical-document creation, review, reconciliation and maintenance triggers. Organize the body around task scope, canonical-source discovery, document ownership, evidence collection, scoped revisions, approval preservation and handoff. Address observed failures with the recipe or condition appropriate to them; retain all approved boundaries. Link all three templates and the guide rather than duplicate their tables or metadata rules.
- [ ] **Step 4: Add OpenAI metadata.** Use display name `Writing Design`, a short description of technical-document maintenance, and a default prompt invoking `$writing-design`. Do not add release, deployment or constitution responsibilities.
- [ ] **Step 5: Run the updated primary scenario.** Run at least five fresh-context samples with the exact control fixtures and requested task, adding only the skill and its necessary routing context. Manually score every sample using the same rubric. Preserve actual outputs, scores, variation and limits; do not claim native activation or a statistical improvement from these samples.
- [ ] **Step 6: Exercise the other seven cases.** Use separate fresh contexts for approved/unimplemented design, infrastructure-only scope, review-only metadata, uncommitted approval preservation, approved delivery across documents, canonical-source conflicts, and partial approval with pending recovery checks. Each result must identify intended edits or no edits, document states, evidence and handoff. Re-test failed cases after the smallest correction.
- [ ] **Step 7: Validate identity and links.** Parse skill frontmatter and OpenAI metadata, resolve its relative template links, and confirm the trigger describes when to use it rather than a shortcut summary of its workflow. Validate actual sample artifacts where produced; do not score quoted template examples as agent decisions.

### Task 2: Integrate the Existing Feature Workflow

**Files:** Modify `skills/brainstorming/SKILL.md`, `README.md`, `templates/README.md`; extend the evaluation report.

**Interfaces:** Consumes the tested standalone skill from Task 1. Produces current discovery references and a bounded technical-document handoff while preserving the existing constitution prerequisite and feature-design stages.

- [ ] **Step 1: Record existing handoff behavior.** Use read-only fresh-context scenarios covering an approved constitution and authorized infrastructure change, a bounded code correction with missing technical documents, and a documentation-only request. Record whether existing brainstorming repeats interviews, creates unnecessary documents or starts unrequested feature work.
- [ ] **Step 2: Add the scoped integration.** In brainstorming's project-context/design guidance, consult relevant existing technical descriptions and identify the affected documents. Route creation or maintenance to `writing-design` when it is part of authorized work. Keep `writing-constitution`, point-correction exemptions, the three paths and spec/plan approval gates unchanged. The terminal implementation-planning handoff remains `writing-plans`; documentation maintenance does not replace it or restart brainstorming.
- [ ] **Step 3: Update discovery documentation.** Add `writing-design` to the README skill list and explain its permanent-document role. Replace the template guide's future-integration statement with the actual skill reference and applicable limits. Preserve the pending roadmap/language work and previous rename.
- [ ] **Step 4: Verify handoffs in fresh contexts.** Repeat the scenarios from Step 1 with updated routing. Check that missing documents do not block the correction; infrastructure work affects only relevant sections; a documentation-only request ends with its result; and an existing approved feature design reaches the existing next stage without repeated approval or recursion. Record exact outputs and any remaining limitation.

### Task 3: Verify Packaged Delivery and Review the Change

**Files:** Modify `tests/codex/test-package-codex-plugin.sh`; finalize the evaluation report.

**Interfaces:** Consumes the skill and integration from Tasks 1–2. Produces tested archive resource coverage and a reviewed source change, without publication or native installation claims.

- [ ] **Step 1: Extend the existing frozen-fixture packaging assertions.** Require `skills/writing-design/SKILL.md`, its bundled metadata and all three technical templates in ZIP and tar.gz. Verify template bytes against the frozen revision. Remove `writing-design` from prior-package metadata to exercise the bundled fallback. Preserve constitution coverage and the assertion excluding `managing-product`.
- [ ] **Step 2: Confirm the new checks detect missing resources.** In a disposable fixture, omit the skill or one referenced template and observe the relevant assertion fail. Restore the fixture and verify success. Production packaging continues to archive a selected Git revision; `--allow-dirty` does not package working-tree edits.
- [ ] **Step 3: Run the scoped infrastructure suites.** Run each command separately:

```bash
bash tests/codex/test-package-codex-plugin.sh
bash tests/codex/test-marketplace-manifest.sh
bash tests/hooks/test-session-start.sh
bash tests/opencode/test-skill-registration.sh
git diff --check
```

Expected: all suites pass; the registration contract captures 17 skills including
`writing-constitution` and `writing-design`; deliberate simulated rejection
remains contained. This registration suite uses a simulated host contract.

- [ ] **Step 4: Review the complete scoped diff.** Request a fresh independent reviewer against the approved specification and evaluation evidence. Fix actionable findings and repeat only affected checks. Compare against the recorded starting workspace so prior uncommitted work is not represented as newly implemented by this plan.
- [ ] **Step 5: Record the result.** Finalize the report with baseline and updated scores, scenario coverage, command results, review findings and explicit limits. Report native Codex App installation/activation as pending unless separately authorized and actually tested.
- [ ] **Step 6: Save an identifiable source revision.** Commit only reviewed, authorized changes with their required resources; preserve provenance for the earlier rename and templates. Do not publish, push a release or change the plugin version as part of this plan. Report any prerequisite source that still remains uncommitted rather than claim an installable revision.

## Execution Handoff

Direct execution was authorized by the human partner. No further plan approval
or execution-method selection is pending. The main agent implements the change;
isolated CLI sessions with plugins disabled evaluate supplied text. Publication
and installed-host activation remain separate from source implementation.
