-- CTE Usage Examples
-- Author: Darion Pride
-- Date: April 25, 2025

-- Challenge 1: Use a CTE to calculate percentage of high-tier orders
WITH customer_order_stats AS (
    SELECT customer_id,
           COUNT(order_id) AS total_orders,
           SUM(CASE WHEN total_amount >= 100 THEN 1 ELSE 0 END) AS high_tier_orders
    FROM orders
    GROUP BY customer_id
)

SELECT customer_id,
       high_tier_orders,
       total_orders,
       high_tier_orders * 1.0 / total_orders AS high_tier_ratio
FROM customer_order_stats
WHERE high_tier_orders * 1.0 / total_orders > 0.5;
