-- Basic Aggregations and Group By Practice
-- Author: Darion Pride
-- Date: April 25, 2025


-- Challenge 1: Count number of orders per customer
SELECT customer_id,
       COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id;

-- Challenge 2: Sum total sales per product
SELECT product_id,
       SUM(quantity * unit_price) AS total_sales
FROM sales
GROUP BY product_id;

-- Challenge 3: Find customers who placed more than 5 orders
SELECT customer_id,
       COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 5;
