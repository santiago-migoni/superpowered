# Validación local de writing-spec y planificación de releases

Fecha: 2026-10-07. Alcance: integración de las plantillas SPEC y PLAN acordadas,
una de cada una por release, sin modificar la ruta de planificación sin release.

## Base observada antes de editar

Dos agentes con contexto nuevo leyeron las instrucciones anteriores y las
plantillas. El escenario de especificación mantuvo la eliminación fuera del
alcance y la autorización desconocida como pendiente; no se reprodujo una
violación de alcance. La ausencia de una skill dedicada y de su ruta en
brainstorming obligaba a obtener el formato de las preferencias explícitas y
las plantillas, no de una integración existente.

El escenario de planificación produjo un formato combinado: metadata y
secciones de PLAN junto con el encabezado, Global Constraints y Review Focus
obligatorios de writing-plans. Confirmó que los checkboxes T-001 de la plantilla
no eran extraíbles por task-brief sin encabezados Task N. La nueva ruta define
el formato de release sin reemplazar el formato anterior para otros trabajos.

## Regresión reproducida y corregida

`bash tests/claude-code/test-release-plan-brief.sh` falló antes de cambiar el
extractor: `Task brief swallowed release-wide verification/blockers`.

Después del ajuste, el test pasó: los encabezados Task N delimitan tareas,
se conservan subsecciones y ejemplos dentro de fences, y Verification/Blockers
no se incorporan a la última tarea. También se comprueba una tarea inexistente.
No se modifica el contenido ni el formato de los planes anteriores.

## Aplicación de las instrucciones

Una revisión con contexto nuevo respondió tres escenarios de forma simulada:
ampliación de alcance desde un benchmark, revisión sin escrituras y borradores
con decisiones abiertas. Fue una comprobación razonada, no ejecución del producto.
Detectó una frase de la guía que todavía declaraba pendiente la integración;
se actualizó junto con los enlaces y la descripción de ambas rutas.

Dos agentes adicionales crearon artefactos reales en sandboxes separados:

| Escenario | Comprobación observada |
|---|---|
| SPEC en español, inventario y autorización, benchmark de eliminación | Un SPEC draft con US-001/002; eliminación fuera del alcance, contrato de autorización pendiente, sin PLAN ni código. Revisión de solo lectura conservó bytes y metadata. |
| PLAN desde un SPEC fixture v003 aprobado y sin commit | Un PLAN draft con T-001/002 y referencias a historias; baseline durable idéntico al SPEC, sin presentar HEAD como su contenido. Autorización desconocida bloquea la tarea afectada sin inventar contratos. |
| Extracción del PLAN de release | Ambas tareas se extrajeron exactamente; verificación y bloqueos globales quedaron fuera. |
| Plan genérico anterior | Extracción de tareas numeradas conservada; la ruta sin release mantiene su ubicación, encabezado y handoff. |

Las fuentes y aprobaciones de los fixtures son ficticias y están identificadas
como tales. No se ejecutaron código de aplicación ni comprobaciones de aceptación
del producto. La continuación sobre una modificación de SPEC aprobada se discutió
como simulación, sin atribuirle una escritura real.

Los textos completos, hashes y resultados de los artefactos se conservan en
[spec-plan-evidence.json](2026-10-07-spec-plan-evidence.json).

## Comprobaciones técnicas

La revisión independiente identificó que los checks globales podían quedar
fuera de los briefs y, por tanto, sin una tarea que los ejecutara. La guía y el
template ahora asignan cada check a una tarea numerada o un bloqueo explícito;
Verification referencia esa tarea y registra resultados. Los checks que cruzan
historias pueden pertenecer a una tarea final de verificación.

Una respuesta con contexto nuevo comprobó el ajuste frente a una restricción
explícita del usuario de dejar aceptación integrada sólo fuera de las tareas.
Respetó esa restricción, señaló que el executor omitiría los checks y dejó el
plan incompleto con el bloqueo visible. Propuso T-003 como solución si se cambia
la restricción; no afirmó cobertura completa ni validación por pasar unit tests.
Fue una respuesta de escenario de sólo lectura, no ejecución de esos checks.

- `bash tests/claude-code/test-release-plan-brief.sh`: pasó después del RED observado.
- `bash tests/claude-code/test-executing-plans-scripts.sh`: pasó.
- `bash tests/claude-code/test-sdd-workspace.sh`: pasó.
- `bash tests/codex/test-package-codex-plugin.sh`: pasó; fallback de metadata y contenido exacto de skills, guía de planificación y templates en ZIP y tar.gz.
- YAML de las dos skills y sus agents/openai.yaml: válido.
- Metadata draft de los artefactos, enlaces locales y baseline exacto del SPEC: comprobados.

## Límites y siguiente validación

Las pruebas usan lectura explícita del código fuente de las skills. No prueban
selección automática ni instalación de una versión nueva en Codex App. Los
escenarios son acotados, no una evaluación estadística ni una matriz exhaustiva
de presión. No se afirma mejora causal en el cumplimiento de alcance: el control
ya conservó esos límites. La evidencia respalda el formato, la ruta de release y
la compatibilidad comprobados. La revisión conjunta del versionado sigue aparte.
