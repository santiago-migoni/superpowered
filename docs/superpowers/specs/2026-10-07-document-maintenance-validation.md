# Validación local de revisiones y referencias de producto

Fecha: 2026-10-07. Fuente: política preparada para Superpowered 6.8.0, sobre la base 6.7.0.

## Cambio

Las cinco rutas de documentación aplican una política común en templates/README.md:
revisiones independientes, aprobación por contenido/alcance exacto, conservación
proporcional de bases y reconciliación de referencias actuales bajo autorización.
writing-plans aplica estas reglas en su ruta de releases; su flujo genérico no cambia.

## Antes y después

Dos evaluadores independientes leyeron las reglas previas, sin modificarlas.
Recuperaron correctamente la separación entre aprobación y ejecución y la
preservación de bases, pero no pudieron determinar una regla explícita para
iteraciones de borrador presentado, revisiones de evidencia ni mantenimiento
entre documentos. Se observó una falta de definición, no una edición indebida
reproducida ni un fallo de instalación.

Con las instrucciones actualizadas, una sesión evaluó cinco casos:

| Caso | Resultado recuperado |
|---|---|
| Entrevista, presentación, cambio sustantivo y aprobación | Iteraciones v001; revisión presentada modificada v002; aprobación v002 sin otro incremento; reutilización sólo de una base idéntica. |
| Criterio conductual llamado «typo» con presión de plazo | Spec v003 → v004 in_review/null; conservar base v003, revisar tareas futuras sin repuntar Plan aprobado a contenido no aprobado. |
| Evidencia de entrega sin decisión nueva | Revisión independiente de release; conservar sólo alcance de aprobación de decisiones anteriores; sin sincronizar los demás documentos ni fabricar validación. |
| Evidencia posterior contradice un resultado | Conservar registro histórico, corregir afirmación/estado actual al alcance sustentado y revisar evidencia; no borrar una entrega ni reabrir decisiones por asociación. |
| Aprobación parcial de US-001 | Revisión sin incremento por el registro; documento draft/in_review, aprobación parcial en historial y resto pendiente. |

La revisión independiente detectó una cláusula contradictoria de constitución
sobre aprobación de revisiones con evidencia nueva. Se corrigió. También se
explicitó approval_reference null para aprobación global pendiente y el límite
de una revisión por actualización de mantenimiento, no por cada guardado/check.

## Ejercicio con archivos

Otra sesión creó un fixture aislado en /private/tmp y aplicó dos encargos:
registro de aprobación limitado a Plan, seguido de reconciliación editorial
autorizada. Pasaron 15 comprobaciones de archivos: límites de edición, reporte
de secciones protegidas, snapshots/historial literales, reutilización de bases,
huella aprobada inmutable, actualización de huella canónica, tareas/verificación
intactas, revisiones conservadas y ausencia de hashes recíprocos.

[Evidencia y contenido del fixture](2026-10-07-document-maintenance-evidence.json)
conserva hashes, resultados y los nueve Markdown finales para inspección después
de eliminar el directorio temporal. Es un ejercicio local de artefactos, no una
evaluación amplia de comportamiento nativo.

## Comprobaciones y límites

- tests/codex/test-package-codex-plugin.sh: pasó, incluyendo fixture congelado
  desde las skills/plantillas actuales, metadatos fallback y ZIP/tar.gz.
- tests/codex/test-marketplace-manifest.sh: pasó.
- tests/claude-code/test-release-plan-brief.sh: pasó; la extracción de tareas
  conserva su comportamiento.
- git diff --check: sin errores.

La versión Codex se incrementó a 6.8.0 para publicar la política. La actualización
de la instalación y su validación nativa permanecen pendientes.
Las sesiones nativas previas demostraron continuidad y reconciliación solicitada,
pero no prueban la selección/actuación automática de estas instrucciones nuevas.
Después de publicar, probar creación con referencias antiguas, aprobación con
archivos protegidos, modificación sustantiva y actualización de evidencia en
sesiones nuevas de Codex App.
