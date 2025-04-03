SELECT TOP (1000) [Row ID]
      ,[Order ID]
      ,[Order Date]
      ,[Ship Date]
      ,[Ship Mode]
      ,[Customer ID]
      ,[Customer Name]
      ,[Segment]
      ,[Country]
      ,[City]
      ,[State]
      ,[Postal Code]
      ,[Region]
      ,[Product ID]
      ,[Category]
      ,[Sub-Category]
      ,[Product Name]
      ,[Sales]
      ,[Quantity]
      ,[Discount]
      ,[Profit]
  FROM [Superstore].[dbo].[Orders$]

  Select * from Orders$

 --1a Top 10 regions by number of unique customers
  Select Top 10 Region, [Customer ID]
  From Orders$
  Order By Region DESC;

 --1b Analyze the distribution of customers across the regions and provide insights into the company's reach.  
   Select Region, Count([Customer ID]) as UniqueCustomers
   From Orders$
   Group by Region;
   
   


-- 2a Customers that has placed more than one order
   Select [Customer ID], Count(*) as
   Ordercount
   From Orders$
   Group By [Customer ID]
   Having Count(*) > 1;


 --2b  Identify the top 5 customers who have placed the most orders
   Select top 5 [Customer ID], Count(*)
   As OrderCount
   From Orders$
   Group By [Customer ID]
   Order by OrderCount Desc;
   
 -- 3a
Select Top 10 [Customer ID], SUM(Sales) AS TotalSales
From Orders$
Group by [Customer ID]
Order by TotalSales DESC;

-- 3b

--4a TASK (QUESTION 1)CUSTOMER PURCHASE FREQUENCY
WITH AVERAGE_SALES AS(
SELECT [Customer ID],[Customer Name], COUNT(Quantity)
AS CUSTOMER_SALES
FROM Orders$ 
GROUP BY [Customer ID],[Customer Name])
SELECT AVG(CUSTOMER_SALES) AS AVG_SALES FROM AVERAGE_SALES
GROUP BY [Customer Name],[Customer ID];

 --4b QUESTION (TRENDS AND PATTERN)

--AVERAGE ORDER BY CITY 
SELECT City,AVG(Quantity)
AS ORDERPERCITY
FROM Orders$
GROUP BY City;

--AVERAGE ORDER PER CUSTOMER 
SELECT [Customer ID],[Customer Name],AVG(Quantity)
AS ORDERPERCUSTOMER
FROM Orders$
GROUP BY [Customer Name],[Customer ID];

--AVERAGE ORDER BY SHIPMENT MODE
SELECT [Customer ID],[Ship Mode],AVG(Quantity)
AS ORDERPERSHIPMENTMODE
FROM Orders$
GROUP BY [Customer ID],[Ship Mode];

--AVERAGE ORDER BY SHIPMENT MODE
SELECT [Customer ID],Segment,AVG(Quantity)
AS ORDERPERSEGMENT
FROM Orders$
GROUP BY [Customer ID],Segment;

--AVERAGE ORDER BY SHIPMENT MODE
SELECT [Customer ID],Region,AVG(Quantity)
AS ORDERPERREGION
FROM Orders$
GROUP BY [Customer ID],Region;

--AVERAGE ORDER BY SHIPMENT MODE
SELECT Category,AVG(Quantity)
AS ORDERPERCATEGORY
FROM Orders$
GROUP BY Category;

--5a (MONTHLY PURCAHSE TREND)
SELECT
YEAR([Order Date]) AS YEAR,
SUM(Quantity) AS TOTAL_SALES
FROM Orders$
GROUP BY YEAR([Order Date])
ORDER BY YEAR;







