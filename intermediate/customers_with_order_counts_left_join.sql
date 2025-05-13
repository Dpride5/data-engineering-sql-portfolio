/* -------------------------------------------------------------
   Title        : Customers With Order Counts (LEFT JOIN)
   Author       : Darion Pride
   Date Created : 2025-04-28
   Description  :
       Returns every customer—including those who have never
       placed an order—and shows their total order count.

       Demonstrates a LEFT JOIN edge case:
       - Preserves "missing" rows from the dimension table
       - Uses COUNT(order_id) to produce zero for non-ordering
         customers (COUNT returns 0 on NULL rows after LEFT JOIN)

   SQL Concepts Practiced :
       • LEFT JOIN (outer join)
       • Aggregation after join
   ------------------------------------------------------------- */

--Table     | Columns
--customers | customer_id (PK), customer_name
--orders    | order_id (PK), customer_id (FK), order_date

SELECT a.customer_id,
    a.customer_name,
    COALESCE(COUNT(b.order_id), 0) as total_orders 
FROM customers as a
LEFT JOIN orders as b ON a.customer_id = b.customer_id
GROUP BY a.customer_id, customer_name
ORDER BY a.customer_name ASC

-- Make sure when using IFNULL or COALESCE and a aggregating function you do not have the output value you want
-- inside the aggregation 
-- IFNULL is MySQL only. Basically a shortcut instead of using Coalesce and not necessary here
