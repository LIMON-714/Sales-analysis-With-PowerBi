

CREATE DATABASE sales_analysis;

use sales_analysis;

SELECT * FROM SalesPiza;

--total
SELECT SUM(total_price) AS RUVENUE from SalesPiza;

SELECT SUM(quantity) as total_pices from SalesPiza;

--Average Order
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value 
FROM SalesPiza
GO;

--Total Sold
SELECT SUM(quantity) AS Total_pizza_sold
FROM SalesPiza
GO;

-- Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders 
FROM SalesPiza
GO;

-- AVG Per Order
SELECT * FROM SalesPiza;

SELECT SUM(quantity) / COUNT(DISTINCT order_id) AS [order] 
from SalesPiza
GO;

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM SalesPiza
GO;

--daily total order 
SELECT * FROM SalesPiza;

SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM SalesPiza
GROUP BY DATENAME(DW, order_date);

--monthly order 
select DATENAME(MONTH, order_date) as Month_Name, COUNT(DISTINCT order_id) as Total_Orders
from SalesPiza
GROUP BY DATENAME(MONTH, order_date)
--highest
ORDER BY Total_Orders DESC;


-- Percentage Pizza Category Sales
SELECT * FROM SalesPiza;

SELECT pizza_category,SUM(total_price) * 100 / (SELECT SUM(total_price) from SalesPiza) AS Total_Sales
FROM SalesPiza
GROUP BY pizza_category;

SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from SalesPiza) AS DECIMAL(10,2)) AS [Percentage]
FROM SalesPiza
GROUP BY pizza_category;

-- Percentage By Size 
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from SalesPiza) AS DECIMAL(10,2)) AS PCT
FROM SalesPiza
GROUP BY pizza_size
ORDER BY pizza_size; 

--Monthly Sold by Pizza Category
SELECT * FROM SalesPiza;

SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM SalesPiza
WHERE MONTH(order_date) = 7
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC


--Top 5 Revenue
SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM SalesPiza
GROUP BY pizza_name
ORDER BY Total_Revenue DESC;

-- Bottom 5 
SELECT * FROM SalesPiza;

SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM SalesPiza
GROUP BY pizza_name
ORDER BY Total_Revenue ASC;

-- Top 5 Quantity
SELECT Top 5 pizza_name, SUM(quantity) AS Total_sold
FROM SalesPiza
GROUP BY pizza_name
ORDER BY Total_sold DESC;

-- Bottom 5 Quantity
SELECT Top 5 pizza_name, SUM(quantity) AS Total_sold
FROM SalesPiza
GROUP BY pizza_name
ORDER BY Total_sold ASC;

-- 5 Top Order
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM SalesPiza
GROUP BY pizza_name
ORDER BY Total_Orders DESC;

--Bottom 5 Order 
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM SalesPiza
GROUP BY pizza_name
ORDER BY Total_Orders ASC;

SELECT * FROM SalesPiza;

-- By category
SELECT pizza_category FROM SalesPiza;

SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM SalesPiza
WHERE pizza_category = 'Veggie'
GROUP BY pizza_name
ORDER BY Total_Orders DESC;


