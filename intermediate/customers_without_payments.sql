-- Table | Columns
-- customers | customer_id, customer_name
-- orders | order_id, customer_id
-- payments | payment_id, order_id

SELECT DISTINCT a.customer_name
FROM customers as a
LEFT JOIN orders as b ON b.customer_id = a.customer_id
LEFT JOIN payments as c ON c.order_id = b.order_id
WHERE c.payment_id IS NULL
ORDER BY a.customer_name