SELECT * FROM amazon LIMIT 100;
-- Date range
SELECT 
    MIN(OrderDate) AS start_date,
    MAX(OrderDate) AS end_date
FROM amazon;

-- Null checks (example)
SELECT 
    COUNT(*) AS total_rows,
    SUM(CASE WHEN CustomerID IS NULL THEN 1 ELSE 0 END) AS null_customer_id
FROM amazon;

-- Country vs City mismatch check
SELECT Country, City, COUNT(*) 
FROM amazon
GROUP BY Country, City
ORDER BY COUNT(*) DESC;

SELECT DISTINCT City
FROM amazon
ORDER BY City;
