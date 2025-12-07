# Propósito

Esta carpeta contiene el script DDL para crear el esquema de la base de datos del proyecto "Tienda En Línea". El archivo principal es `01_create_schema.sql` y crea tablas, constraints e índices necesarios para las etapas iniciales del proyecto.

## Instrucciones de ejecución (PostgreSQL)

1. Crear la base de datos (si no existe):

```bash
createdb tienda_db
```

2. Ejecutar el script DDL:

```bash
psql -d tienda_db -f ddl/01_create_schema.sql
```

3. Verificar que las tablas hayan sido creadas con `\dt` desde `psql` o consultando `information_schema`.

## Notas

- `order_items.subtotal` usa columna generada (Postgres). Si tu SGBD no soporta esta característica, calcula el subtotal en SELECT o implementa un trigger.
- Ajusta nombres y tipos si deseas migrar a MySQL u otro SGBD.
