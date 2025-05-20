# SQL Learning Log  
_Repository: data-engineering-sql-portfolio_  

---

## 2025-04-25 ─ Day 1: Repo Foundation & Core Aggregations
| Folder | File | Concepts Practiced | Reflection |
|--------|------|-------------------|------------|
| fundamentals | `basic_aggregations_groupby.sql` | `COUNT`, `SUM`, `GROUP BY`, `HAVING` | First pass at pure-aggregation queries. Comfortable translating Excel-style “pivot” thinking into SQL syntax. |

**Takeaway:** grouping + simple filters feel automatic now.

---

## 2025-04-25 ─ Day 1 (cont.): Intermediate Layering
| Folder | File | Concepts Practiced | Reflection |
|--------|------|-------------------|------------|
| intermediate | `subqueries_and_having.sql` | Subqueries in `WHERE` / `FROM`, filtering aggregates | Learned why subquery aliases & `HAVING` order matter. |
| intermediate | `case_when_and_conditional_aggregation.sql` | `CASE WHEN`, conditional row counts & sums | Forced to think row-level vs aggregate context—big “click” moment. |
| intermediate | `cte_usage_examples.sql` | First CTE chain; percent-of-total logic | CTEs feel cleaner than nested subqueries; easier to read and debug. |

**Takeaway:** layering logic in readable chunks (CTEs) > cramming it all at once.

---

## 2025-04-26 ─ Day 2: First Advanced JOIN
| Folder | File | Concepts Practiced | Reflection |
|--------|------|-------------------|------------|
| advanced | `customer_order_summary_join.sql` | Basic `INNER JOIN`, post-join aggregation | Realized alias discipline matters; grouping must reference columns from the correct table. |

**Takeaway:** Joining first, aggregating second has become solid.

---

## 2025-04-27 ─ Day 3: Multi-JOIN + Window Function
| Folder | File | Concepts Practiced | Reflection |
|--------|------|-------------------|------------|
| advanced | `customer_monthly_top_spend.sql` | Two-CTE chain, multi-table join (`customers → orders → payments`), `ROW_NUMBER()` window function, partition and rank filtering | Biggest leap so far. Learning SQL execution order: window functions happen after `SELECT`, so filtering on rank requires an outer query/CTE.

**Takeaway:** Window functions are powerful once grouping logic is clear; CTE chaining keeps them readable.

---

## 2025-04-28 ─ Day 4: Multi-JOIN + RANK (Employees/Projects)

| Folder | File | Concepts Practiced | Reflection |
|--------|------|-------------------|------------|
| advanced | `employee_project_hours.sql` | Multi-table JOIN, CTE chain, `RANK()` window function, tie handling | Remember to partition on Primary Keys for best results; learned to use `RANK()` + outer filter to keep ties. |

_“Mastery is built through deliberate practice, not shortcuts.”_

## 2025-05-13
- Interview-sprint Day 1:
- Flash-drill: top-3 customers / running total / left-anti join
- Drafted 3 STAR stories; practiced aloud
- Window-function "cheat sheet" creation and when to use window functions

## 2025-05-15
- Re-wrote SQL drills correctly; added running-total DAX in Power BI
- Answered 8 behavioural prompts on paper; rehearsed 3x
- Final PBIX polish

## 2025-05-16
- Interview Day: morning flash recall (ROW_NUMBER, DAX Running Total)

## 2025-05-18
- Advanced SQL practice
- Create VIEW vw_daily_hours
- CREATE PROCEDURE usp_top_customers(days, topN) (parameterised)
- window-function CTE with SUM() OVER + RANK(); corrected syntax after review