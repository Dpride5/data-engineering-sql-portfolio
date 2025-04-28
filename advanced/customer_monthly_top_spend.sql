/*
-----------------------------------------------
Title: Customer Monthly Top Spend Summary
Author: Darion Pride
Date Created: April 27, 2025
Description:
    - Joins customers, orders, and payments tables
    - Aggregates total spend per customer per month
    - Applies window function (ROW_NUMBER) to identify each customer's top spending month
    - Returns customer name, top month (YYYY-MM), and amount spent
SQL Concepts Practiced:
    - Multi-table JOINs
    - Aggregations
    - CTEs (Common Table Expressions)
    - Window functions (ROW_NUMBER, PARTITION BY)
    - Filtering ranked results
-----------------------------------------------
*/

WITH apple AS (
SELECT a.customer_name,
DATE_FORMAT(order_date, 'YYYY-MM') AS top_month,
SUM(payment_amount) as total_amount
FROM customers as a
INNER JOIN orders as b ON b.customer_id = a.customer_id
INNER JOIN payments as c ON c.order_id = b.order_id
GROUP BY a.customer_name, DATEFORMAT(order_date, 'YYYY-MM')
),
WITH apple_ranked AS (
SELECT customer_name,
top_month,
total_amount,
ROW_NUMBER () OVER (PARTITION BY customer_name ORDER BY total_amount DESC) AS row_number
FROM apple
)

SELECT customer_name,
top_month,
total_amount
from apple_ranked
WHERE row_number = 1
ORDER BY customer_name ASC