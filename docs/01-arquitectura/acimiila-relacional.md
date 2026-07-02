# AciMiila relacional

Esta arquitectura asienta bases para toda la capa relacional.

## Desarrollo por capas

### 1. SQL mariaDB

Repositorio real de datos.  Se usará como DB-relacional estricto  (no usamos la parte no relacional del motor SQL).

- SQL DDL   (tablas y vistas)
- SQL DMO   (modelado y entidades relacionales)

Este desarrollo se refleja en su [Script de Creación AciMiila](script-acimiila.sql)

### 2. Acceso a datos

- Modelamos en PHP las tablas, modelado y entidades relacionales como OOP, conectados a la capa SQL anterior.
- Exponemos funciones, métodos y propiedades librerías PHP para tareas tales como CRUDs y DTOs.

### 3. Servicio API

- En PHP, creamos un proyecto que exponga endpoints que consumen recursos de la la capa anterior, de acceso a datos.


## Módulos

Por ahora, los módulos para segmentar el proyecto se identifica con tres letras, que son prefijo en las tablas del repositorio SQL:

`Iso`:      Tablas de referencia universal (realmente no es un módulo, sino tablas cruzadas)
`Per`:      Módulo de personas (directorio con identidades y contactos)
`Mat`:      Módulo para el control y seguimiento de matrículas  (matrícula es el producto que vende AciMiila como empresa)
`Lrn`:      Módulo para organizar términos de academia, necesarios para la orquestación el Moodle-no-relacional


## Jerarquía de la solución PHP

phpServer/
├── src/
│   ├── Core/          (Conexión a la DB con PDO)
│   ├── Models/        (Tus clases: Persona, Matricula, etc.)
│   ├── Repositories/  (Tu lógica SQL envuelta en funciones PHP)
│   └── Services/      (La lógica de negocio)
└── public/            (Los puntos de entrada de tu API)

