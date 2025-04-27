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


WITH apple AS (
SELECT a.customer_name,
DATE_FORMAT(order_date, 'YYYY-MM') AS top_month,
SUM(payment_amount) as total_amount
FROM customers as a
INNER JOIN orders as b ON b.customer_id = a.customer_id
INNER JOIN payments as c ON c.order_id = b.order_id
GROUP BY a.customer_name, DATEFORMAT(order_date, 'YYYY-MM')
),
WITH banana AS (
SELECT customer_name,
top_month,
total_amount,
ROW_NUMBER () OVER (
    PARTITION BY customer_name
    ORDER BY total_amount DESC
) AS row_number
FROM apple
)
SELECT customer_name,
top_month,
total_amount
from banana
WHERE row_number = 1
ORDER BY customer_name ASC