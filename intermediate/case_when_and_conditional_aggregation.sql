-- CASE WHEN and Conditional Aggregation Practice
-- Author: Darion Pride
-- Date: April 25, 2025

-- Challenge 1: Categorize orders by size
SELECT order_id,
       customer_id,
       total_amount,
       CASE 
           WHEN total_amount >= 100 THEN 'High'
           WHEN total_amount BETWEEN 50 AND 99.99 THEN 'Medium'
           ELSE 'Low'
       END AS order_tier
FROM orders;

-- Challenge 2: Count of orders per tier per customer
SELECT customer_id,
       SUM(CASE WHEN total_amount >= 100 THEN 1 ELSE 0 END) AS high_tier_orders,
       SUM(CASE WHEN total_amount BETWEEN 50 AND 99.99 THEN 1 ELSE 0 END) AS medium_tier_orders,
       SUM(CASE WHEN total_amount < 50 THEN 1 ELSE 0 END) AS low_tier_orders
FROM orders
GROUP BY customer_id;
