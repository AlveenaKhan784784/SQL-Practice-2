USE company;

CREATE TABLE sales (
sale_id INT PRIMARY KEY,
product_name VARCHAR(50),
category VARCHAR(50),
quantity_sold INT,
unit_price DECIMAL(10,2),
sale_date DATE,
region VARCHAR(50)
);

INSERT INTO sales VALUES
(1, 'Laptop', 'Electronics', 5, 800.00, '2024-01-10', 'North'),
(2, 'Phone', 'Electronics', 10, 500.00, '2024-02-15', 'South'),
(3, 'TV', 'Electronics', 2, 1200.00, '2024-01-20', 'North'),
(4, 'Headphones', 'Accessories', 15, 100.00, '2024-03-05', 'West'),
(5, 'Charger', 'Accessories', 25, 20.00, '2024-02-28', 'South'),
(6, 'Tablet', 'Electronics', 8, 300.00, '2024-03-10', 'East'),
(7, 'Monitor', 'Electronics', 3, 400.00, '2024-01-18', 'West'),
(8, 'Speaker', 'Accessories', 7, 150.00, '2024-02-05', 'North'),
(9, 'Mouse', 'Accessories', 12, 30.00, '2024-02-22', 'East'),
(10, 'Keyboard', 'Accessories', 9, 50.00, '2024-03-12', 'South');

SELECT * FROM sales;

SELECT * FROM sales WHERE quantity_sold > 5;

SELECT DISTINCT category FROM sales;

SELECT SUM(quantity_sold*unit_price) AS total_revenue FROM sales;

SELECT AVG(quantity_sold) AS average_quantity FROM sales;

SELECT MAX(unit_price) AS max , MIN(unit_price) AS min FROM sales;

SELECT COUNT(*) AS total_sales FROM sales;

SELECT sale_id,product_name, unit_price 
FROM sales
WHERE unit_price>(SELECT AVG(unit_price) FROM sales);

WITH regional_revenue AS(
SELECT region, SUM(quantity_sold*unit_price) AS total_revenue
FROM sales
GROUP BY region)
SELECT * FROM regional_revenue WHERE total_revenue>5000;