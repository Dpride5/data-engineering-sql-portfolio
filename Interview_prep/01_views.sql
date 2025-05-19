-- View Creation Practice / Interview Prep
-- Views give a reusable select layer—perfect for repeat logic like daily hours. They don’t store data, so they stay in sync automatically.

CREATE VIEW vw_daily_hours as
SELECT name,
Date,
hours_worked
FROM timesheet_parquet
WHERE department IN ('Product') -- This is optional and can be removed

-- This view will only store employee data from the product department