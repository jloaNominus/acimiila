# AciMiila

## Rol dentro de la arquitectura

AciMiila es la plataforma relacional central. Debe consolidar la lógica comercial, administrativa, operativa y empresarial de la academia.

## Componentes

- Base de datos MariaDB mono-tenant y monorepo.
- Backend PHP con cuatro capas: DDL, DAL, BLL y Service Layer.
- FrontEnd web en Flutter/Dart.
- FrontEnd nativo en Flutter/Dart para Android e iOS.
- API para orquestación AciMiila -> Moodle.

## Submódulos iniciales

- Personas.
- Academia.
- CRM.
- ERP.

## Regla de implementación

La estrategia es dbFirst, pero con reglaje en PHP como si fuera codeFirst. Eso permite modelar con disciplina, mantener consistencia con la base y conservar una arquitectura de negocio clara.
