# Fuentes de verdad y orquestación

## Fuentes de verdad

### AciMiila es fuente de verdad para

- Identidad administrativa de la persona.
- Estado de matrícula, pagos y convenios.
- Relación comercial y contractual.
- Estados operativos que afectan acceso a servicios administrativos.

### Moodle es fuente de verdad para

- Actividad educativa.
- Progreso académico dentro del LMS.
- Calificaciones, entregas, participación y contexto didáctico.
- Evidencia del aprendizaje en el entorno pedagógico.

## Orquestación

La orquestación traduce hechos entre ambos dominios sin acoplarlos rígidamente. Ejemplos:

- Si Moodle registra que Juan ganó un quiz, el orquestador puede informar a AciMiila que hubo una evidencia de asistencia o participación.
- Si AciMiila marca a Pedro como moroso, el orquestador puede notificar a Moodle para restringir un quiz o una actividad.

## Qué debe evitarse

- No duplicar toda la lógica administrativa dentro de Moodle.
- No usar hojas de cálculo como repositorio estructural permanente.
- No asumir que mover datos a MariaDB resuelve el problema si no existe modelado ni normalización.
- No dejar que una integración técnica sustituya el diseño de negocio.

## Criterio práctico

La integración debe ser observable, reversible cuando aplique y explícita en sus reglas. Cada evento debe documentar:

- origen;
- transformación;
- destino;
- condición de negocio;
- resultado esperado.
