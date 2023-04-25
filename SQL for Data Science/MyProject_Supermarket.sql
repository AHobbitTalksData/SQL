Author: Jessy Acuña Rodríguez
Date: 04/24/2023

-- create the database
CREATE DATABASE supermarket;

-- switch to the supermarket database
USE supermarket;

-- create a table for product categories
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

-- insert some sample categories
INSERT INTO categories (category_id, category_name)
VALUES
    (1, 'Produce'),
    (2, 'Dairy'),
    (3, 'Meat'),
    (4, 'Bakery'),
    (5, 'Frozen');

-- create a table for products
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category_id INT NOT NULL,
    price DECIMAL(8,2) NOT NULL,
    date_added DATE NOT NULL
);

-- insert some sample products
INSERT INTO products (product_id, product_name, category_id, price, date_added)
VALUES
    (1, 'Apples', 1, 1.50, '2022-01-01'),
    (2, 'Bananas', 1, 1.25, '2022-01-01'),
    (3, 'Carrots', 1, 1.00, '2022-01-02'),
    (4, 'Broccoli', 1, 2.00, '2022-01-02'),
    (5, 'Milk', 2, 3.50, '2022-01-01'),
    (6, 'Cheese', 2, 4.00, '2022-01-03'),
    (7, 'Ground Beef', 3, 5.00, '2022-01-02'),
    (8, 'Chicken Breasts', 3, 6.00, '2022-01-04'),
    (9, 'Bread', 4, 2.50, '2022-01-01'),
    (10, 'Bagels', 4, 3.00, '2022-01-05'),
    (11, 'Ice Cream', 5, 4.50, '2022-01-03'),
    (12, 'Frozen Vegetables', 5, 3.00, '2022-01-04'),
    (13, 'Oranges', 1, 2.00, '2022-01-03'),
    (14, 'Yogurt', 2, 2.75, '2022-01-02'),
    (15, 'Pork Chops', 3, 7.00, '2022-01-05');

-- create a table for customers
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL
);

-- insert some sample customers
INSERT INTO customers (customer_id, first_name, last_name, email)
VALUES
    (1, 'John', 'Doe', 'john.doe@example.com'),
    (2, 'Jane', 'Smith', 'jane.smith@example.com'),
    (3, 'Bob', 'Jones', 'bob.jones@example.com');

-- create a table for orders
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL
);

-- Inserting data into the "product_info" table
INSERT INTO product_info (product_id, product_name, brand_name, category, description, price, unit_of_measure, expiry_date)
VALUES
(1, 'Bananas', 'Chiquita', 'Fruits', 'Fresh and sweet bananas', 0.79, 'per pound', '2023-05-01'),
(2, 'Apples', 'Honeycrisp', 'Fruits', 'Crisp and juicy apples', 1.29, 'per pound', '2023-04-30'),
(3, 'Milk', 'Organic Valley', 'Dairy', 'Organic whole milk', 3.99, 'per gallon', '2023-05-10'),
(4, 'Eggs', 'Organic Valley', 'Dairy', 'Organic large brown eggs', 3.29, 'per dozen', '2023-05-05'),
(5, 'Bread', 'Dave''s Killer Bread', 'Bakery', 'Organic 21 Whole Grains and Seeds Bread', 4.99, 'per loaf', '2023-04-29'),
(6, 'Ground Beef', 'Organic Prairie', 'Meat', 'Organic grass-fed ground beef', 8.99, 'per pound', '2023-04-30'),
(7, 'Salmon', 'Alaskan Seafood', 'Seafood', 'Wild-caught Alaskan salmon', 12.99, 'per pound', '2023-05-03'),
(8, 'Broccoli', 'Dole', 'Vegetables', 'Fresh and crisp broccoli', 2.49, 'per pound', '2023-05-02'),
(9, 'Carrots', 'Grimmway Farms', 'Vegetables', 'Organic baby carrots', 1.99, 'per bag', '2023-05-01'),
(10, 'Potatoes', 'Idahoan', 'Vegetables', 'Idaho russet potatoes', 0.89, 'per pound', '2023-05-04'),
(11, 'Toilet Paper', 'Charmin', 'Household', 'Ultra-soft toilet paper', 7.99, 'per pack of 12', '2024-06-01'),
(12, 'Paper Towels', 'Bounty', 'Household', 'Select-A-Size paper towels', 10.99, 'per pack of 8', '2024-07-01'),
(13, 'Laundry Detergent', 'Tide', 'Household', 'Original scent liquid laundry detergent', 11.99, 'per bottle', '2023-12-01'),
(14, 'Hand Soap', 'Mrs. Meyer''s', 'Household', 'Basil scented hand soap', 3.99, 'per bottle', '2023-11-01'),
(15, 'All-Purpose Cleaner', 'Method', 'Household', 'Pink grapefruit scented all-purpose cleaner', 4.99, 'per bottle', '2023-10-01');

-- Creating the "product_sales" table
CREATE TABLE product_sales (
sale_id INT PRIMARY KEY,
product_id INT,
sale_date DATE,
sale_price DECIMAL(5,2),
sale_quantity INT,
sale_total DECIMAL(8,2),
FOREIGN KEY (product_id) REFERENCES product_info(product_id)
);

-- Creating the stores table
CREATE TABLE stores (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(50) NOT NULL,
    location VARCHAR(50) NOT NULL
);

-- Inserting data into the stores table
INSERT INTO stores (store_id, store_name, location)
VALUES 
    (1, 'SuperMart', 'New York'),
    (2, 'Grocery World', 'California'),
    (3, 'FoodBazaar', 'New Jersey'),
    (4, 'MegaMart', 'Texas'),
    (5, 'Market Basket', 'Massachusetts');

-- Creating the inventory table
CREATE TABLE inventory (
    product_id INT,
    store_id INT,
    quantity INT NOT NULL,
    date_added DATE NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (store_id) REFERENCES stores(store_id)
);

-- Inserting data into the inventory table
INSERT INTO inventory (product_id, store_id, quantity, date_added)
VALUES
    (1, 1, 100, '2023-04-20'),
    (2, 1, 50, '2023-04-20'),
    (3, 1, 75, '2023-04-20'),
    (4, 2, 200, '2023-04-21'),
    (5, 2, 150, '2023-04-21'),
    (6, 3, 80, '2023-04-22'),
    (7, 3, 100, '2023-04-22'),
    (8, 3, 50, '2023-04-22'),
    (9, 4, 300, '2023-04-23'),
    (10, 4, 200, '2023-04-23'),
    (11, 5, 120, '2023-04-23'),
    (12, 5, 80, '2023-04-23'),
    (13, 1, 25, '2023-04-24'),
    (14, 2, 50, '2023-04-24'),
    (15, 3, 75, '2023-04-24');

-- Query to get the products and their prices
SELECT products.product_name, prices.price 
FROM products 
INNER JOIN prices ON products.product_id = prices.product_id 
WHERE prices.price > 3.00;

-- Query to get the products with low inventory
SELECT products.product_name, inventory.quantity 
FROM products 
INNER JOIN inventory ON products.product_id = inventory.product_id 
WHERE inventory.quantity < 50;

-- Query to get the total quantity of a product in all stores
SELECT products.product_name, SUM(inventory.quantity) AS total_quantity 
FROM products 
INNER JOIN inventory ON products.product_id = inventory.product_id 
GROUP BY products.product_name;

-- Query to get the stores that have a certain product in stock
SELECT stores.store_name, inventory.quantity 
FROM stores 
INNER JOIN inventory ON stores.store_id = inventory.store_id 
INNER JOIN products ON products.product_id = inventory.product_id 
WHERE products.product_name = 'Apples';
