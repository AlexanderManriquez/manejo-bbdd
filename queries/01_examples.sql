-- 1. Obtener todos los pedidos de un cliente específico
SELECT p.pedido_id, p.fecha_pedido, p.total
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.cliente_id
WHERE c.nombre = 'Juan Pérez';

-- 2. Listar todos los productos incluidos en un pedido
SELECT pr.nombre, pp.cantidad, pr.precio
FROM productos pr
JOIN pedidos_productos pp ON pr.producto_id = pp.producto_id
WHERE pp.pedido_id = 1;

-- 3. Consultar el total de ventas (sumatoria del total de cada pedido)
SELECT SUM(total) AS total_ventas
FROM pedidos;

-- 4. Obtener los clientes con más de 2 pedidos
SELECT c.nombre, COUNT(p.pedido_id) AS cantidad_pedidos
FROM clientes c
JOIN pedidos p ON c.cliente_id = p.cliente_id
GROUP BY c.nombre
HAVING COUNT(p.pedido_id) > 2;

-- 5. Mostrar el detalle completo de un pedido (cliente + productos + totales)
SELECT p.pedido_id, c.nombre AS cliente, pr.nombre AS producto,
pp.cantidad, pr.precio, (pp.cantidad * pr.precio) AS subtotal
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.cliente_id
JOIN pedidos_productos pp ON p.pedido_id = pp.pedido_id
JOIN productos pr ON pp.producto_id = pr.producto_id
WHERE p.pedido_id = 1;