 -- Window Function Interview Prep
 -- GROUP BY collapses rows; windows let me keep detail and still calculate running totals or ranks—vital for time-series KPIs like cumulative labour hours.

 WITH NEW_CTE AS (
    SELECT employee_id,
        work_date,
        hours_worked,
        SUM(hours_worked) OVER (PARTITION BY employee_id ORDER BY work_date) as running_total,
        RANK() OVER (PARTITION BY employee_id ORDER BY SUM(hours_worked) OVER (
            PARTITION BY employee_id) DESC
        ) as employee_rank
    FROM timesheets
 )

 SELECT *
 FROM timesheets
 GROUP BY employee_id
 ORDER BY employee_rank DESC
 LIMIT 5

-- The goal is to partition and get the running total and then rank them based off that
-- total and output the top 5 customers by total money spent

 SELECT * 
 FROM NEW_CTE
 WHERE employee_rank <= 5
 ORDER BY employee_id, employee_rank;

 -- Querying the CTE