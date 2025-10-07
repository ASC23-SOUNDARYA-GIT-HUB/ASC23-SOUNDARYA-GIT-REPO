-- Active: 1753159798022@@127.0.0.1@1433@AdventureWorksLT2022
-- =====================================================
-- 100 Practical AdventureWorksLT2022 SQL Questions
-- =====================================================
--======================================================
-- BASIC SELECT QUERIES (1-10)
--======================================================

-- 1. List all customers in the database.
-- Problem: Retrieve every customer record from the SalesLT.Customer table. 
-- This should include all columns and all rows, giving you a complete view of every customer in the system.
-- Hint: Use SELECT * to get all columns.
-- SalesLT is the schema name and Customer is the table name.
-- Schemas are optional, if not specified, the default schema (usually dbo) is used.
-- They help organize database objects into logical groups.
SELECT * FROM SalesLT.Customer;

-- 2. Display all products offered by the company.
-- Problem: Show a complete list of products available in the SalesLT.Product table. 
-- Include every detail for each product, such as name, price, and product number.
-- Hint: SELECT * will return all product details.
SELECT * FROM SalesLT.Product;

-- 3. Show the first name, last name, and email address of every customer.
-- Problem: Extract only the FirstName, LastName, and EmailAddress columns from the customer table. 
-- This is useful for creating a contact list or sending emails to customers.
-- Hint: Specify the columns you want in the SELECT clause.
SELECT FirstName, LastName, EmailAddress 
FROM SalesLT.Customer;

-- 4. List the name and price of each product.
-- Problem: For each product, display its name and the price at which it is listed (ListPrice). 
-- This helps in understanding the product catalog and pricing.
-- Hint: Only select the Name and ListPrice columns.
SELECT Name, ListPrice 
FROM SalesLT.Product;

-- 5. Count the total number of customers.
-- Problem: Find out how many customers are currently in the database. 
-- This is a simple count of all rows in the SalesLT.Customer table.
-- Hint: Use COUNT(*) to count all rows.
SELECT COUNT(*) AS TotalCustomers 
FROM SalesLT.Customer;

-- 6. Count the total number of products in the catalog.
-- Problem: Determine how many products are available for sale by counting all entries in the Product table.
-- Hint: Use COUNT(*) on the Product table.
SELECT COUNT(*) AS TotalProducts
FROM SalesLT.Product

-- 7. List all unique product colors that are not null.
-- Problem: Identify all distinct colors that products come in, ignoring any products where the color is not specified (NULL).
-- Hint: Use DISTINCT and filter out NULLs with WHERE.
SELECT DISTINCT Color
FROM SalesLT.Product
WHERE Color IS NOT NULL;

-- 8. Show the 10 most expensive products.
-- Problem: Find the top 10 products with the highest ListPrice. 
-- Display their names and prices, sorted from most to least expensive.
-- Hint: Use TOP 10 and ORDER BY ListPrice DESC.
SELECT TOP 10 Name, ListPrice
FROM SalesLT.Product
ORDER BY ListPrice DESC;


-- 9. Retrieve all sales orders placed so far.
-- Problem: Display every sales order in the system, including all details for each order.
-- Hint: SELECT * from SalesOrderHeader.
SELECT *
FROM SalesLT.SalesOrderHeader;


-- 10. List products that are currently in stock (not discontinued).
-- Problem: Show all products that are still available for sale, i.e., those that do not have a SellEndDate (SellEndDate IS NULL).
-- Include their name, product number, and standard cost.
-- Hint: Filter with WHERE SellEndDate IS NULL.
SELECT Name, ProductNumber, StandardCost
FROM SalesLT.Product
WHERE SellEndDate IS NULL;



-- FILTERING WITH WHERE CLAUSE (11-20)
-- ============================================

-- 11. Find products with a price greater than $1000.
-- Problem: List all products where the ListPrice is more than 1000. 
-- Show their names and prices to identify high-value items.
-- Hint: Use WHERE ListPrice > 1000.
SELECT Name, ListPrice 
FROM SalesLT.Product 
WHERE ListPrice > 1000;

-- 12. List customers who are based in Seattle.
-- Problem: Identify all customers whose address is in the city of Seattle. 
-- You will need to join the Customer, CustomerAddress, and Address tables to get the city information.
-- Hint: Use JOINs to connect customer to address, and filter WHERE City = 'Seattle'.
SELECT FirstName, LastName, CompanyName 
FROM SalesLT.Customer c
JOIN SalesLT.CustomerAddress ca ON c.CustomerID = ca.CustomerID
JOIN SalesLT.Address a ON ca.AddressID = a.AddressID
WHERE a.City = 'Seattle';

-- 13. Show all products available in red color.
-- Problem: Find products where the Color is 'Red'. 
-- Display their name, color, and price.
-- Hint: Use WHERE Color = 'Red'.
SELECT Name, Color, ListPrice 
FROM SalesLT.Product 
WHERE Color = 'Red';

-- 14. List orders placed in the year 2008.
-- Problem: Retrieve all sales orders where the order date falls in 2008. 
-- Show the order ID, date, and total due.
-- Hint: Use YEAR(OrderDate) = 2008 in WHERE.
SELECT SalesOrderID, OrderDate, TotalDue 
FROM SalesLT.SalesOrderHeader 
WHERE YEAR(OrderDate) = 2008;

-- 15. Find products priced between $100 and $500.
-- Problem: List all products whose ListPrice is between 100 and 500, inclusive. 
-- This helps in identifying mid-range products.
-- Hint: Use WHERE ListPrice BETWEEN 100 AND 500.
SELECT Name, ListPrice 
FROM SalesLT.Product 
WHERE ListPrice BETWEEN 100 AND 500;

-- 16. List customers with an adventure-works.com email address.
-- Problem: Find all customers whose email address ends with 'adventure-works.com'. 
-- This is useful for identifying company employees or partners.
-- Hint: Use LIKE '%adventure-works.com' in WHERE.
SELECT *
FROM SalesLT.Customer
WHERE EmailAddress LIKE '%adventure-works.com';


-- 17. Show products whose names start with "Mountain".
-- Problem: List all products where the name begins with the word "Mountain". 
-- Useful for finding a specific product line.
-- Hint: Use WHERE Name LIKE 'Mountain%'.
SELECT *
FROM SalesLT.Product
WHERE Name LIKE 'Mountain%';


-- 18. List products without a specified color.
-- Problem: Find all products where the Color field is NULL, indicating no color has been set.
-- Hint: Use WHERE Color IS NULL.

SELECT *
FROM SalesLT.Product
WHERE Color IS NULL;

-- 19. Find customers who have provided their phone numbers.
-- Problem: List all customers who have a non-null value in the Phone column.
-- Hint: Use WHERE Phone IS NOT NULL.
SELECT *
FROM SalesLT.Customer
WHERE Phone IS NOT NULL;


-- 20. List products in the 'Helmets' or 'Gloves' categories.
-- Problem: Show all products that belong to either the 'Helmets' or 'Gloves' categories. 
-- Join Product and ProductCategory tables to get the category name.
-- Hint: Use JOIN and WHERE pc.Name IN ('Helmets', 'Gloves').
SELECT p.*
FROM SalesLT.Product p
JOIN SalesLT.ProductCategory pc ON p.ProductCategoryID = pc.ProductCategoryID
WHERE pc.Name IN ('Helmets', 'Gloves');





-- AGGREGATE FUNCTIONS (21-30)
-- ============================================

-- 21. Calculate the average price of all products.
-- Problem: Find the mean ListPrice for all products in the catalog. This helps understand overall pricing.
-- Hint: Use AVG(ListPrice).
SELECT AVG(ListPrice) AS AveragePrice 
FROM SalesLT.Product;

select avg(ListPrice) as AveragePrice from SalesLT.Product;

select count_big(*) as TotalProducts from SalesLT.Product;

select count(*) as TotalProduct from SalesLT.Product;

select count(*) from SalesLT.Product;

select count(color) from SalesLT.Product;

select count(*) from SalesLT."Product" where color is not null;

select count(*) from SalesLT."Product" where Color is null;

select count(DISTINCT COLOR)from salesLT."Product" where color is not null;

select APPROX_COUNT_DISTINCT( COLOR) FROM SalesLT."Product" where Color is not null;

select color from SalesLT."Product" ORDER BY COLOR;


-- 22. Compute the total sales revenue so far.
-- Problem: Add up the TotalDue for all sales orders to see the company's total revenue to date.
-- Hint: Use SUM(TotalDue).
SELECT SUM(TotalDue) AS TotalSales 
FROM SalesLT.SalesOrderHeader;

-- 23. Find the highest product price in the catalog.
-- Problem: Identify the maximum ListPrice among all products.
-- Hint: Use MAX(ListPrice).
SELECT MAX(ListPrice) AS MaxPrice 
FROM SalesLT.Product;

-- 24. Find the lowest non-zero product price.
-- Problem: Get the minimum ListPrice, but ignore products with a price of zero.
-- Hint: Use WHERE ListPrice > 0 with MIN(ListPrice).
SELECT MIN(ListPrice) AS MinPrice 
FROM SalesLT.Product 
WHERE ListPrice > 0;

-- 25. Count how many products exist for each color.
-- Problem: For each color, count the number of products available. Ignore products with NULL color.
-- Hint: GROUP BY Color, filter out NULLs.
SELECT Color, COUNT(*) AS ProductCount 
FROM SalesLT.Product 
WHERE Color IS NOT NULL 
GROUP BY Color;

-- 26. Calculate the average order total for each year.
-- Problem: For every year, compute the average TotalDue for orders placed in that year.
-- Hint: GROUP BY YEAR(OrderDate), use AVG(TotalDue).
SELECT YEAR(OrderDate) AS OrderYear, AVG(TotalDue) AS AverageOrderTotal
FROM SalesLT.SalesOrderHeader
GROUP BY YEAR(OrderDate);


-- 27. Count how many units have been sold for each product.
-- Problem: For each product, sum the OrderQty from all sales order details to get total units sold.
-- Hint: JOIN Product and SalesOrderDetail, GROUP BY product name.
SELECT p.Name, SUM(sod.OrderQty) AS TotalUnitsSold
FROM SalesLT.Product p
JOIN SalesLT.SalesOrderDetail sod ON p.ProductID = sod.ProductID
GROUP BY p.Name;


-- 28. Count how many orders each customer has placed.
-- Problem: For each customer, count the number of sales orders they've made.
-- Hint: GROUP BY CustomerID .
SELECT CustomerID, COUNT(*) AS OrdersPlaced
FROM SalesLT.SalesOrderHeader
GROUP BY CustomerID;


-- 29. Calculate the average product price in each category.
-- Problem: For every product category, compute the average ListPrice of products in that category.
-- Hint: JOIN Product and ProductCategory, GROUP BY category name.
SELECT pc.Name AS CategoryName, AVG(p.ListPrice) AS AveragePrice
FROM SalesLT.Product p
JOIN SalesLT.ProductCategory pc ON p.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.Name;

-- 30. Show total sales for each month.
-- Problem: For every year and month, sum the TotalDue for all orders placed in that period.
-- Hint: GROUP BY YEAR(OrderDate), MONTH(OrderDate).
SELECT YEAR(OrderDate) AS OrderYear, MONTH(OrderDate) AS OrderMonth, SUM(TotalDue) AS MonthlySales
FROM SalesLT.SalesOrderHeader
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY OrderYear, OrderMonth;



-- JOINS (31-40)
-- ============================================

-- 31. Show the category for each product.
-- Problem: For every product, display its name and the name of its category.
-- Hint: Use INNER JOIN between Product and ProductCategory.
SELECT p.Name AS ProductName, pc.Name AS CategoryName 
FROM SalesLT.Product p
INNER JOIN SalesLT.ProductCategory pc ON p.ProductCategoryID = pc.ProductCategoryID;

-- 32. Show sales order details along with customer info.
-- Problem: For each sales order, display the order ID, customer first and last name, order date, and total due.
-- Hint: INNER JOIN SalesOrderHeader and Customer.
SELECT soh.SalesOrderID, c.FirstName, c.LastName, soh.OrderDate, soh.TotalDue 
FROM SalesLT.SalesOrderHeader soh
INNER JOIN SalesLT.Customer c ON soh.CustomerID = c.CustomerID;

-- 33. List products included in each order.
-- Problem: For every sales order, show the products included, their quantities, unit prices, and line totals.
-- Hint: INNER JOIN SalesOrderDetail and Product.
SELECT sod.SalesOrderID, p.Name, sod.OrderQty, sod.UnitPrice, sod.LineTotal 
FROM SalesLT.SalesOrderDetail sod
INNER JOIN SalesLT.Product p ON sod.ProductID = p.ProductID;

-- 34. Show addresses for each customer.
-- Problem: For every customer, list their address details including street, city, state, and postal code.
-- Hint: INNER JOIN Customer, CustomerAddress, and Address.
SELECT c.FirstName, c.LastName, a.AddressLine1, a.City, a.StateProvince, a.PostalCode 
FROM SalesLT.Customer c
INNER JOIN SalesLT.CustomerAddress ca ON c.CustomerID = ca.CustomerID
INNER JOIN SalesLT.Address a ON ca.AddressID = a.AddressID;

-- 35. Show the parent category for each product.
-- Problem: For every product, display its category and the parent category (if any).
-- Hint: INNER JOIN Product and ProductCategory, LEFT JOIN for parent.
SELECT p.Name AS ProductName, pc.Name AS Category, pcp.Name AS ParentCategory 
FROM SalesLT.Product p
INNER JOIN SalesLT.ProductCategory pc ON p.ProductCategoryID = pc.ProductCategoryID
LEFT JOIN SalesLT.ProductCategory pcp ON pc.ParentProductCategoryID = pcp.ProductCategoryID;

-- 36. Show complete order details including customer and product info.
-- Problem: For each order, display the order ID, customer name, product name, quantity, unit price, and line total.
-- Hint: Multiple INNER JOINs between SalesOrderHeader, Customer, SalesOrderDetail, and Product.

SELECT soh.SalesOrderID, c.FirstName, c.LastName, p.Name AS ProductName,
       sod.OrderQty, sod.UnitPrice, sod.LineTotal
FROM SalesLT.SalesOrderHeader soh
INNER JOIN SalesLT.Customer c ON soh.CustomerID = c.CustomerID
INNER JOIN SalesLT.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
INNER JOIN SalesLT.Product p ON sod.ProductID = p.ProductID;

-- 37. List products that have never been ordered.
-- Problem: Find all products that do not appear in any sales order detail.
-- Hint: LEFT JOIN Product and SalesOrderDetail, filter for NULLs.

SELECT p.*
FROM SalesLT.Product p
LEFT JOIN SalesLT.SalesOrderDetail sod ON p.ProductID = sod.ProductID
WHERE sod.ProductID IS NULL;
-- 38. Show total spending for each customer.
-- Problem: For every customer, sum up the TotalDue for all their orders.
-- Hint: INNER JOIN Customer and SalesOrderHeader, GROUP BY customer.
SELECT c.CustomerID, c.FirstName, c.LastName, SUM(soh.TotalDue) AS TotalSpending
FROM SalesLT.Customer c
INNER JOIN SalesLT.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName;


-- 39. Show descriptions for each product model.
-- Problem: For every product model, display its name and the English description.
-- Hint: INNER JOIN ProductModel, ProductModelProductDescription, and ProductDescription, filter for Culture = 'en'.

SELECT pm.Name AS ProductModelName, pd.Description
FROM SalesLT.ProductModel pm
INNER JOIN SalesLT.ProductModelProductDescription pmpd ON pm.ProductModelID = pmpd.ProductModelID
INNER JOIN SalesLT.ProductDescription pd ON pmpd.ProductDescriptionID = pd.ProductDescriptionID
WHERE pmpd.Culture = 'en';
-- 40. Show shipping addresses for each sales order.
-- Problem: For every sales order, display the shipping address details.
-- Hint: INNER JOIN SalesOrderHeader and Address using ShipToAddressID.
SELECT soh.SalesOrderID, a.AddressLine1, a.AddressLine2, a.City, a.StateProvince, a.PostalCode, a.CountryRegion
FROM SalesLT.SalesOrderHeader soh
INNER JOIN SalesLT.Address a ON soh.ShipToAddressID = a.AddressID;



-- GROUP BY & HAVING (41-50)
-- ============================================

-- 41. List categories with more than 10 products.
-- Problem: For each product category, count the number of products and show only those with more than 10.
-- Hint: GROUP BY category, HAVING COUNT(*) > 10.
SELECT pc.Name AS Category, COUNT(*) AS ProductCount 
FROM SalesLT.Product p
INNER JOIN SalesLT.ProductCategory pc ON p.ProductCategoryID = pc.ProductCategoryID 
GROUP BY pc.Name 
HAVING COUNT(*) > 10;

-- 42. List customers who have spent more than $10,000.
-- Problem: For each customer, sum their total purchases and show only those who spent over $10,000.
-- Hint: GROUP BY customer, HAVING SUM(TotalDue) > 10000.
SELECT c.CustomerID, c.FirstName, c.LastName, SUM(soh.TotalDue) AS TotalPurchases 
FROM SalesLT.Customer c
INNER JOIN SalesLT.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID 
GROUP BY c.CustomerID, c.FirstName, c.LastName 
HAVING SUM(soh.TotalDue) > 10000;

-- 43. List products sold more than 100 times.
-- Problem: For each product, sum the quantity sold and show only those with more than 100 units sold.
-- Hint: GROUP BY product, HAVING SUM(OrderQty) > 100.
SELECT p.ProductID, p.Name, SUM(sod.OrderQty) AS TotalSold 
FROM SalesLT.Product p
INNER JOIN SalesLT.SalesOrderDetail sod ON p.ProductID = sod.ProductID 
GROUP BY p.ProductID, p.Name 
HAVING SUM(sod.OrderQty) > 100;

-- 44. List colors with an average product price over $500.
-- Problem: For each color, calculate the average ListPrice and show only those with an average above $500.
-- Hint: GROUP BY Color, HAVING AVG(ListPrice) > 500, filter out NULLs.
SELECT Color, AVG(ListPrice) AS AvgPrice, COUNT(*) AS ProductCount 
FROM SalesLT.Product 
WHERE Color IS NOT NULL 
GROUP BY Color 
HAVING AVG(ListPrice) > 500;

-- 45. List years where sales exceeded $1 million.
-- Problem: For each year, sum the TotalDue and show only years with sales over $1,000,000.
-- Hint: GROUP BY YEAR(OrderDate), HAVING SUM(TotalDue) > 1000000.
SELECT YEAR(OrderDate) AS Year, SUM(TotalDue) AS TotalSales 
FROM SalesLT.SalesOrderHeader 
GROUP BY YEAR(OrderDate) 
HAVING SUM(TotalDue) > 1000000;

-- 46. List customers who placed more than 3 orders.
-- Problem: For each customer, count their orders and show only those with more than 3.
-- Hint: GROUP BY CustomerID, HAVING COUNT(*) > 3.
SELECT CustomerID, COUNT(*) AS OrderCount
FROM SalesLT.SalesOrderHeader
GROUP BY CustomerID
HAVING COUNT(*) > 3;


-- 47. List products with an average order quantity greater than 5.
-- Problem: For each product, calculate the average quantity per order and show only those with an average above 5.
-- Hint: GROUP BY product, HAVING AVG(OrderQty) > 5.

SELECT p.Name AS ProductName, AVG(sod.OrderQty) AS AvgOrderQty
FROM SalesLT.Product p
JOIN SalesLT.SalesOrderDetail sod ON p.ProductID = sod.ProductID
GROUP BY p.Name
HAVING AVG(sod.OrderQty) > 5;

-- 48. List cities with more than 5 customers.
-- Problem: For each city, count the number of unique customers and show only those with more than 5.
-- Hint: GROUP BY city, HAVING COUNT(DISTINCT CustomerID) > 5.
SELECT a.City, COUNT(DISTINCT ca.CustomerID) AS CustomerCount
FROM SalesLT.CustomerAddress ca
JOIN SalesLT.Address a ON ca.AddressID = a.AddressID
GROUP BY a.City
HAVING COUNT(DISTINCT ca.CustomerID) > 5;

-- 49. List product categories with over $50,000 in sales.
-- Problem: For each product category, sum the sales (LineTotal) and show only those with totals above $50,000.
-- Hint: GROUP BY category, HAVING SUM(LineTotal) > 50000.

SELECT pc.Name AS CategoryName, SUM(sod.LineTotal) AS TotalSales
FROM SalesLT.Product p
JOIN SalesLT.ProductCategory pc ON p.ProductCategoryID = pc.ProductCategoryID
JOIN SalesLT.SalesOrderDetail sod ON p.ProductID = sod.ProductID
GROUP BY pc.Name
HAVING SUM(sod.LineTotal) > 50000;

-- 50. List months with more than 50 orders placed.
-- Problem: For each year and month, count the number of orders and show only those with more than 50.
-- Hint: GROUP BY year and month, HAVING COUNT(*) > 50.

SELECT YEAR(OrderDate) AS OrderYear, MONTH(OrderDate) AS OrderMonth, COUNT(*) AS OrderCount
FROM SalesLT.SalesOrderHeader
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
HAVING COUNT(*) > 50
ORDER BY OrderYear, OrderMonth;

-- SUBQUERIES (51-60)
-- ============================================

-- 51. Which products are priced above the average?
-- Problem: List all products whose ListPrice is greater than the average ListPrice of all products.
-- Hint: Use a subquery to get the average price and compare.
SELECT Name, ListPrice 
FROM SalesLT.Product 
WHERE ListPrice > (SELECT AVG(ListPrice) FROM SalesLT.Product);

-- 52. Which customers placed orders in 2008?
-- Problem: Find all customers who have placed at least one order in the year 2008.
-- Hint: Use a subquery with SalesOrderHeader and filter by YEAR(OrderDate) = 2008.
SELECT CustomerID, FirstName, LastName 
FROM SalesLT.Customer 
WHERE CustomerID IN (
    SELECT CustomerID 
    FROM SalesLT.SalesOrderHeader 
    WHERE YEAR(OrderDate) = 2008
);

-- 53. What is the most expensive product in each category?
-- Problem: For each product category, show the product(s) with the highest ListPrice.
-- Hint: Use a correlated subquery to get the MAX(ListPrice) per category.
SELECT p.Name, p.ListPrice, pc.Name AS Category 
FROM SalesLT.Product p
INNER JOIN SalesLT.ProductCategory pc ON p.ProductCategoryID = pc.ProductCategoryID 
WHERE p.ListPrice = (
    SELECT MAX(p2.ListPrice) 
    FROM SalesLT.Product p2 
    WHERE p2.ProductCategoryID = p.ProductCategoryID
);

-- 54. Which customers have spent more than the average customer?
-- Problem: List customers whose total purchases exceed the average total purchases of all customers.
-- Hint: Use HAVING with a subquery that calculates the average total per customer.
SELECT c.CustomerID, c.FirstName, c.LastName, SUM(soh.TotalDue) AS TotalPurchases 
FROM SalesLT.Customer c
INNER JOIN SalesLT.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID 
GROUP BY c.CustomerID, c.FirstName, c.LastName 
HAVING SUM(soh.TotalDue) > (
    SELECT AVG(CustomerTotal) 
    FROM (
        SELECT SUM(TotalDue) AS CustomerTotal 
        FROM SalesLT.SalesOrderHeader 
        GROUP BY CustomerID
    ) AS Totals
);

-- 55. Which products have never been ordered?
-- Problem: Find all products that do not appear in any sales order detail.
-- Hint: Use NOT IN with a subquery on SalesOrderDetail.
SELECT ProductID, Name 
FROM SalesLT.Product 
WHERE ProductID NOT IN (
    SELECT DISTINCT ProductID 
    FROM SalesLT.SalesOrderDetail
);

-- 56. Which orders are larger than the average order value?
-- Problem: List all sales orders where TotalDue is greater than the average TotalDue of all orders.
-- Hint: Use a subquery to get the average TotalDue.
SELECT *
FROM SalesLT.SalesOrderHeader
WHERE TotalDue > (
    SELECT AVG(TotalDue)
    FROM SalesLT.SalesOrderHeader
);
-- 57. Who are our top 5 customers by total purchases?
-- Problem: Show the top 5 customers who have spent the most in total purchases.
-- Hint: Use TOP 5 and ORDER BY total purchases (use a subquery for SUM).

SELECT TOP 5 c.CustomerID, c.FirstName, c.LastName, SUM(soh.TotalDue) AS TotalPurchases
FROM SalesLT.Customer c
JOIN SalesLT.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY TotalPurchases DESC;


-- 58. Which products are in the most expensive category?
-- Problem: List all products that belong to the category with the highest average ListPrice.
-- Hint: Use a subquery to find the ProductCategoryID with the highest average ListPrice.

SELECT *
FROM SalesLT.Product
WHERE ProductCategoryID = (
    SELECT TOP 1 ProductCategoryID
    FROM SalesLT.Product
    GROUP BY ProductCategoryID
    ORDER BY AVG(ListPrice) DESC
);

-- 59. Which customers live in the top 3 cities by customer count?
-- Problem: Find customers who live in the three cities with the most customers.
-- Hint: Use a subquery to get the top 3 cities by customer count, then filter customers by those cities.

SELECT c.*
FROM SalesLT.Customer c
JOIN SalesLT.CustomerAddress ca ON c.CustomerID = ca.CustomerID
JOIN SalesLT.Address a ON ca.AddressID = a.AddressID
WHERE a.City IN (
    SELECT TOP 3 a.City
    FROM SalesLT.CustomerAddress ca
    JOIN SalesLT.Address a ON ca.AddressID = a.AddressID
    GROUP BY a.City
    ORDER BY COUNT(DISTINCT ca.CustomerID) DESC
);


-- 60. Which products are priced higher than their category's average?
-- Problem: List products whose ListPrice is greater than the average ListPrice for their category.
-- Hint: Use a correlated subquery to get the average price per category.
SELECT p.*
FROM SalesLT.Product p
WHERE ListPrice > (
    SELECT AVG(ListPrice)
    FROM SalesLT.Product
    WHERE ProductCategoryID = p.ProductCategoryID
);


-- DATE & TIME FUNCTIONS (61-70)
-- ============================================

-- 61. On which days of the week do we get the most orders?
-- Problem: For each day of the week, count the number of orders placed.
-- Hint: Use DATENAME(WEEKDAY, OrderDate) and GROUP BY.
SELECT DATENAME(WEEKDAY, OrderDate) AS DayOfWeek, COUNT(*) AS OrderCount 
FROM SalesLT.SalesOrderHeader 
GROUP BY DATENAME(WEEKDAY, OrderDate) 
ORDER BY OrderCount DESC;

-- 62. What orders were placed in the last 30 days?
-- Problem: List all sales orders placed in the last 30 days from the most recent order date.
-- Hint: Use DATEADD and MAX(OrderDate) in WHERE.
SELECT SalesOrderID, OrderDate, TotalDue 
FROM SalesLT.SalesOrderHeader 
WHERE OrderDate >= DATEADD(DAY, -30, (SELECT MAX(OrderDate) FROM SalesLT.SalesOrderHeader));

-- 63. How old are our products (in days since they were first sold)?
-- Problem: For each product, show how many days have passed since SellStartDate.
-- Hint: Use DATEDIFF(DAY, SellStartDate, GETDATE()).
SELECT Name, SellStartDate, DATEDIFF(DAY, SellStartDate, GETDATE()) AS DaysOld 
FROM SalesLT.Product 
ORDER BY DaysOld DESC;

-- 64. How many orders were placed in each quarter?
-- Problem: For each year and quarter, count the number of orders.
-- Hint: Use YEAR(OrderDate), DATEPART(QUARTER, OrderDate), GROUP BY.
SELECT YEAR(OrderDate) AS Year, DATEPART(QUARTER, OrderDate) AS Quarter, COUNT(*) AS OrderCount 
FROM SalesLT.SalesOrderHeader 
GROUP BY YEAR(OrderDate), DATEPART(QUARTER, OrderDate) 
ORDER BY Year, Quarter;

-- 65. Which products were introduced in 2005?
-- Problem: List all products whose SellStartDate is in 2005.
-- Hint: Use YEAR(SellStartDate) = 2005.
SELECT Name, SellStartDate 
FROM SalesLT.Product 
WHERE YEAR(SellStartDate) = 2005;

-- 66. How long does it take to ship an order?
-- Problem: For each shipped order, show the number of days between OrderDate and ShipDate.
-- Hint: Use DATEDIFF(DAY, OrderDate, ShipDate) and filter ShipDate IS NOT NULL.

SELECT SalesOrderID, OrderDate, ShipDate,
       DATEDIFF(DAY, OrderDate, ShipDate) AS DaysToShip
FROM SalesLT.SalesOrderHeader
WHERE ShipDate IS NOT NULL;

-- 67. What are the monthly sales and order counts?
-- Problem: For each month, show the number of orders and total sales.
-- Hint: Use FORMAT(OrderDate, 'yyyy-MM'), GROUP BY, and aggregate functions.
SELECT FORMAT(OrderDate, 'yyyy-MM') AS OrderMonth,
       COUNT(*) AS OrderCount,
       SUM(TotalDue) AS TotalSales
FROM SalesLT.SalesOrderHeader
GROUP BY FORMAT(OrderDate, 'yyyy-MM')
ORDER BY OrderMonth;


-- 68. Which products are currently active (available for sale)?
-- Problem: List products where SellStartDate is in the past and SellEndDate is null or in the future.
-- Hint: Use SellStartDate <= GETDATE() and (SellEndDate IS NULL OR SellEndDate >= GETDATE()).

SELECT *
FROM SalesLT.Product
WHERE SellStartDate <= GETDATE()
  AND (SellEndDate IS NULL OR SellEndDate >= GETDATE());

-- 69. When did each customer place their first and last order?
-- Problem: For each customer, show the earliest and latest order dates.
-- Hint: Use MIN(OrderDate) and MAX(OrderDate), GROUP BY CustomerID.
SELECT CustomerID,
       MIN(OrderDate) AS FirstOrderDate,
       MAX(OrderDate) AS LastOrderDate
FROM SalesLT.SalesOrderHeader
GROUP BY CustomerID;


-- 70. Which products were discontinued in 2006?
-- Problem: List all products whose SellEndDate is in 2006.
-- Hint: Use YEAR(SellEndDate) = 2006.

SELECT *
FROM SalesLT.Product
WHERE YEAR(SellEndDate) = 2006;



-- STRING FUNCTIONS (71-80)
-- ============================================

-- 71. What is the full name of each customer?
-- Problem: For each customer, display their full name by combining FirstName and LastName.
-- Hint: Use string concatenation.
SELECT CustomerID, FirstName + ' ' + LastName AS FullName 
FROM SalesLT.Customer;

-- 72. What is the email domain for each customer?
-- Problem: Extract the domain part of each customer's email address.
-- Hint: Use SUBSTRING and CHARINDEX to get the part after '@'.
SELECT EmailAddress, SUBSTRING(EmailAddress, CHARINDEX('@', EmailAddress) + 1, LEN(EmailAddress)) AS Domain 
FROM SalesLT.Customer;

-- 73. What are the product names in uppercase?
-- Problem: Show all product names in uppercase letters.
-- Hint: Use UPPER(Name).
SELECT UPPER(Name) AS ProductName 
FROM SalesLT.Product;

-- 74. Which products have names longer than 20 characters?
-- Problem: List products whose name length is greater than 20 characters.
-- Hint: Use LEN(Name) > 20.
SELECT Name, LEN(Name) AS NameLength 
FROM SalesLT.Product 
WHERE LEN(Name) > 20;

-- 75. What do product numbers look like without spaces?
-- Problem: Show product numbers with all spaces removed.
-- Hint: Use REPLACE(ProductNumber, ' ', '').
SELECT ProductNumber, REPLACE(ProductNumber, ' ', '') AS CleanProductNumber 
FROM SalesLT.Product;

-- 76. What are the first 3 letters of each product name?
-- Problem: For each product, show the first three letters of its name.
-- Hint: Use LEFT(Name, 3).

SELECT Name, LEFT(Name, 3) AS FirstThreeLetters
FROM SalesLT.Product;


---------------------------------------------------------------------------------------------------------------------------
-- ============================================

-- 1. DATA DEFINITION LANGUAGE (DDL)

-- ============================================
 
CREATE DATABASE SQLWORKS2;

USE SQLWORKS2;

-- Creating Tables

CREATE TABLE Employees (

    EmployeeID INT PRIMARY KEY,

    FirstName VARCHAR(50),

    LastName VARCHAR(50),

    Email VARCHAR(100),

    HireDate DATE,

    Salary DECIMAL(10, 2),

    DepartmentID INT

);
 
CREATE TABLE Departments (

    DepartmentID INT PRIMARY KEY,

    DepartmentName VARCHAR(50),

    "Location" VARCHAR(100)

);
 
-- Altering Table Structure

-- Add a new column

ALTER TABLE Employees ADD PhoneNumber VARCHAR(15);
 
-- Modify column data type

ALTER TABLE Employees ALTER COLUMN Email VARCHAR(150);
 
-- Drop a column

ALTER TABLE Employees DROP COLUMN PhoneNumber;
 
-- Removing a Table

DROP TABLE IF EXISTS EMPLOYEES, DEPARTMENTS;
 
-- ============================================

-- 2. DATA MANIPULATION LANGUAGE (DML)

-- ============================================
 
-- Insert sample departments

INSERT INTO Departments (DepartmentID, DepartmentName, Location)

VALUES (1, 'IT', 'New York'),

       (2, 'HR', 'Chicago'),

       (3, 'Sales', 'Los Angeles');
 
-- Inserting Rows (Multiple Methods)

-- Single row insert

INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, HireDate, Salary, DepartmentID)

VALUES (1, 'John', 'Doe', 'john.doe@company.com', '2020-01-15', 75000.00, 1);
 
-- Multiple rows insert

INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, HireDate, Salary, DepartmentID)

VALUES 

    (2, 'Jane', 'Smith', 'jane.smith@company.com', '2019-03-20', 82000.00, 2),

    (3, 'Mike', 'Johnson', 'mike.j@company.com', '2021-06-10', 68000.00, 3),

    (4, 'Sarah', 'Williams', 'sarah.w@company.com', '2018-11-05', 95000.00, 1),

    (5, 'Tom', 'Brown', 'tom.brown@company.com', '2022-02-14', 71000.00, 2);

SELECT * FROM EMPLOYEES;

SELECT * FROM DEPARTMENTS;

-- Updating Rows

-- Update single row

UPDATE Employees 

SET Salary = 78000.00 

WHERE EmployeeID = 1;
 
-- Update multiple rows

UPDATE Employees 

SET Salary = Salary * 1.10 

WHERE DepartmentID = 1;
 
-- Deleting Rows

-- Delete specific row

DELETE FROM Employees WHERE EmployeeID = 5;
 
-- Delete with condition

DELETE FROM Employees WHERE Salary < 70000;

GO;
 
SET IMPLICIT_TRANSACTIONS ON;

-- Transaction Processing

BEGIN TRANSACTION;

    INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, HireDate, Salary, DepartmentID)

    VALUES (8, 'TRAN', 'Davis', 'anna.d@company.com', '2023-01-10', 72000.00, 3);

    UPDATE Employees SET Salary = Salary * 10000000000000000000 WHERE DepartmentID = 2;

ROLLBACK;
 
 
BEGIN TRANSACTION;

    INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, HireDate, Salary, DepartmentID)

    VALUES (8, 'TRAN', 'Davis', 'anna.d@company.com', '2023-01-10', 72000.00, 3);

    UPDATE Employees SET Salary = Salary * 10 WHERE DepartmentID = 2;

COMMIT;

GO; -- Save changes
 
SELECT * FROM EMPLOYEES;

-- Rollback example

BEGIN TRANSACTION;

    DELETE FROM Employees WHERE DepartmentID = 3;

    DELETE FROM Employees WHERE DepartmentID = 1;

ROLLBACK; -- Undo changes
 
-- ============================================

-- 3. DATA RETRIEVAL

-- ============================================
 
-- Basic SELECT statement

SELECT * FROM Employees;
 
-- Select specific columns

SELECT FirstName, LastName, Salary FROM Employees;
 
-- SELECT with DISTINCT

SELECT DISTINCT DepartmentID FROM Employees;
 
-- Queries Based on Conditions (WHERE clause)

SELECT * FROM Employees WHERE Salary > 75000;
 
SELECT FirstName, LastName FROM Employees WHERE DepartmentID = 1;
 
SELECT * FROM Employees WHERE HireDate >= '2020-01-01';
 
-- Queries Using Operators

-- Comparison operators

SELECT * FROM Employees WHERE Salary BETWEEN 70000 AND 85000;
 
-- IN operator

SELECT * FROM Employees WHERE DepartmentID IN (1, 2);
 
-- LIKE operator (pattern matching)

SELECT * FROM Employees WHERE FirstName LIKE 'J%';
 
SELECT * FROM Employees WHERE Email LIKE '%@company.com';
 
-- AND, OR, NOT operators

SELECT * FROM Employees 

WHERE Salary > 70000 AND DepartmentID = 1;
 
SELECT * FROM Employees 

WHERE DepartmentID = 1 OR DepartmentID = 3;
 
SELECT * FROM Employees 

WHERE NOT DepartmentID = 2;
 
-- IS NULL / IS NOT NULL

SELECT * FROM Employees WHERE Email IS NOT NULL;
 
-- Setting Query Results

-- ORDER BY

SELECT * FROM Employees ORDER BY Salary DESC;
 
SELECT FirstName, LastName, HireDate 

FROM Employees 

ORDER BY HireDate ASC;
 
-- TOP / LIMIT (SQL Server uses TOP)

SELECT TOP 3 * FROM Employees ORDER BY Salary DESC;
 
-- OFFSET FETCH (pagination)

SELECT * FROM Employees 

ORDER BY EmployeeID 

OFFSET 2 ROWS FETCH NEXT 3 ROWS ONLY;

-- The offset is used to skip rows. Here it skips the first 2 rows and fetches the next 3 rows.
 
-- ============================================

-- 4. SQL FUNCTIONS

-- ============================================
 
-- SINGLE ROW FUNCTIONS
 
-- Character Functions

-- UPPER, LOWER

SELECT FirstName, UPPER(FirstName) AS UpperName, LOWER(LastName) AS LowerName 

FROM Employees;
 
-- SUBSTRING

SELECT FirstName, SUBSTRING(FirstName, 1, 3) AS ShortName 

FROM Employees;
 
-- LEN / LENGTH

SELECT FirstName, LEN(FirstName) AS NameLength 

FROM Employees;
 76
-- CONCAT

SELECT CONCAT(FirstName, '                       ', LastName) AS FullName 

FROM Employees;
 
-- LTRIM, RTRIM, TRIM

SELECT RTRIM('                       Hello World  ') AS TrimmedText;
 
-- REPLACE

SELECT Email, REPLACE(Email, 'company.com', 'newdomain.com') AS NewEmail 

FROM Employees;
 
-- Number Functions

-- ROUND

SELECT Salary, ROUND(Salary, 0) AS RoundedSalary 

FROM Employees;
 
SELECT ROUND(1234.567, 0);

SELECT ROUND(1234.467, 0);

SELECT ROUND(1234.567, -1);

SELECT ROUND(1234.567, 1);

SELECT ROUND(1256.567, -2) AS 'ROUNDED VALUE';  
 
SELECT ROUND(-1234.567, 0);

SELECT ROUND(-1234.467, 0);

SELECT ROUND(-1234.567, -1);

SELECT ROUND(-1254.567, -2);

SELECT ROUND(-1256.567, -3) AS 'ROUNDED VALUE';  

SELECT ROUND(-1256.567, -2) AS 'ROUNDED VALUE';
 
 
-- 5 EXAMPLES FOR CEILING AND FLOOR

SELECT FLOOR(1.2);  

SELECT CEILING (1.6);  

SELECT FLOOR(-1.2);  

SELECT CEILING (-1.6);  
 
 
SELECT CEILING (1.2);  

SELECT FLOOR(-1.8);                    
 
-- CEILING, FLOOR

SELECT Salary, CEILING(Salary/1000) * 1000 AS CeilingSalary,

       FLOOR(Salary/1000) * 1000 AS FloorSalary

FROM Employees;
 
-- ABS (absolute value)

SELECT ABS(-150) AS AbsoluteValue;
 
-- POWER, SQRT

SELECT POWER(2, 3) AS PowerResult, SQRT(16) AS SquareRoot;
 
-- Date Functions

-- GETDATE (current date/time)

SELECT GETDATE() AS CurrentDateTime;
 
-- DATEADD

SELECT HireDate, DATEADD(YEAR, 1, HireDate) AS OneYearLater 

FROM Employees;
 
-- DATEDIFF

SELECT FirstName, HireDate, 

       DATEDIFF(DAY, HireDate, GETDATE()) AS DaysEmployed 

FROM Employees;
 
-- YEAR, MONTH, DAY

SELECT HireDate, YEAR(HireDate) AS HireYear, 

       MONTH(HireDate) AS HireMonth, 

       DAY(HireDate) AS HireDay 

FROM Employees;
 
-- FORMAT (date formatting)

SELECT HireDate, FORMAT(HireDate, 'MM/dd/yyyy') AS FormattedDate 

FROM Employees;
 
-- Conversion Functions

-- CAST

SELECT Salary, CAST(Salary AS INT) AS IntSalary 

FROM Employees;
 
-- CONVERT

SELECT HireDate, CONVERT(VARCHAR, HireDate, 101) AS USDate 

FROM Employees;
 
-- TRY_CAST (returns NULL if conversion fails)

SELECT TRY_CAST('123' AS INT) AS ValidNumber,

       TRY_CAST('ABC' AS INT) AS InvalidNumber;
 
-- GROUP FUNCTIONS (Aggregate Functions)

-- COUNT

SELECT COUNT(*) AS TotalEmployees FROM Employees;
 
SELECT DepartmentID, COUNT(*) AS EmployeeCount 

FROM Employees 

GROUP BY DepartmentID;
 
-- SUM

SELECT SUM(Salary) AS TotalSalary FROM Employees;
 
-- AVG

SELECT AVG(Salary) AS AverageSalary FROM Employees;
 
SELECT DepartmentID, AVG(Salary) AS AvgSalary 

FROM Employees 

GROUP BY DepartmentID;
 
-- MAX, MIN

SELECT MAX(Salary) AS HighestSalary, MIN(Salary) AS LowestSalary 

FROM Employees;
 