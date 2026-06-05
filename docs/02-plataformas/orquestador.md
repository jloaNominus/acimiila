# Orquestador

## Propósito

El orquestador promueve y administra la conversación entre Moodle y AciMiila. Es el mecanismo que traduce eventos, aplica reglas de negocio de integración y mantiene visibilidad sobre lo que se movió, cuándo y por qué.

## Funciones esperadas

- Recibir eventos de Moodle.
- Consultar o notificar a AciMiila.
- Recibir eventos de AciMiila.
- Consultar o notificar a Moodle.
- Registrar auditoría e intentos de integración.

## Consola de control

Debe existir una consola para:

- ver eventos procesados;
- revisar errores y reintentos;
- inspeccionar reglas activas;
- consultar colas, estados y trazas;
- validar qué sistema es fuente de verdad en cada flujo.

## Principio operativo

El orquestador no debe convertirse en una tercera fuente de verdad de negocio. Su valor está en coordinar, traducir y observar.
