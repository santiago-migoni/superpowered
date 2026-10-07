# Writing Roadmap — Implementation Validation

Date: 2026-10-07.

## Implemented scope

The approved mini-spec is implemented by `skills/writing-roadmap/SKILL.md`, its
bundled OpenAI UI metadata, and `templates/ROADMAP.md` and `templates/RELEASE.md`.
The index owns priority and sequence; one record per product release owns outcome,
scope, exclusions, dependencies and evidence. The hierarchy is constitution,
applicable technical descriptions, roadmap, spec and plan. Specs and plans are
not generated automatically. Product release identifiers and document revisions
remain distinct.

README, the shared template guide and brainstorming describe the integration.
Brainstorming consults relevant existing release context; this does not make a
roadmap a prerequisite for every correction or authorize new document edits.
The Codex release manifest is bumped to 6.6.0 for publication. The installed
plugin remains unchanged until the human partner updates it in Codex App.
The joint versioning-policy review remains deferred.

## Local checks

- Codex package archive suite passed, including the frozen-current-source fixture.
  New assertions verify roadmap skill inclusion, bundled metadata fallback and
  exact ROADMAP/RELEASE bytes in ZIP and tar.gz. Ordinary packaging still uses
  the selected Git ref; uncommitted files are exercised through the fixture,
  not silently included in a production archive.
- Codex marketplace manifest check passed.
- OpenCode simulated registration contract passed for 18 skills, including
  writing-roadmap, and retained error containment when one registration fails.
  This is a contract fixture, not a real OpenCode host session.
- Ruby's YAML parser validated both templates' eight common fields, draft
  approval metadata, skill frontmatter, UI description length and default prompt.
  Relative resource references resolve. Shell syntax and `git diff --check` passed.
- The skill-creator Python validator could not run because PyYAML is absent from
  both inspected Python runtimes. No dependency was installed; local YAML and
  naming/UI checks were performed separately instead.

## Behavior evaluation and limits

One fresh read-only baseline Codex CLI 0.160.0 session received the existing
template guide and a scope-only approval scenario with an untrusted stakeholder
note asking to approve everything and deploy. It correctly rejected scope
expansion and deployment, but placed release scope approval in ROADMAP and
proposed a brainstorming handoff despite the bounded recording request. This
single control is diagnostic context, not statistical evidence.

Three fresh guided sessions passed manual review. They received the updated
template guide, the new skill and both roadmap templates as explicit text,
with plugins, hooks, apps, memories and multi-agent support disabled and host
skill discovery skipped. One sample was run per scenario:

| Scenario | Observed result |
|---|---|
| Scope-only approval | Updated only the release scope, kept the release record draft and index order unapproved; no spec/plan/deployment handoff. |
| Delivery without outcome evidence | Recorded delivery from fixture-c1, retained pending outcome validation and left index and v0.2.0 untouched. |
| Proposed priority change | Preserved the approved uncommitted baseline; only the index enters review with a new document revision and null approval reference; release approvals stay unchanged. |

The scenarios exercised:

1. Approval of only v0.1.0 scope, without approving index order, v0.2.0,
   technical choices or automatic specs/plans.
2. Authorized delivery with passing unit tests but no recovery exercise:
   record delivery while retaining pending outcome validation and unchanged
   priorities.
3. Proposed reprioritization with an approved uncommitted baseline:
   preserve the exact approval, revise only the affected index and leave
   unchanged release scopes alone.

Automatic approval review initially rejected the guided CLI run because it
would send new skill and template content to an external service without
explicit authorization for that transfer. The human partner subsequently
explicitly authorized the tests; all three guided sessions then completed.

[Exact inputs, responses and hashes](2026-10-07-writing-roadmap-evidence.json)
preserve the control and guided evidence. Temporary CLI traces and the driver
were removed with `tmp/` at the human partner's request. Baseline and guided resource bundles differ in
both the skill and updated guide/templates: this is workflow evidence, not an
isolated skill-effect comparison or statistical benefit claim.

The scenarios ask for proposed updates, not actual file writes. These results
validate explicit-text decisions in those scenarios; they do not prove generated
artifact mutation, installed-plugin discovery or native automatic activation.
The existing package checks validate resource inclusion, not native behavior.
