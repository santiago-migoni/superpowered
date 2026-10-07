# Backlog de documentación de producto

Actualizado: 2026-10-07.

## Orden acordado

1. Definir las plantillas de roadmap, especificación y plan en `templates/`, siguiendo el idioma inglés del plugin y las convenciones de metadatos existentes. Precisar el propósito de cada documento, sus referencias y su relación con constitución y diseño. La plantilla de roadmap ordenará resultados e incrementos; la especificación delimitará un cambio y sus criterios de aceptación; el plan organizará su ejecución.
2. Después de definir esas plantillas, revisar conjuntamente el versionado de las cinco skills que cubren constitución, diseño, roadmap, especificación y planificación. Resolver cuándo incrementar versión, cómo conservar una base aprobada, cómo registrar aprobaciones parciales y cómo mantener referencias reproducibles sin generar copias o actualizaciones innecesarias.

Las plantillas están implementadas. La política común de revisiones y mantenimiento de referencias se incorporó en el código fuente de las cinco rutas; queda pendiente publicarla y validar la actualización instalada en Codex App.

## Avance de implementación

- `writing-roadmap` y las plantillas de índice ROADMAP y registro RELEASE están implementadas en el código fuente. Las comprobaciones locales y las tres sesiones guiadas de comportamiento pasaron; la instalación y selección automática en Codex App siguen pendientes. Véase [validación](superpowers/specs/2026-10-07-writing-roadmap-validation.md).
- Las plantillas SPEC y PLAN están implementadas en inglés: una de cada una por release en `docs/superpowers/specs/vX.Y.Z/`, con user stories y criterios de aceptación en SPEC y tareas/verificación en PLAN. `writing-spec` y la ruta de releases de `writing-plans` están integradas en el código fuente; el flujo sin release conserva su ruta existente. La actualización y validación nativa del plugin siguen pendientes.
  Véase [validación local de spec y plan](superpowers/specs/2026-10-07-spec-plan-validation.md).

## Evidencia y pendientes de la validación actual

Las pruebas nativas realizadas respaldan el uso de `writing-constitution` y `writing-design`: recuperación desde archivos en una conversación nueva, selección de constitución sin nombrar la skill, registro de aprobación de la constitución, elaboración de los tres documentos técnicos, propagación de decisiones parciales y presentación individual para aprobación.

La validación funcional de constitución y diseño quedó cerrada: se registraron las aprobaciones individuales de v013 y la revisión de ADR-006 en v014, primero pendiente y luego aprobada mediante DEC-023–025. Constitución y fuentes se conservaron.

La revisión conjunta resolvió:
- Las correcciones editoriales y el registro de aprobación conservan revisión y alcance aprobado; los cambios sustantivos sobre contenido presentado inician otra revisión. Los borradores se elaboran sin incrementar por cada pregunta.
- Las actualizaciones materiales de descripciones y evidencia tienen revisión propia, conservando únicamente la autoridad de decisiones que no cambiaron. Aprobaciones parciales se registran por alcance, sin aprobar el documento entero.
- Se reutilizan bases exactas existentes en Git o snapshots durables; no se exige un árbol de copias ni revisiones sincronizadas.
- Al crear, modificar o aprobar documentos se comprueban referencias actuales relacionadas. Se reconcilian dentro del encargo; las protegidas se informan por archivo/sección. Las bases y declaraciones históricas permanecen literales.

La prueba nativa de Spec/Plan recuperó SPEC-A01 y PLAN-A01 sin autorizar ejecución. La reconciliación explícita actualizó Spec, Plan, release e índice, conservando contenido aprobado y bloqueos. Esta prueba demuestra mantenimiento solicitado, no activación automática de la nueva regla.

Validación local de la nueva política: [resultados y límites](superpowers/specs/2026-10-07-document-maintenance-validation.md). Pendientes: release del plugin y pruebas nativas de detección de referencias durante creación/aprobación, cambios sustantivos y mantenimiento de evidencia.

## Referencias

- [Propuesta de documentación de producto](PROPUESTA-DOCUMENTACION-DE-PRODUCTO.md).
- Conversación de prueba: `01a11624-984b-7850-a8b4-9d1c4989853c` — Retomar documentación del producto.

Este backlog registra el orden y avance del trabajo autorizado. No aprueba decisiones del producto de prueba ni autoriza su ejecución.
