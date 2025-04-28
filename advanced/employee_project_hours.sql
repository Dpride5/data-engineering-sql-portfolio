/*  -----------------------------------------------
    Title        : Employee Top-Project Hours
    Author       : Darion Pride
    Date Created : 2025-04-28
    Description  : Joins employees → timesheets → projects,
                   aggregates hours per employee-project,
                   ranks projects by total hours, returns
                   each employee’s top-hours project(s).
    SQL Concepts : Multi-JOIN, CTE chain, RANK window fn
    ----------------------------------------------------- */

-- Table         | Columns
-- employees     | employee_id, employee_name
-- projects      | project_id, project_name, start_date, end_date
-- timesheets    | timesheet_id, employee_id, project_id, work_date, hours_worked

WITH summary AS (
    SELECT a.employee_id,
    a.employee_name,
    project_id,
    c.project_name,
    SUM(b.hours_worked) as total_hours
FROM employees as a
INNER JOIN timesheets as b  ON b.employee_id = a.employee_id
INNER JOIN projects as c    ON c.project_id = b.project_id
GROUP BY a.employee_id,
a.employee_name, 
c.project_id,
 c.project_name
 ),
summary_ranked AS(
SELECT 
    employee_name,
    project_name,
    total_hours,
    RANK() OVER(
            PARTITION BY employee_id 
            ORDER BY total_hours DESC
        )AS rank
    FROM summary
)

SELECT 
    employee_name,
    project_name,
    total_hours
FROM summary_ranked
WHERE rank = 1      -- keeps all projects tied in hours for each employee
ORDER BY employee_name ASC

-- **Key Takeaways**
-- When chaining multiple CTEs you only need 1 WITH keyword
-- You want each employee's best project so partition by employee_id or employee_name (Not project_name (error fix))
-- Use RANK() instead of ROW_NUMBER() as ROW_NUMBER() only keeps one row. This keeps tied projects included in the output
-- Once you use a window function don't add Multiple GROUP BY statements here. Just use one (deleted the other)