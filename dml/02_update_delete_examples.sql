BEGIN;
SET search_path = shop, public;

-- UPDATE: cambiar email y ciudad de un cliente
UPDATE customers
SET email = 'jperez_nuevo@example.com', city = 'La Serena'
WHERE id = 1;

-- UPDATE: ajustar stock de un producto
UPDATE products
SET stock = stock - 3
WHERE id = 4;

-- DELETE: eliminar un pedido no procesado
DELETE FROM orders
WHERE id = 2 AND status = 'pendiente';

COMMIT;