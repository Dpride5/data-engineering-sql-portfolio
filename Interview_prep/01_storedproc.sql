-- Creating Stored Procedures Interview Prep
-- Returns top 5 customers within the last 5 days
-- I wrap the top-customer query in a proc so ops can call CALL usp_top_customers(30, 10) without editing SQL—promotes reuse & parameter safety.
DELIMITER $$
CREATE PROCEDURE usp_top_customers (
    IN p_days INT,
    IN p_top INT
)
BEGIN
    SELECT c.customer_id,
        c.name,
        SUM(o.total_spent) AS total
    FROM orders o
    JOIN customers c USING (customer_id)
    WHERE o.order_date >= CURRENT_DATE - INTERVAL p_days DAY
    GROUP BY customer_id, c.name
    ORDER BY total_spent DESC
    LIMIT p_top;
END$$
DELIMITER

-- Calling the stored procedure
EXECUTE usp_top_customers(5, 5); -- Last 5 days, Top 5 customers