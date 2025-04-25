-- Customer Order Summary Join
-- Author: Darion Pride
-- Date: April 25, 2025

-- Challenge:
-- Return each customer's name, their total number of orders, 
-- and their total amount spent across all orders.

SELECT b.customer_name,
       COUNT(a.order_id) AS order_count,
       SUM(a.total_amount) AS total_spent
FROM orders AS a
INNER JOIN customers AS b ON a.customer_id = b.customer_id
GROUP BY b.customer_name
ORDER BY b.customer_name ASC;
