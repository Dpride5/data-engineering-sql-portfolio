/* ------------------------------------------------------------
   Title        : Employee Cumulative Hours (Running Total)
   Author       : Darion Pride
   Date Created : 2025-04-29
   Description  : Computes day-by-day running total hours per
                  employee using SUM() OVER window function.
   SQL Concepts : Window functions, running totals
   ------------------------------------------------------------ */

-- Table | Columns
-- timesheets | employee_id, work_date, hours_worked

SELECT employee_id,
    work_date,
    hours_worked,
    SUM(hours_worked)
    OVER (PARTITION BY employee_id ORDER BY work_date ASC) as cumulative_hours
FROM timesheets
ORDER BY employee_id, work_date

-- **Key Takeaways**
-- Do not add GROUP BY after a window function as the window function needs to operate on the raw unagregated data