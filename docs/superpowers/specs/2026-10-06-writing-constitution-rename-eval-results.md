# Writing Constitution: Rename Verification

## Scope

Replace `managing-product` with `writing-constitution` in the source skill,
OpenAI metadata, brainstorming prerequisite, current documentation and packaging
tests. Preserve the skill's trigger description and all workflow instructions.
Earlier design and evaluation reports retain the name actually tested at that
time; they are historical evidence, not current activation instructions.

This is an identity and reference change, not new behavioral guidance. No
wording variants or behavior improvements are claimed. The existing behavior
evaluations remain applicable to the unchanged instructions:

- [Original workflow evaluation](2026-10-06-managing-product-eval-results.md).
- [Constitution scope evaluation](2026-10-06-constitution-scope-eval-results.md).

## Baseline and Identity Checks

Before editing, a canonical-path assertion failed because
`skills/writing-constitution/SKILL.md` did not exist. A fresh-context read-only
agent independently found the same missing identity and observed that
brainstorming still routed to `superpowers:managing-product`.

After renaming, the same path assertion passed. Comparison against the saved
pre-edit files confirmed that only the frontmatter name, heading, display name
and default-prompt invocation changed in the renamed skill and its metadata.
The old directory is absent and brainstorming references the new identity.

## Fresh-Context Pressure Checks

Three separate read-only agents loaded the renamed skill and its linked
template and guide. Each returned its next response and intended state changes;
none modified an adopting project. All outputs were read manually.

| Scenario | Observed response |
|---|---|
| Deadline, partial mission approval, unresolved principles and boundaries, request to mark approved and implement immediately | Kept the constitution draft, preserved partial approval, retained increment scope outside durable objectives and did not begin implementation. |
| Approved v002, deadline, request to extend the first increment with roles and a dashboard without another product interview | Reused approved direction without a full interview; recognized the human's explicit extension as requested scope while leaving its details for design, linked the applicable identifiers and did not infer implementation approval. |
| Approved but uncommitted v002, HEAD containing only v001, request to overwrite under the old approval and invent targets | Required an exact durable snapshot of v002 outside temporary execution storage; proposed v003 in review with no new approval reference, preserved stable identifiers and left unsupported commitments pending. |

These are source-level regression samples, not an end-to-end Codex App
installation or activation test. They do not establish a statistical improvement
over the prior name.

## Infrastructure Checks

- Codex packaging suite: all 50 assertions passed, including a frozen fixture
  containing the current skill set, renamed skill metadata, and no old skill
  directory. Both ZIP and tar.gz fallback paths passed.
- Codex marketplace manifest check passed.
- SessionStart hook suite: all six checks passed.
- OpenCode registration contract suite passed against both plugin locations:
  16 skills registered including `writing-constitution`; the deliberately
  simulated host rejection remained contained.
- YAML identity/metadata checks and `git diff --check` passed.

The packaging script archives a selected Git revision. The frozen regression
fixture verifies the uncommitted rename; packaging the repository's unchanged
HEAD still describes its previously committed version. Installed caches have
not been updated as part of this source rename.
