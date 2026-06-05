# Migración por etapas

## Objetivo

Salir del modelo histórico disperso y llegar a una arquitectura estable sin perder el conocimiento acumulado en Moodle ni interrumpir la operación académica.

## Etapa 1 - Ordenar el discurso

- Definir arquitectura, fuentes de verdad y límites funcionales.
- Congelar el sentido de cada plataforma.
- Normalizar la nomenclatura y los submódulos de AciMiila.

## Etapa 2 - Modelar AciMiila

- Diseñar la base MariaDB.
- Definir DDL, DAL, BLL y Service Layer.
- Establecer Personas, Academia, CRM y ERP.

## Etapa 3 - Montar el orquestador

- Implementar eventos y endpoints iniciales.
- Traducir casos concretos entre Moodle y AciMiila.
- Incorporar observabilidad y auditoría.

## Etapa 4 - Desplazar lógica fuera de Moodle

- Extraer lo administrativo y comercial.
- Mantener Moodle solo como LMS.
- Evitar duplicidades de reglas y datos.

## Etapa 5 - Consolidar

- Revisar integridad de datos.
- Validar reglas de negocio.
- Estabilizar la operación y documentar el modelo final.
