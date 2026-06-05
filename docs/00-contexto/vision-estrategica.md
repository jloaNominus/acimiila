# Visión estratégica

## Contexto

ACI y Miila han crecido hasta convertirse en academias reconocidas. La arquitectura histórica fue suficiente para una operación pequeña, pero hoy ya no escala porque mezcló aprendizaje, administración y lógica de negocio en herramientas que no fueron diseñadas para sostener esa complejidad.

## Objetivo

Separar claramente dos dominios:

- Moodle como plataforma de aprendizaje, no relacional, enfocada en enseñanza, cursos, grupos, contenidos, actividades y calificaciones.
- AciMiila como plataforma relacional, normalizada y centralizada, encargada del control comercial, administrativo y empresarial.

## Resultado esperado

Cada plataforma debe ser fuerte en su especialidad y conversar mediante reglas explícitas. No se busca duplicar el mismo problema en dos sitios; se busca definir quién sabe la verdad de cada dato y cómo se traduce esa verdad entre sistemas.

## Tesis central

El problema no se resuelve moviendo datos desordenados a una base relacional. El problema se resuelve modelando, normalizando, separando responsabilidades y orquestando los intercambios de información según reglas de negocio bien definidas.
