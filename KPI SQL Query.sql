-- KPI #1: Total Revenue
SELECT
    ROUND(SUM(TotalAmount), 2) AS total_revenue
FROM amazon_orders_cleaned
WHERE is_valid_location = 1;

-- KPI #2 — Total Orders
SELECT
    COUNT(DISTINCT OrderID) AS total_orders
FROM amazon_orders_cleaned
WHERE is_valid_location = 1;

-- KPI #3 — Average Order Value
SELECT
    ROUND(SUM(TotalAmount) / COUNT(DISTINCT OrderID), 2) AS avg_order_value
FROM amazon_orders_cleaned
WHERE is_valid_location = 1;

-- KPI #4 — Monthly Revenue Trend
SELECT
    DATE_FORMAT(OrderDate, '%Y-%m') AS month,
    ROUND(SUM(TotalAmount), 2) AS monthly_revenue
FROM amazon_orders_cleaned
WHERE is_valid_location = 1
GROUP BY DATE_FORMAT(OrderDate, '%Y-%m')
ORDER BY month;

-- KPI #5 — Year-over-Year Revenue
SELECT
    YEAR(OrderDate) AS year,
    ROUND(SUM(TotalAmount), 2) AS yearly_revenue
FROM amazon_orders_cleaned
WHERE is_valid_location = 1
GROUP BY YEAR(OrderDate)
ORDER BY year;
-- KPI #6 — Top 10 Products by Revenue

SELECT
    ProductName,
    ROUND(SUM(TotalAmount), 2) AS revenue
FROM amazon_orders_cleaned
WHERE is_valid_location = 1
GROUP BY ProductName
ORDER BY revenue DESC
LIMIT 10;
-- KPI #7 — Top 10 Products by Quantity
SELECT
    ProductName,
    SUM(Quantity) AS total_quantity
FROM amazon_orders_cleaned
WHERE is_valid_location = 1
GROUP BY ProductName
ORDER BY total_quantity DESC
LIMIT 10;
-- KPI #8 — Seller Performance
SELECT
    SellerID,
    ROUND(SUM(TotalAmount), 2) AS revenue,
    COUNT(DISTINCT OrderID) AS orders
FROM amazon_orders_cleaned
WHERE is_valid_location = 1
GROUP BY SellerID
ORDER BY revenue DESC
LIMIT 10;
-- KPI #9 — Repeat Customers
SELECT
    COUNT(*) AS repeat_customers
FROM (
    SELECT CustomerID
    FROM amazon_orders_cleaned
    WHERE is_valid_location = 1
    GROUP BY CustomerID
    HAVING COUNT(DISTINCT OrderID) > 1
) t;

-- KPI #10 — Top Customers by Revenue
SELECT
    CustomerID,
    ROUND(SUM(TotalAmount), 2) AS revenue
FROM amazon_orders_cleaned
WHERE is_valid_location = 1
GROUP BY CustomerID
ORDER BY revenue DESC
LIMIT 10;
-- KPI #11 — Payment Method Distribution
SELECT
    PaymentMethod,
    COUNT(DISTINCT OrderID) AS orders,
    ROUND(SUM(TotalAmount), 2) AS revenue
FROM amazon_orders_cleaned
WHERE is_valid_location = 1
GROUP BY PaymentMethod
ORDER BY revenue DESC;







