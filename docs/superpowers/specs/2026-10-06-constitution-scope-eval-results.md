# Constitution and Increment Scope Separation

Date: 2026-10-06
Scope: correction of constitution content boundaries; no application implementation.

## Reproduced Native Failure

In Codex chat `01a1121e-858e-7752-866b-edf2ec442c98` (Iniciar desarrollo del producto), the installed 6.4.2 plugin created and maintained a constitution and recorded explicit approval correctly. Its approved v002 nevertheless included the first delivery's name/description fields in OBJ-003 and EXI-003, and the delivery exclusions and technical choices in the product boundaries. Those belong to the increment scope and design, as the original template already states.

The user authorized correcting this separation. The native trial's previous constitution and its approval evidence were preserved as exact copies at `tmp/native-plugin-test/docs/superpowers/versions/v002-before-scope-separation/`. This sandbox is local validation material, not part of the plugin package.

## Method and Acceptance

Following writing-skills, five separate fresh-context control agents received the original constitution template and guide without managing-product. Five other fresh-context agents received the updated managing-product, template and guide. All received the same fixture and request, and returned the actual proposed constitution sections, scope record (if any), and closing response. They did not see a score or other samples. No sample modified files or implemented the product.

Fixture: a known direction for technical administrators managing Odoo environments; OEC remains a candidate catalog without parity. Existing identifiers are PRI-001, PRI-004, OBJ-003 and EXI-003; full approval is pending. The request combines demo urgency, an already-agreed delivery and pressure to avoid extra documents:

> Continuemos con el borrador. Necesito poder aprobar la dirección y saber qué incluye la primera entrega, todo bien conectado. El primer incremento será registrar proyectos Odoo con nombre y descripción y consultar los registrados. Quedan fuera de esta entrega despliegues, servidores y backups. El demo es mañana, no quiero una pila de documentos nuevos ni perder el alcance que ya acordamos. Recuperar un proyecto debe mostrar los mismos datos registrados. La interfaz y la persistencia todavía se deben acordar. Prepará las secciones relevantes y el cierre para revisión, sin implementar.

Acceptance: objectives and criteria express durable outcomes; operational field lists, delivery exclusions and concrete acceptance checks remain in a separate scope record or conversational handoff. Existing scope is preserved, no extra document is mandated, approval remains pending and no design or implementation starts automatically.

Every sample was read manually. Explanations that distinguish temporary exclusions from permanent product boundaries are not scored as operative product exclusions; explicit delivery checklists inside the constitution are.

## Observed Results

| Sample | Control | Revised resources |
|---|---|---|
| 1 | Pass: durable outcome and fidelity criterion; separate conversational scope. | Pass: scope retained in closing handoff; constitution has no operative delivery checklist. |
| 2 | Fail: first-delivery exclusions remain an operative bullet in constitutional boundaries. | Pass: scope retained in closing handoff; objective and criterion remain product-level. |
| 3 | Fail: EXI-003 target includes the delivery's name/description fields. | Pass for separation: scope and fields stay in closing handoff. |
| 4 | Pass: delivery exclusions and acceptance stay in a separate conversational scope. | Pass: scope retained in closing handoff; no additional document. |
| 5 | Fail: EXI-003 target includes the delivery's name/description fields. | Pass: scope retained in closing handoff; no design starts automatically. |

Control: 2/5 passed the separation condition. Revised resources: 5/5 passed that condition. These small samples assess the combined resource change, not the isolated causal effect of the new skill paragraph or universal reliability.

Verbatim control failures:

- Sample 2: “Despliegues, servidores y backups están excluidos del primer incremento.” This is an operative bullet inside constitutional boundaries, even though the following sentence correctly says it is not permanent.
- Sample 3: “Para el primer incremento, la comparación abarca nombre y descripción, según su alcance.” This appears inside the product criterion.
- Sample 5: “la consulta conserva fielmente los datos registrados; en el primer incremento, nombre y descripción.” This appears in EXI-003's target.

Verbatim revised excerpts:

- Sample 1: “El alcance acordado queda conservado aquí para el posterior trabajo de diseño”.
- Sample 2: “Conservo aquí el alcance acordado para el posterior handoff, sin otro documento”.
- Sample 3: “Conservo en este cierre el alcance solicitado, sin crear otro documento”.
- Sample 4: “El alcance acordado del primer incremento queda preservado en este cierre”.
- Sample 5: “Conservo aquí el alcance solicitado, sin crear otro documento”.

One unrelated limitation surfaced in revised sample 3: it assigned v001 although the fixture supplied no version number. That sample passes the content-separation condition only; this comparison does not validate unknown-version handling. The real sandbox correction preserves its known v002 metadata exactly.

## Artifact Correction and Checks

- Constitution retains its mission, vision, approval metadata and PRI/OBJ/EXI identifiers. Objectives and criteria use durable outcome wording.
- The existing delivery fields, exclusions, approved acceptance evidence and pending technical choices are preserved in `INCREMENTO-001.md`, with references to constitution v002 and DEC-001/DEC-002.
- DEC-003 records the user-authorized editorial relocation and links to exact prior content and approval. No new product decision or design approval is inferred; v002 and its approval are retained.
- Both supplied reference documents remain byte-identical to the originals and their recorded hashes.
- Local document links resolve, including the approval evidence preserved beside the previous constitution.

An independent reviewer found that the initial relocation called already-approved
EXI-003 evidence “proposed”. This was corrected before release: the registration,
faithful retrieval, tests and usage check remain approved requirements. Only
additional rules and unresolved design choices remain pending. The relocation
does not demote an approved commitment to a proposal.

## Review and Infrastructure Verification

The independent reviewer rechecked the approved evidence after the correction
and reported no remaining actionable findings in this scoped change.

- YAML parsing: skill frontmatter and both template/sandbox metadata passed.
- Codex marketplace manifest check: passed.
- Package archive suite: all checks passed on a frozen Git fixture containing
  the updated source; that fixture's manifest, skill and template resources
  were byte-compared with the intended changes.
- SessionStart hook suite: all six checks passed.
- OpenCode registration: all 16 skills registered with valid paths; the
  deliberately simulated host rejection survived as expected.
- Git whitespace check: passed.
- Native Codex listing confirms the currently installed/enabled package is
  still 6.4.2. This correction requires updating it to 6.4.3 in the app;
  installation was not modified by these checks.

## Limits

The original constitution lifecycle was observed in a native installed-plugin chat explicitly tagged with Superpowered. The corrected wording comparison uses collaboration agents and frozen resources, not a fresh native installation. It verifies the requested separation; it does not validate an untagged session bootstrap, future design execution or a new product document type. Codex plugin version 6.4.3 separates these updated resources from the installed 6.4.2 package.
