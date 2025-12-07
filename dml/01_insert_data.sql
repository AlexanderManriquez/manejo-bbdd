BEGIN;
INSERT INTO categories (name, description) VALUES
('Electrónica', 'Dispositivos electrónicos y accesorios'),
('Hogar', 'Artículos para el hogar'),
('Ropa', 'Vestuario masculino y femenino');

INSERT INTO customers (first_name, last_name, email, phone, address, city) VALUES
('Juan', 'Pérez', 'juan.perez@example.com', '987654321', 'Av. Central 123', 'Santiago'),
('María', 'Gómez', 'maria.gomez@example.com', '912345678', 'Calle Norte 45', 'Valparaíso'),
('Luis', 'Rojas', 'lrojas@example.com', '998877665', 'Diagonal Sur 9', 'Concepción');

INSERT INTO products (name, sku, description, price, stock, category_id) VALUES
('Smartphone A1', 'SP-A1', 'Smartphone gama media', 199900, 20, 1),
('Audífonos X', 'HD-X', 'Audífonos inalámbricos', 29990, 50, 1),
('Cafetera Pro', 'CF-PRO', 'Cafetera automática', 79990, 15, 2),
('Polera básica', 'TS-BASIC', 'Polera de algodón 100%', 12990, 100, 3);

INSERT INTO orders (customer_id, status, total) VALUES
(1, 'procesando', 0),
(2, 'pendiente', 0);


INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 199900),
(1, 2, 2, 29990),
(2, 4, 3, 12990);

UPDATE orders SET total = (
SELECT SUM(subtotal) FROM order_items WHERE order_items.order_id = orders.id
);

INSERT INTO payments (order_id, amount, method, reference) VALUES
(1, 259880, 'tarjeta', 'POS12345');

COMMIT;