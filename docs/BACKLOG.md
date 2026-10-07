# Backlog de documentación de producto

Actualizado: 2026-10-07.

## Orden acordado

1. Definir las plantillas de roadmap, especificación y plan en `templates/`, siguiendo el idioma inglés del plugin y las convenciones de metadatos existentes. Precisar el propósito de cada documento, sus referencias y su relación con constitución y diseño. La plantilla de roadmap ordenará resultados e incrementos; la especificación delimitará un cambio y sus criterios de aceptación; el plan organizará su ejecución.
2. Después de definir esas plantillas, revisar conjuntamente el versionado de las cinco skills que cubren constitución, diseño, roadmap, especificación y planificación. Resolver cuándo incrementar versión, cómo conservar una base aprobada, cómo registrar aprobaciones parciales y cómo mantener referencias reproducibles sin generar copias o actualizaciones innecesarias.

La revisión de versionado se realizará como una decisión común del flujo, después de las plantillas. No se modifica ahora el comportamiento de las skills.

## Avance de implementación

- `writing-roadmap` y las plantillas de índice ROADMAP y registro RELEASE están implementadas en el código fuente. Las comprobaciones locales y las tres sesiones guiadas de comportamiento pasaron; la instalación y selección automática en Codex App siguen pendientes. Véase [validación](superpowers/specs/2026-10-07-writing-roadmap-validation.md).
- Las plantillas SPEC y PLAN están implementadas en inglés: una de cada una por release en `docs/superpowers/specs/vX.Y.Z/`, con user stories y criterios de aceptación en SPEC y tareas/verificación en PLAN. `writing-spec` y la ruta de releases de `writing-plans` están integradas en el código fuente; el flujo sin release conserva su ruta existente. La actualización y validación nativa del plugin siguen pendientes.
  Véase [validación local de spec y plan](superpowers/specs/2026-10-07-spec-plan-validation.md).

## Evidencia y pendientes de la validación actual

Las pruebas nativas realizadas respaldan el uso de `writing-constitution` y `writing-design`: recuperación desde archivos en una conversación nueva, selección de constitución sin nombrar la skill, registro de aprobación de la constitución, elaboración de los tres documentos técnicos, propagación de decisiones parciales y presentación individual para aprobación.

La validación funcional de constitución y diseño quedó cerrada: se registraron las aprobaciones individuales de v013 y la revisión de ADR-006 en v014, primero pendiente y luego aprobada mediante DEC-023–025. Constitución y fuentes se conservaron.

Queda para la revisión conjunta de versionado:
- Resolver ajustes posteriores a la aprobación bajo el mismo número de versión: en v014 se conservaron snapshots aprobados y de cierre con textos diferentes, aunque reflejan la misma decisión.
- Evaluar el volumen de snapshots y actualizaciones durante la entrevista: se observaron 39 archivos de versiones en un punto de la prueba. Es evidencia para la revisión conjunta de versionado, no un umbral ni una política aprobada.

## Referencias

- [Propuesta de documentación de producto](PROPUESTA-DOCUMENTACION-DE-PRODUCTO.md).
- Conversación de prueba: `01a11624-984b-7850-a8b4-9d1c4989853c` — Retomar documentación del producto.

Este backlog registra el orden solicitado. No aprueba el contenido de las plantillas futuras, una política de versionado ni cambios de las skills.
