# Validación local del ciclo documental con Git

Fecha: 2026-10-07. Base publicada: Codex 6.8.0, commit
`78e46bcc07457aba47b6dadecb1cad91a46b333d`.
Plan presentado en `9ab032ccc5a7ff45c06950277153bc5c0c073dd7` y aprobación
registrada en `f6181273c42ae0d77ab2fb6a7bc5d83c733231c7`. Esta validación corresponde a T-001–T-005; T-006 conserva
su condición de publicación y prueba instalada posterior.

## Cambio y alcance

El historial de hitos persistentes usa Git del proyecto adoptante. La referencia
compartida `skills/using-superpowers/references/git-workflow.md` define propiedad
del repositorio, commits por alcance, conservación previa y comprobación de
bytes. Las cinco rutas documentales, el brainstorming escrito, el Plan genérico,
la ejecución y el cierre consultan esa regla sin agregar un documento a cada
corrección acotada.

La presentación es A:documento; la aprobación explícita se registra después en B,
identificando A y su alcance. B no contiene su propio hash. Commit, revisión del
documento, aprobación, release del producto y versión del plugin son conceptos
independientes. Ningún commit autoriza ejecución ni publicación por sí mismo.

## Antes y después

Dos sesiones independientes leyeron las reglas 6.8.0 antes de modificarlas:

- Proyecto nuevo: se escribió una Constitución draft v001; no se inicializó Git
  ni se creó un commit. El modelo señaló el conflicto entre la guía de plantillas
  y la frase de constitución que excluía commits como seguimiento automático.
- Cambio sustantivo: se conservaron exactamente los bytes aprobados mediante un
  snapshot nuevo, pero la base aprobada y la propuesta permanecieron fuera de
  commits. HEAD seguía conteniendo un borrador anterior. El índice y los archivos
  ajenos permanecieron intactos.

El checker independiente confirma ambos huecos bajo la política nueva. Son
fallos observados de persistencia exigida, no pérdida de archivos ni defectos de
instalación. Las reglas anteriores permitían la conservación mediante snapshot.

## Matriz con las instrucciones actualizadas

La inspección independiente de fixtures con el checker corregido pasó 214
comprobaciones positivas de estado Git/bytes. Los bloqueos se consideran un
resultado correcto de protección, no un hito de persistencia completado.

| Grupo | Resultado observado | Checks del checker |
|---|---|---:|
| 14 variantes de límites | Proyecto nuevo, repositorio existente, worktree y principal preservado; read-only, no-commit, identidad faltante, hook fallido, Git ausente y permisos denegados; raíz incorrecta/ambigua sin escritura. | 77 |
| Aprobación y mantenimiento relacionados | Presentación A y registro B simulado; parcial pendiente; Spec aprobado sin commit registrado antes del cambio; Plan conserva base aprobada, IDs y resultados; RELEASE previo recuperable antes de su edición editorial. | 50 |
| 5 transiciones | Plan genérico después de self-review, corrección acotada sin documentación extra, resultados durables antes de cleanup, no-op y dependencia exacta sin ejecución autorizada. | 49 |
| Repetición posterior a correcciones | Ejemplo de commit excluye archivo staged ajeno; no-commit conserva Plan, HEAD y scratch con limpieza pendiente. | 20 |
| Evidencia material y contradicción posterior | Plan y release v001→v002→v003 independientes; decisión original y resultado histórico literal, afirmación actual corregida y tarea bloqueada sin completar. | 18 |

La revisión semántica de la fixture de aprobación encontró un estado canónico
obsoleto del Plan aunque los bytes/pins pasaban el checker. La fixture final lo
reconcilia y agrega impacto sobre tareas futuras sin adoptar la Spec propuesta;
13 aserciones semánticas pasaron. Esto ejemplifica el límite del checker.

Los intentos exploratorios también están conservados: Git infería una identidad
local pese a aislar configuración global/sistema; para reproducir identidad
configurada faltante se usó `user.useConfigOnly=true` únicamente en la fixture.
Otra expectativa intentó proteger `.git`, ruta prohibida por la API del checker;
se corrigió usando `mode=no_git` y prueba directa de ausencia del marcador.

## Correcciones encontradas durante la evaluación

1. El ejemplo de commit de tareas incluía una nota ajena ya staged. Se reprodujo
   con Git real y el checker lo rechazó; el ejemplo usa ahora rutas explícitas.
2. Los cierres de ejecución aún declaraban el mensaje final como único lugar de
   decisiones. Conservan sus listas finales y exigen registrar/verificar los
   resultados durables en el Plan o registro existente antes de eliminar scratch.
   Un bloqueo de commits deja también pendiente la limpieza.
3. El checker omitía los cambios de un merge y podía aceptar una ruta ajena. Una
   prueba de regresión reprodujo el falso positivo; ahora compara contra el primer
   padre, o árbol vacío para un commit raíz. Se verificó el rechazo del merge.

## Evidencia y límites

[Evidencia durable](2026-10-07-git-document-lifecycle-evidence.json) conserva
operaciones, hashes, expectativas y resultados de fixtures. Las decisiones de
aprobación en esos fixtures son simuladas y están identificadas como tales; no
aprueban el producto original. Las sesiones de modelos recibieron las fuentes
seleccionadas explícitamente: prueban razonamiento y operaciones locales, no
selección automática de skills en una instalación nativa.

El checker lee commits, blobs, rutas, bytes e índice. No interpreta por sí mismo
la autoridad humana ni el significado de un criterio; esas comprobaciones se
registran aparte. Las pruebas de empaquetado congelan las fuentes en un ref y
contrastan los bytes ZIP/tar.gz, incluso con modificaciones posteriores no
committed de la referencia compartida.

## Comprobaciones finales

Implementación local: commit `43bcf575de2d05b81a2838cc2c79526044651e80`.
Se verificaron contra ese commit los bytes de las 22 fuentes/pruebas modificadas.
La revisión independiente no dejó hallazgos pendientes; las tablas existentes de
skills y `using-git-worktrees` se conservaron. El avance/evidencia del plan se
registra posteriormente, sin cambiar su aprobación original.

| Comando | Resultado |
|---|---|
| `python3 -m unittest discover -s tests/documentation -p 'test_*.py'` | 10 tests, OK; incluye controles negativos de contenido, pin, índice ajeno, worktree y merge. |
| `bash tests/codex/test-package-codex-plugin.sh` | 97 comprobaciones PASS; ref seleccionado, ZIP/tar.gz y fallback de metadatos. |
| `bash tests/codex/test-marketplace-manifest.sh` | Exit 0. |
| `bash tests/claude-code/test-release-plan-brief.sh` | Exit 0; extracción de tareas. |
| `bash tests/claude-code/test-executing-plans-scripts.sh` | 10 comprobaciones PASS. |
| `bash tests/claude-code/test-sdd-workspace.sh` | 24 comprobaciones PASS. |
| `git diff --check` | Exit 0, sin errores. |

Los 14 enlaces nuevos a la referencia compartida resolvieron a archivos reales.
Los paquetes se comprueban también desde el commit de implementación; la versión
publicada continúa en 6.8.0. Los logs completos, registros de 28 commits y bytes de sus blobs
relevantes de fixtures están conservados en el JSON junto a sus expectativas.

## Pendiente instalado

Publicar cuando se solicite, actualizar Codex App y repetir en conversaciones
nuevas sin nombrar manualmente skills: presentación, aprobación, continuidad,
cambio sustantivo con Plan fijado a la base aprobada, actualización editorial de
release y commits bloqueados/prohibidos. Importar las fuentes/documentos de prueba
en un repositorio de copia aislada; preservar el sandbox original. No se realizó
bump, push, migración del sandbox ni afirmación de activación nativa en este plan.
