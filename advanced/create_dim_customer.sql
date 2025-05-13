/* ----------------------------------------------------------------
   Title        : Dimension Table DDL + Basic Index and EXPLAIN
   Author       : Darion Pride
   Date Created : 2025-04-29
   Description  :
       Demonstrates Data-Definition skills (CREATE TABLE), basic
       indexing, and use of EXPLAIN to inspect query plans.

       - Creates dim_customer with primary key
       - Adds single-column index on signup_date
       - Shows EXPLAIN plan for a range query that should leverage
         the new index instead of a full table scan.

   SQL Concepts :
       • DDL: CREATE TABLE / PRIMARY KEY
       • CREATE INDEX (B-tree)
       • Query-plan inspection with EXPLAIN
   ---------------------------------------------------------------- */


CREATE TABLE dim_customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    signup_date DATE
);

-- Adding an index on signup_date
CREATE INDEX idx_signup ON dim_customer(signup_date);

-- Simple EXPLAIN to show the index is used (shows up in the SQL log)
EXPLAIN
SELECT customer_id
FROM dim_customer
WHERE signup_date >= '2025-01-01';
