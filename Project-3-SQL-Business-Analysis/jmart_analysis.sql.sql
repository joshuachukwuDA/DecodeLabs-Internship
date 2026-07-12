
-- DecodeLabs Project 3: SQL Data Analysis
-- Dataset: J-Mart (Mrs. Adeyemi's 6-branch supermarket chain)
-- Author: Joshua Chukwu | JC Analytics

-- CREATE DATABASE jmart_universe

-- STEP 1: SCHEMA

DROP TABLE IF EXISTS sales;

CREATE TABLE sales (
    sale_id       SERIAL PRIMARY KEY,
    branch        VARCHAR(50)   NOT NULL,
    category      VARCHAR(50)   NOT NULL,
    product_name  VARCHAR(100)  NOT NULL,
    quantity      INT           NOT NULL,
    unit_price    NUMERIC(10,2) NOT NULL,
    staff_name    VARCHAR(100),          -- some NULLs (unassigned sales)
    sale_date     DATE          NOT NULL
);

-- STEP 2: SEED DATA (30 rows, 6 branches, 5 categories, some NULL staff)

INSERT INTO sales (branch, category, product_name, quantity, unit_price, staff_name, sale_date) VALUES
('Enugu Main',     'Groceries',  'Rice 5kg',            12,  4500.00, 'Ifeoma Nwosu',     '2026-05-01'),
('Enugu Main',     'Beverages',  'Coke 50cl',           40,   250.00, 'Ifeoma Nwosu',     '2026-05-01'),
('Enugu Main',     'Toiletries', 'Toothpaste',          20,   800.00, NULL,               '2026-05-02'),
('Onitsha Branch', 'Groceries',  'Rice 5kg',             8,  4600.00, 'Chidi Eze',        '2026-05-02'),
('Onitsha Branch', 'Beverages',  'Fanta 50cl',          35,   250.00, 'Chidi Eze',        '2026-05-03'),
('Onitsha Branch', 'Electronics','Extension Box',        5,  3500.00, NULL,               '2026-05-03'),
('Aba Branch',     'Groceries',  'Beans 5kg',           15,  5200.00, 'Grace Okoye',      '2026-05-04'),
('Aba Branch',     'Toiletries', 'Bathing Soap',        25,   600.00, 'Grace Okoye',      '2026-05-04'),
('Aba Branch',     'Beverages',  'Coke 50cl',           30,   250.00, NULL,               '2026-05-05'),
('Awka Branch',    'Groceries',  'Rice 5kg',            10,  4550.00, 'Emeka Umeh',       '2026-05-05'),
('Awka Branch',    'Electronics','Rechargeable Lamp',    6,  6000.00, 'Emeka Umeh',       '2026-05-06'),
('Awka Branch',    'Toiletries', 'Toothpaste',          18,   800.00, NULL,               '2026-05-06'),
('Nsukka Branch',  'Groceries',  'Beans 5kg',           14,  5100.00, 'Amaka Obi',        '2026-05-07'),
('Nsukka Branch',  'Beverages',  'Fanta 50cl',          28,   250.00, 'Amaka Obi',        '2026-05-07'),
('Nsukka Branch',  'Electronics','Extension Box',        4,  3500.00, NULL,               '2026-05-08'),
('Abakaliki Branch','Groceries', 'Rice 5kg',            11,  4500.00, 'Uche Nnaji',       '2026-05-08'),
('Abakaliki Branch','Toiletries','Bathing Soap',        22,   600.00, 'Uche Nnaji',       '2026-05-09'),
('Abakaliki Branch','Beverages', 'Coke 50cl',           33,   250.00, NULL,               '2026-05-09'),
('Enugu Main',     'Electronics','Rechargeable Lamp',    7,  6000.00, 'Ifeoma Nwosu',     '2026-05-10'),
('Onitsha Branch', 'Groceries',  'Beans 5kg',           16,  5150.00, 'Chidi Eze',        '2026-05-10'),
('Aba Branch',     'Electronics','Extension Box',        3,  3500.00, 'Grace Okoye',      '2026-05-11'),
('Awka Branch',    'Beverages',  'Fanta 50cl',          31,   250.00, NULL,               '2026-05-11'),
('Nsukka Branch',  'Toiletries', 'Toothpaste',          19,   800.00, 'Amaka Obi',        '2026-05-12'),
('Abakaliki Branch','Electronics','Rechargeable Lamp',   5,  6000.00, 'Uche Nnaji',       '2026-05-12'),
('Enugu Main',     'Groceries',  'Beans 5kg',           13,  5200.00, NULL,               '2026-05-13'),
('Onitsha Branch', 'Toiletries', 'Bathing Soap',        24,   600.00, 'Chidi Eze',        '2026-05-13'),
('Aba Branch',     'Beverages',  'Coke 50cl',           27,   250.00, 'Grace Okoye',      '2026-05-14'),
('Awka Branch',    'Groceries',  'Rice 5kg',             9,  4550.00, 'Emeka Umeh',       '2026-05-14'),
('Nsukka Branch',  'Beverages',  'Fanta 50cl',          26,   250.00, NULL,               '2026-05-15'),
('Abakaliki Branch','Groceries', 'Beans 5kg',           17,  5100.00, 'Uche Nnaji',       '2026-05-15');


-- STEP 3: PROJECT 3 REQUIRED QUERIES


-- 3.1 Basic SELECT: view all sales
SELECT * FROM sales;

-- 3.2 SELECT specific columns with alias
SELECT branch, product_name, quantity, unit_price AS price_per_unit
FROM sales;

-- 3.3 WHERE - Equality: sales from a specific branch
SELECT * FROM sales
WHERE branch = 'Enugu Main';

-- 3.4 WHERE - Comparison: high-value sales (quantity >= 20)
SELECT branch, product_name, quantity
FROM sales
WHERE quantity >= 20
ORDER BY quantity DESC;

-- 3.5 WHERE - Pattern matching: all Rice products
SELECT branch, product_name, unit_price
FROM sales
WHERE product_name LIKE 'Rice%';

-- 3.6 WHERE - Handling NULLs: sales with no staff assigned
SELECT branch, category, product_name, sale_date
FROM sales
WHERE staff_name IS NULL;

-- 3.7 GROUP BY + COUNT: number of sales per branch
SELECT branch, COUNT(*) AS total_sales
FROM sales
GROUP BY branch
ORDER BY total_sales DESC;

-- 3.8 GROUP BY + SUM: total revenue per branch
-- (revenue = quantity * unit_price, calculated per row then summed)
SELECT branch,
       SUM(quantity * unit_price) AS total_revenue
FROM sales
GROUP BY branch
ORDER BY total_revenue DESC;

-- 3.9 GROUP BY + AVG: average unit price per category
SELECT category, ROUND(AVG(unit_price), 2) AS avg_price
FROM sales
GROUP BY category
ORDER BY avg_price DESC;

-- 3.10 GROUP BY with multiple columns: revenue per branch per category
SELECT branch, category,
       SUM(quantity * unit_price) AS category_revenue
FROM sales
GROUP BY branch, category
ORDER BY branch, category_revenue DESC;

-- 3.11 HAVING (bonus - filtering aggregated data):
-- branches whose total revenue exceeds 100,000
SELECT branch, SUM(quantity * unit_price) AS total_revenue
FROM sales
GROUP BY branch
HAVING SUM(quantity * unit_price) > 100000
ORDER BY total_revenue DESC;

-- 3.12 Percentage contribution (bonus):
-- what % of total company revenue does each category contribute
SELECT category,
       SUM(quantity * unit_price) AS category_revenue,
       ROUND(
         100.0 * SUM(quantity * unit_price) / SUM(SUM(quantity * unit_price)) OVER (),
       2) AS pct_of_total_revenue
FROM sales
GROUP BY category
ORDER BY pct_of_total_revenue DESC;

-- 3.13 ORDER BY using an alias (only valid because ORDER BY runs after SELECT)
SELECT branch, SUM(quantity) AS units_sold
FROM sales
GROUP BY branch
ORDER BY units_sold DESC;