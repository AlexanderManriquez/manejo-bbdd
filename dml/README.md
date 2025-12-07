# Propósito

Esta carpeta contiene consultas DML del proyecto "Tienda En Línea". Incluye inserción de datos de ejemplo, actualizaciones y eliminaciones controladas.

## Archivos

- **01_insert_data.sql**: Inserta clientes, productos, categorías, órdenes y pagos.
- **02_update_delete_examples.sql**: Contiene ejemplos de UPDATE y DELETE solicitados.

## Instrucciones de ejecución

```bash
psql -d tienda_db -f dml/01_insert_data.sql
psql -d tienda_db -f dml/02_update_delete_examples.sql
```

## Notas

- Las órdenes recalculan automáticamente el total usando `SUM(subtotal)`.
- Los datos insertados permiten probar consultas JOIN en el Paso 3.
