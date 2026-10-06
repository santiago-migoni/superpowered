# Managing Product: Constitution Workflow

Date: 2026-10-06
Status: design approved by the human partner in this implementation session
Scope: constitution creation, review, maintenance, and brainstorming integration

## Approved Behavior

`managing-product` uses `templates/CONSTITUTION.md` to establish durable product
direction. The canonical default is `docs/superpowers/CONSTITUTION.md`; existing
approved equivalent documentation can remain canonical by agreement.

Before designing a new project or feature, establish applicable approved purpose,
objectives, principles, and boundaries. An existing approved constitution is
consulted without another full interview or approval. Read-only exploration can
continue while product decisions are unresolved.

Product alignment does not authorize work. Features outside the requested scope
remain proposals until explicitly accepted. Constitution approval does not replace
the existing design, specification, or plan approvals. Bounded changes retain
conversational designs; architectural changes retain the existing written workflow.

Point corrections and read-only feasibility probes do not require creation of a
full constitution. If their scope expands into a feature, establish approved
direction before designing that expansion.

## Creation and Maintenance Contract

- Recover existing decisions and avoid duplicate canonical sources.
- Ask only unanswered questions; unknown metrics, targets, and dates stay pending.
- Keep observations, proposals, and approvals distinct.
- Create a draft or scoped revision, then present it for review.
- Record explicit approval of the presented version with a recoverable reference.
- Partial approval does not approve the whole document.
- Pending measurements can be accepted explicitly in an approved version.
- Preserve previous approved content and its approval before changing decisions.
- Review requests alone do not authorize edits, including metadata edits.
- Keep identifiers stable; metadata remain the single source of document state.
- Stop after product work unless feature work was already requested.

## Delivery

1. Add `skills/managing-product/SKILL.md`, using the existing template and guide.
2. Evaluate its decisions and resulting artifacts before treating it as validated.
3. Integrate the prerequisite with brainstorming and document it in the fork's
   README and template guide.

Instructions are in English; generated prose follows the requested language.
Language configuration belongs to the plugin and is outside this implementation.
Architecture and roadmap management, installation, publication, and upstream PRs
are also outside scope.

## Acceptance and Evidence

Behavior cases cover absent direction, approved equivalent documentation, partial
approval, conflicting features, unsolicited additions, small corrections, draft
creation, version preservation, read-only review, and complete approval.

Compare the original and revised brainstorming behavior using the same scenario
and at least five fresh-context samples per variant. Preserve results and limits in
`2026-10-06-managing-product-eval-results.md`. Check frontmatter, packaged resource
resolution, and the existing session-start hook. These checks do not establish
installed-host discovery or integration across all supported harnesses.
