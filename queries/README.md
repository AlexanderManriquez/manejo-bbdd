# Propósito

Esta carpeta contiene las consultas DQL del proyecto "Tienda En Línea". Incluye consultas de obtención de información utilizando `SELECT`, `JOIN`, `GROUP BY`, `HAVING` y funciones de agregación.

## Archivos

- **01_examples.sql**: Contiene todas las consultas de lectura, incluyendo:
  - Pedidos por cliente
  - Productos por pedido
  - Total de ventas
  - Clientes con más de dos pedidos
  - Detalle completo de un pedido

## Instrucciones de ejecución

Ejecutar el archivo dentro del motor SQL correspondiente:

```bash
psql -d tienda_db -f queries/01_examples.sql
```
