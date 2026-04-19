USE sales_project;
USE sales_project;

-- Query 1: Total Revenue by Region
SELECT Region, 
       ROUND(SUM(Sales), 2) AS Total_Revenue,
       ROUND(SUM(Profit), 2) AS Total_Profit
FROM `sample - superstore`
GROUP BY Region
ORDER BY Total_Revenue DESC;

-- Query 2: Monthly Sales Trend
SELECT 
    YEAR(`Order Date`) AS Year,
    MONTH(`Order Date`) AS Month,
    ROUND(SUM(Sales), 2) AS Monthly_Sales
FROM `sample - superstore`
GROUP BY YEAR(`Order Date`), MONTH(`Order Date`)
ORDER BY Year, Month;

-- Query 3: Top 10 Products by Revenue
SELECT `Product Name`,
       ROUND(SUM(Sales), 2) AS Total_Sales,
       ROUND(SUM(Profit), 2) AS Total_Profit
FROM `sample - superstore`
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 10;

-- Query 4: Loss-Making Products
SELECT `Product Name`,
       ROUND(SUM(Profit), 2) AS Total_Profit
FROM `sample - superstore`
GROUP BY `Product Name`
HAVING Total_Profit < 0
ORDER BY Total_Profit ASC;

-- Query 5: Customer Segment Performance
SELECT Segment,
       COUNT(DISTINCT `Order ID`) AS Total_Orders,
       ROUND(SUM(Sales), 2) AS Total_Sales,
       ROUND(AVG(Discount), 2) AS Avg_Discount,
       ROUND(SUM(Profit), 2) AS Total_Profit
FROM `sample - superstore`
GROUP BY Segment
ORDER BY Total_Sales DESC;

-- Query 6: High Discount Orders Hurting Profit
SELECT `Order ID`, `Product Name`, Discount, Sales, Profit
FROM `sample - superstore`
WHERE Discount >= 0.4 AND Profit < 0
ORDER BY Profit ASC;