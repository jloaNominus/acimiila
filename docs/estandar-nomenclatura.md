# Proyecto AciMiila. Estándares para nomenclatura

Este documento define el estándar técnico de nombres para el modelo de datos y los objetos DDL de AciMiila. Forma parte de una guía mayor de arquitectura y trabajo que vive en la misma carpeta `docs`.

Documentos relacionados:

- [Guía principal](README.md)
- [Visión estratégica](00-contexto/vision-estrategica.md)
- [Arquitectura de alto nivel](01-arquitectura/alto-nivel.md)
- [Fuentes de verdad y orquestación](01-arquitectura/fuentes-de-verdad-y-orquestacion.md)
- [Módulo AciMiila](02-plataformas/acimiila.md)
- [Módulo Moodle](02-plataformas/moodle.md)
- [Orquestador](02-plataformas/orquestador.md)
- [Ruta de migración](03-migracion/migracion-por-etapas.md)

## Patrón general de nomenclatura

### Columnas

Se adopta el patrón de nomenclatura `camelCase` para nombrar columnas, usando como primera palabra el prefijo ó letra que indica el tipo o precisión de la columna:

i:   integer (int)
b:   byte  (tynyint)
s:   short  (smallint)
l:   boolean (bit)
x:   string  (varchar(n))  string informativo
c:   string  (varchar(n),char(n))  string clave (string sin espacios ni caracteres especiales)
moo: string  (varchar(n))  string que es indice relativo  en el Moodle-LMS   (o diccionaroio hacia Moodle)
a:   array   conjunto de datos
o:   object  objeto de dato.
d:   date    (datetime)
t:   time    (time, timespan)
k:   string  (varchar(max))  encriptado

Ejemplos:
   iPersona (entero que identifica una persona)
   xApellidos (apellido de la persona)
   mooGrupo  (nombre como se identifica un grupo en el LMS Moodel, ej. 'BAQ-412-2E')

### Tablas y DDL

Se adopta el patrón de nomenclatura `PascalCase` para nombrar tablas y en general objetos de la capa de definición de datos (DDL)

Para aprovechar la inteligencia de creacíón de objetos durante la definición de datos, usamos el patrón `snake_case` que proponen la mayoría de los motores para la creación de constraints, foreign keys, index keys, primary keys.

Ejemplo:

```sql
CREATE TABLE PerPersona (
	iPersona INT UNSIGNED NOT NULL,
	xApellidos varchar(60) NOT NULL,
	xNombres varchar(60) NOT NULL,
    dNaci
	mooAlumno varchar(30) NULL,
	mooDocente varchar(30) NULL,
	CONSTRAINT PerPersona_pk PRIMARY KEY (iPersona)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb3
COLLATE=utf8mb3_unicode_ci;

CREATE TABLE PerEmail (
	iPersona INT UNSIGNED NOT NULL,
	bConsecutivo TINYINT UNSIGNED NOT NULL,
	xEmail varchar(100) NULL,
	lMoodle BOOL DEFAULT false NULL,
	CONSTRAINT PerEmail_PerPersona_FK FOREIGN KEY (iPersona) REFERENCES PerPersona(iPersona)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;
```

## Definición de módulos, submódulos y tablas contenidas

### Moodle

Este módulo corresponde a la plataforma LMS, no relacional.  Internamente maneja su propio estándar de submódulos y modelo relacional.  No se cubre con este estándar.

### AciMiila

Este módulo es la plataforma administrativa central de la academia, controla toda la actividad comercial (CRM) de recursos empresariales (ERP), recurso humano (HR), infraestructura y control académico (admininistración académica).  Establecemos los siguientes submódulos en este módulo:

#### Personas

Este submódulo identifica a todas las personas en rol neutro,  una especie de directorio general.  su prefijo es `Per`.  Ejemplos de tablas contenidas:  PerPersona, PerEmail, PerTelefono, PerRolMoodle.

#### Academia

Contiene toda la información que se encuentra en el Moodle LMS, no relacional, que requiere convertirse en información relacional estructurada, modelada y normalizada, tales como Cursos, Steps, Grupos, Horarios, Sedes, etc. Su prefijo es `Lrn`,  ejemplos de sus tablas contenidas: LrnGrupo, LrnSede, LrnPlanHorario, LrnProfesor,

#### CRM

Este módulo contiene información relevante en la etapa comercial y control de matrículas de la Alianza, así como el control de convenios en entidades, promociones y control de otras actividades anexas de la actividad académica (camping, intercambios, etc).   Pendiente aún de crear sus submódulos, pero planteamos inicialmente algunos:

`Ent`  es el submódulo de entidades (universidades, operadores comerciales, franquiciantes, etc.)
`Cmp`  es el submódulo de campañas comerciales ó campañas afines

#### ERP

Este submódulo contiene información básica operativa para el control de recursos empresariales.  Es el módulo que soportará la orquestación con el ERP externo, o agente contable.   Este ERP carga con los siguientes submódulos

`Cta`  Controla todos los estados de cuenta de alumnos, entidades, proveedores y docentes. 
`Tes`  Controla todo el flujo de información operativa de cobros (CxC - alumnos generalmente), y pagos (CxP - docentes principalmente).
`Rch`  Controla el flujo de información de recursos humanos, base para la liquidación periódica de nómina, bonos, primas, liquidaciones, etc.
