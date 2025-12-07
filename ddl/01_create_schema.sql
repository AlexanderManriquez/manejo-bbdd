BEGIN;

-- Creación del esquema 'shop'
CREATE SCHEMA IF NOT EXISTS shop;
SET search_path = shop, public;

-- Categorias
CREATE TABLE categories (
id SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL UNIQUE,
description TEXT
);

-- Clientes
CREATE TABLE customers (
id SERIAL PRIMARY KEY,
first_name VARCHAR(100) NOT NULL,
last_name VARCHAR(100) NOT NULL,
email VARCHAR(150) NOT NULL UNIQUE,
phone VARCHAR(30),
address TEXT,
city VARCHAR(100),
created_at TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW()
);

-- Empleados
CREATE TABLE employees (
id SERIAL PRIMARY KEY,
first_name VARCHAR(100) NOT NULL,
last_name VARCHAR(100) NOT NULL,
role VARCHAR(50),
hire_date DATE
);

-- Productos
CREATE TABLE products (
id SERIAL PRIMARY KEY,
name VARCHAR(200) NOT NULL,
sku VARCHAR(50) UNIQUE,
description TEXT,
price NUMERIC(10,2) NOT NULL CHECK (price >= 0),
stock INTEGER NOT NULL DEFAULT 0,
category_id INTEGER REFERENCES categories(id) ON DELETE SET NULL
);

-- Ordenes
CREATE TABLE orders (
id SERIAL PRIMARY KEY,
customer_id INTEGER NOT NULL REFERENCES customers(id) ON DELETE CASCADE,
employee_id INTEGER REFERENCES employees(id) ON DELETE SET NULL,
status VARCHAR(30) NOT NULL DEFAULT 'pendiente',
total NUMERIC(10,2) NOT NULL DEFAULT 0,
order_date TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW()
);

-- Detalles de Orden
CREATE TABLE order_items (
id SERIAL PRIMARY KEY,
order_id INTEGER NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
product_id INTEGER NOT NULL REFERENCES products(id) ON DELETE RESTRICT,
quantity INTEGER NOT NULL CHECK (quantity > 0),
unit_price NUMERIC(10,2) NOT NULL CHECK (unit_price >= 0),
subtotal NUMERIC(12,2) GENERATED ALWAYS AS (quantity * unit_price) STORED
);

-- Pagos
CREATE TABLE payments (
id SERIAL PRIMARY KEY,
order_id INTEGER NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
payment_date TIMESTAMP WITHOUT TIME ZONE DEFAULT NOW(),
amount NUMERIC(10,2) NOT NULL CHECK (amount >= 0),
method VARCHAR(50),
reference VARCHAR(200)
);

-- Índices útiles
CREATE INDEX idx_customers_city ON customers(city);
CREATE INDEX idx_products_name ON products(name);
CREATE INDEX idx_orders_customer ON orders(customer_id);
CREATE INDEX idx_orderitems_order ON order_items(order_id);

COMMIT;