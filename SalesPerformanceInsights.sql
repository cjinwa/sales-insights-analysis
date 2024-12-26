--Total Revenue
SELECT SUM(Sales) AS TotalRevenue
FROM SalesData;

--Top Products by Quantity Sold
SELECT TOP 5 Product, SUM([Quantity_Ordered]) AS TotalQuantity
FROM SalesData
GROUP BY Product
ORDER BY TotalQuantity DESC;

 --Top Products by Revenue
SELECT TOP 5 Product, SUM(Sales) AS TotalRevenue
FROM SalesData
GROUP BY Product
ORDER BY TotalRevenue DESC;

--Average Sales per Order
SELECT AVG(Sales) AS AverageSalesPerOrder
FROM SalesData;

--Monthly Sales
SELECT Month, SUM(Sales) AS MonthlySales
FROM SalesData
GROUP BY Month
ORDER BY Month ASC;

-- Hourly Sales
SELECT Hour, SUM(Sales) AS HourlySales
FROM SalesData
GROUP BY Hour
ORDER BY Hour ASC;

--Top Cities by Revenue
SELECT TOP 5 City, SUM(Sales) AS TotalRevenue
FROM SalesData
GROUP BY City
ORDER BY TotalRevenue DESC;

--Most Frequently Bought Products
SELECT TOP 5 Product, COUNT(*) AS Frequency
FROM SalesData
GROUP BY Product
ORDER BY Frequency DESC;

--Product Revenue Contribution
WITH TotalRevenueCTE AS (
    SELECT SUM(Sales) AS TotalRevenue
    FROM SalesData
)
SELECT TOP 5 Product, 
       SUM(Sales) AS ProductRevenue,
       (SUM(Sales) * 100.0 / (SELECT TotalRevenue FROM TotalRevenueCTE)) AS RevenueContributionPercentage
FROM SalesData
GROUP BY Product
ORDER BY RevenueContributionPercentage DESC;

--Common Product Pairings
SELECT A.[Product] AS Product1, 
       B.[Product] AS Product2, 
       COUNT(*) AS PairFrequency
FROM SalesData A
INNER JOIN SalesData B ON A.[Order_ID] = B.[Order_ID] AND A.[Product] < B.[Product]
GROUP BY A.[Product], B.[Product]
ORDER BY PairFrequency DESC;

--Peak Sales Hour
SELECT TOP 1 Hour, SUM(Sales) AS PeakHourlySales
FROM SalesData
GROUP BY Hour
ORDER BY PeakHourlySales DESC;

--Best Month for Sales
SELECT TOP 1 Month, SUM(Sales) AS MonthlySales
FROM SalesData
GROUP BY Month
ORDER BY MonthlySales DESC;

