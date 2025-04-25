-- Subqueries and HAVING Practice
-- Author: Darion Pride
-- Date: April 25, 2025

-- Challenge 1: Customers who ordered in at least 2 distinct months
SELECT customer_id
FROM (
    SELECT customer_id,
           COUNT(DISTINCT MONTH(order_date)) AS month_count
    FROM orders
    GROUP BY customer_id
) AS customer_months
WHERE month_count >= 2;

-- Challenge 2: Customers who spent more than $150 total
SELECT customer_id
FROM orders
GROUP BY customer_id
HAVING SUM(total_amount) > 150;

-- Challenge 3: Customers who ordered in at least 2 months AND spent over $150
SELECT customer_id
FROM (
    SELECT customer_id,
           COUNT(DISTINCT MONTH(order_date)) AS month_count,
           SUM(total_amount) AS total_spent
    FROM orders
    GROUP BY customer_id
) AS customer_summary
WHERE month_count >= 2
  AND total_spent > 150;