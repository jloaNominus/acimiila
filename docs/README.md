# AciMiila - Guía central del proyecto

Esta carpeta concentra la documentación base para la reestructuración de informática de ACI y Miila. El objetivo es que esta guía funcione como mapa de trabajo, referencia de arquitectura y memoria viva del repositorio.

## Qué problema resuelve

El estado actual mezcla lógica académica, administrativa y operativa en una sola zona desordenada, apoyada históricamente en Moodle y Google DataSheets. La meta es separar responsabilidades, definir fuentes de verdad claras y permitir que cada plataforma haga solo lo que mejor sabe hacer.

## Estructura recomendada

- [00-contexto/vision-estrategica.md](00-contexto/vision-estrategica.md)
- [01-arquitectura/alto-nivel.md](01-arquitectura/alto-nivel.md)
- [01-arquitectura/fuentes-de-verdad-y-orquestacion.md](01-arquitectura/fuentes-de-verdad-y-orquestacion.md)
- [02-plataformas/moodle.md](02-plataformas/moodle.md)
- [02-plataformas/acimiila.md](02-plataformas/acimiila.md)
- [02-plataformas/orquestador.md](02-plataformas/orquestador.md)
- [03-migracion/migracion-por-etapas.md](03-migracion/migracion-por-etapas.md)
- [estandar-nomenclatura.md](estandar-nomenclatura.md)

## Principios guía

- Moodle conserva el aprendizaje, el contenido didáctico y la experiencia metodológica acumulada.
- AciMiila centraliza la lógica relacional, comercial y administrativa.
- El orquestador traduce eventos entre ambos mundos sin forzar a una plataforma a resolver el problema de la otra.
- La migración debe ser por etapas, con trazabilidad y criterios de salida claros.

## Cómo usar esta documentación

1. Lee primero la visión estratégica para entender el porqué.
2. Revisa la arquitectura para entender el qué y el dónde vive cada responsabilidad.
3. Usa los documentos de plataforma para aterrizar implementación y límites.
4. Usa la ruta de migración para planificar entregas incrementales.
