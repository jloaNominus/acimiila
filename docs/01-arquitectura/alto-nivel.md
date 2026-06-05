# Arquitectura de alto nivel

## Capas del ecosistema

### Moodle

- LMS ya implementado.
- No relacional.
- Mantiene el contenido y la experiencia pedagógica.
- Expone un servidor API que permitirá eventos y consultas hacia AciMiila.

### AciMiila

- DBRMS relacional sobre MariaDB.
- Monorepo y mono-tenant.
- Contiene la lógica administrativa, comercial y operativa.
- Expone su propio servidor API para hablar hacia Moodle.
- Incluye backend PHP a cuatro capas, front web en Flutter y apps nativas en Flutter.

### Orquestador

- Capa de conversación entre Moodle y AciMiila.
- Convierte eventos y respuestas entre ambos mundos.
- No reemplaza a ninguna plataforma.
- Permite trazabilidad, control y observabilidad de integraciones.

## Responsabilidad de cada sistema

- Moodle decide sobre aprendizaje, cursos, actividades, calificaciones y contexto pedagógico.
- AciMiila decide sobre persona, matrícula, pagos, convenios, estado administrativo, recursos empresariales y trazabilidad relacional.
- El orquestador decide cómo traducir un evento de un dominio al otro.

## Regla de diseño

Cada dato debe tener una fuente de verdad principal. Si un dato nace en Moodle, AciMiila puede consumirlo y modelarlo, pero no debe convertir Moodle en un ERP. Si un dato nace en AciMiila, Moodle puede recibir su consecuencia funcional, pero no debe convertirse en la base maestra administrativa.
