# Manejo de Bases de Datos — Tienda En Línea

Breve repositorio de ejemplo para aprender y practicar el diseño y manejo de bases de datos relacionales (DDL, DML y consultas DQL) aplicado a una "Tienda En Línea".

## Estructura del repositorio

- **`ddl/`**: Scripts DDL para crear el esquema (tablas, constraints, índices). Archivo principal: `ddl/01_create_schema.sql`.
- **`dml/`**: Scripts DML con datos de ejemplo y operaciones de actualización/eliminación. Archivos: `dml/01_insert_data.sql`, `dml/02_update_delete_examples.sql`.
- **`queries/`**: Consultas de lectura (SELECT/JOIN/AGGREGATE). Archivo principal: `queries/01_examples.sql`.

## Requisitos

- **SGBD recomendado**: PostgreSQL (las instrucciones y algunos features usan sintaxis y características de PostgreSQL).
- **Herramientas**: `psql` (cliente de PostgreSQL).

## Instrucciones (PowerShell en Windows)

1.Crear la base de datos (si no existe):

```powershell
createdb tienda_db
```

2.Ejecutar el script DDL para crear el esquema:

```powershell
psql -d tienda_db -f ddl/01_create_schema.sql
```

3.Insertar datos de ejemplo:

```powershell
psql -d tienda_db -f dml/01_insert_data.sql
```

4.Ejecutar las consultas de ejemplo:

```powershell
psql -d tienda_db -f queries/01_examples.sql
```

Si prefieres usar Docker y no tener PostgreSQL instalado localmente, puedes ejecutar un contenedor oficial de Postgres, cargar los scripts y ejecutar con `psql` desde el host o dentro del contenedor.

## Notas y consideraciones

- El proyecto utiliza una columna calculada (`order_items.subtotal`) y operaciones que pueden apoyarse en funciones específicas de PostgreSQL. Si migras a MySQL u otro SGBD, ajusta la definición (p. ej. triggers o cálculos en SELECT).
- Ejecuta los scripts en el orden: DDL → DML → queries.
- Para pruebas seguras, crea snapshots o ejecuta los scripts en una base de datos de desarrollo/temporal.

## Siguientes pasos recomendados

- Añadir un diagrama ER y/o `schema/diagram.png` para visualizar relaciones.
- Añadir un script `reset_db.ps1` o `Makefile` para automatizar creación y carga de datos.
- Incluir ejemplos de salida esperada o tests SQL para validar integridad.

## Autor / Contacto

- Autor: `AlexanderManriquez` (repositorio: `manejo-bbdd`).

## Licencia

- Licencia MIT.
