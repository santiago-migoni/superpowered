# Documentación de producto para Superpowered

Fecha: 2026-10-06\
Estado: propuesta de mejora; implementación pendiente\
Base: fork de Superpowers 6.4.2

Superpowered ampliará el flujo de Superpowers con tres documentos permanentes: `CONSTITUTION.md`, `ARCHITECTURE.md` y `ROADMAP.md`. Su función será mantener el propósito, las decisiones técnicas y las prioridades del producto entre funcionalidades y sesiones. Las especificaciones y los planes existentes seguirán desarrollando cambios concretos.

## Problema que queremos resolver

Superpowers organiza el desarrollo alrededor de una especificación y un plan por cambio. Esa estructura permite ejecutar y revisar una funcionalidad, pero no establece un procedimiento dedicado para mantener una referencia común del producto completo.

Sin esa referencia, distintas sesiones pueden interpretar de manera diferente los objetivos, proponer funcionalidades que no contribuyen a ellos o confundir una arquitectura prevista con la arquitectura que realmente existe. Además, completar una implementación y pasar las pruebas no demuestra por sí solo que se haya alcanzado un resultado de producto.

La mejora busca dar continuidad a esas decisiones y vincular cada cambio con un propósito verificable.

## Organización acordada

La documentación permanente vivirá en `docs/superpowers/` y se incluirá en Git:

```text
docs/
└── superpowers/
    ├── CONSTITUTION.md
    ├── ARCHITECTURE.md
    ├── ROADMAP.md
    ├── specs/
    │   └── YYYY-MM-DD-<tema>-design.md
    └── plans/
        └── YYYY-MM-DD-<funcionalidad>.md
```

Los tres documentos se crearán en cada proyecto que adopte este flujo. Sus nombres son convenciones del producto desarrollado, no tres archivos globales compartidos por todos los proyectos.

La carpeta `.superpowers/` mantendrá su función de espacio temporal de ejecución: registros de progreso, instrucciones por tarea, informes, paquetes de revisión y salidas de pruebas. Ningún documento permanente dependerá de que ese espacio sobreviva a la limpieza del plan.

## CONSTITUTION.md

Responde: **¿para qué existe el producto y qué debe respetar?**

Debe contener:

- **Misión:** problema que resolvemos, personas a las que servimos y valor que aportamos.
- **Visión:** futuro que queremos hacer posible y horizonte de referencia.
- **Usuarios y necesidades:** usuarios prioritarios y situaciones que buscamos mejorar.
- **Principios de producto:** criterios para resolver tensiones entre simplicidad, calidad, autonomía, costo y otras prioridades relevantes.
- **Objetivos de producto:** resultados que orientan el desarrollo, con identificadores estables para poder referenciarlos.
- **Criterios de éxito:** evidencia que permitiría comprobar cada objetivo.
- **Límites y exclusiones:** problemas, usuarios o capacidades que quedan fuera del alcance.
- **Gobierno:** versión, responsable de aprobación y condiciones para revisar el documento.

Cada criterio de éxito debe especificar métrica o señal observable, situación inicial, meta, plazo cuando corresponda y fuente de evidencia. Si la situación inicial todavía no se conoce, se registra como pendiente de medir; no se inventa.

La misión, la visión y los principios deben ser relativamente estables. Los compromisos de una etapa concreta se desarrollan en el roadmap. La constitución no se reescribe automáticamente para justificar una funcionalidad nueva.

## ARCHITECTURE.md

Responde: **¿cómo está construido el producto y qué decisiones técnicas lo sostienen?**

Debe contener:

- Contexto del sistema y límites con servicios o sistemas externos.
- Componentes y responsabilidades.
- Interfaces y contratos importantes.
- Flujos de datos y fuentes de información canónicas.
- Restricciones técnicas y atributos de calidad relevantes.
- Decisiones arquitectónicas, motivos y consecuencias.
- Cambios propuestos, claramente distinguidos del estado actual.

La descripción principal debe representar lo implementado. Una decisión aprobada pero aún no ejecutada conserva ese estado explícito. Cuando una implementación cambia componentes, contratos o flujos, la actualización de arquitectura forma parte de la misma entrega.

## ROADMAP.md

Responde: **¿qué resultados perseguimos y en qué orden?**

Debe contener iniciativas vinculadas con los objetivos de la constitución, organizadas por prioridad o por etapas como ahora, después y más adelante.

Cada iniciativa debe identificar:

- Objetivo al que contribuye y resultado esperado.
- Alcance y exclusiones relevantes.
- Prioridad, dependencias y condiciones para comenzar.
- Criterios para avanzar o dar por terminada la etapa.
- Estado de entrega y estado de validación del resultado.
- Referencias a las especificaciones y planes que la desarrollan.

El roadmap expresa dirección y secuencia. El detalle de tareas y comandos pertenece a los planes. Las fechas se incorporan cuando exista un compromiso real; una hipótesis de planificación debe conservar ese carácter.

Una iniciativa puede estar **entregada** y tener su **resultado pendiente de validación**. Ambos estados deben poder registrarse sin declarar éxito de producto por el solo hecho de haber terminado el código.

## Relación entre los documentos

La constitución establece propósito y principios. La arquitectura explica la estructura actual y sus restricciones. El roadmap selecciona resultados y prioridades. Las especificaciones concretan cada cambio y los planes organizan su implementación.

Cada especificación debe identificar los objetivos o iniciativas a los que contribuye, los principios relevantes, el impacto arquitectónico y la evidencia necesaria para validar el resultado. Las referencias deben apuntar a las versiones o commits usados cuando sea necesario reproducir una decisión; se evita copiar documentos completos en cada especificación.

Un conflicto se trata según su naturaleza: la constitución orienta el valor y los límites del producto; la arquitectura aporta restricciones técnicas; el roadmap expresa la prioridad vigente. Un plan no puede redefinir silenciosamente ninguna de esas decisiones. Si resolver el conflicto requiere cambiar propósito, principios o prioridades, el cambio se presenta explícitamente para aprobación.

## Integración propuesta con las skills

| Etapa | Comportamiento propuesto |
|---|---|
| Inicio del trabajo | Localizar los documentos relevantes y comprobar su estado antes de tratar su contenido como vigente. |
| Brainstorming | Consultar propósito, prioridades y arquitectura; vincular la propuesta con un objetivo y evaluar su alcance. |
| Especificación | Registrar principios aplicables, objetivo atendido, impacto arquitectónico y criterios de validación. |
| Planificación | Incluir tareas para implementar el cambio, obtener evidencia y actualizar los documentos afectados. |
| Ejecución | Mantener la trazabilidad hacia la especificación y registrar decisiones que afecten las referencias compartidas. |
| Revisión | Comprobar cumplimiento técnico y coherencia con la constitución, la arquitectura y el roadmap. |
| Cierre | Actualizar el estado implementado, registrar la entrega y distinguir los resultados validados de la evidencia pendiente. |

Si los documentos todavía no existen, el flujo debe ayudar a construirlos con información del usuario y evidencia del proyecto. La exploración del repositorio puede sustentar la arquitectura actual; no permite inferir por sí sola una misión o una prioridad de negocio como si estuvieran aprobadas.

## Mantenimiento y aprobación

Los documentos se consultan cuando son relevantes y se actualizan cuando cambia aquello que describen. No es necesario reescribirlos ni pedir su aprobación completa para cada tarea.

Los cambios en misión, visión, principios o prioridades requieren una decisión explícita del usuario. Las actualizaciones descriptivas de arquitectura derivadas de una implementación aprobada pueden acompañar esa implementación. El roadmap puede registrar la entrega y su evidencia sin alterar automáticamente las prioridades restantes.

Cada documento debe indicar su estado y última revisión. Las decisiones de producto relevantes se conservan en los documentos versionados o en las especificaciones correspondientes antes de eliminar artefactos temporales. Una observación del agente se distingue de una decisión aprobada y de un resultado observado.

## Alcance de una primera implementación

1. Definir plantillas concisas para los tres documentos, con sus reglas de estado y referencias.
2. Incorporar un procedimiento para crearlos o revisar los existentes, aprovechando documentación previa y evitando fuentes contradictorias.
3. Conectar las skills de diseño, planificación, revisión y cierre con esas referencias.
4. Validar el flujo en un proyecto real mediante sesiones nuevas y continuidad entre cambios.

Esta propuesta no modifica todavía las skills, los manifiestos, el nombre instalado del plugin ni su comportamiento. Tampoco crea una constitución ficticia para el propio fork: documenta una capacidad reutilizable que queremos agregar a Superpowered.

## Criterios de aceptación de la mejora

- Un proyecto puede generar y conservar los tres documentos en `docs/superpowers/`.
- Una sesión nueva localiza las referencias sin depender de la conversación anterior.
- Una funcionalidad puede trazarse desde un objetivo de producto hasta su especificación, plan y evidencia.
- Una propuesta que contradiga un principio o exclusión hace visible el conflicto antes de implementarlo.
- Un cambio arquitectónico actualiza la descripción del estado real y distingue lo pendiente.
- El roadmap puede registrar una entrega con validación de resultado pendiente.
- Un cambio acotado no provoca la reescritura completa de los documentos ni aprobaciones redundantes.
- Limpiar el espacio temporal de ejecución conserva toda la documentación permanente.

## Referencias de la base existente

- [Diseño y especificaciones](../skills/brainstorming/SKILL.md).
- [Planes de implementación](../skills/writing-plans/SKILL.md).
- [Ejecución en la sesión principal](../skills/executing-plans/SKILL.md).
- [Ejecución con subagentes](../skills/subagent-driven-development/SKILL.md).
- [Revisión de código](../skills/requesting-code-review/SKILL.md).

Estas referencias describen la base actual. Las integraciones detalladas en esta propuesta son trabajo futuro del fork.
