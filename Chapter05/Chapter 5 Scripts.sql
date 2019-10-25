/****** Introduction To SQL Chapter Five  Scripts ******/

/*  SELECT SYNTAX */

SELECT * FROM ProductCategories;

/*Selects datetime at the moment*/
SELECT GETDATE();

/* SELECTING  LIMITED COLUMNS  */

SELECT ProductCategoryID, ProductCategoryName 
FROM ProductCategories;



SELECT ProductCategoryName, ProductCategoryID 
FROM ProductCategories;



/* USING NAMING ALIASES */


SELECT ProductCategoryName AS CATEGORY, ProductCategoryID AS ID 
FROM ProductCategories;


SELECT ProductCategoryName AS [CATEGORY NAME], ProductCategoryID AS ID 
FROM ProductCategories;


/* ORDERING RESULTS */

SELECT ProductCategoryName   AS [CATEGORY NAME], ProductCategoryID  AS ID 
FROM ProductCategories
ORDER BY [CATEGORY NAME] ASC;


SELECT ProductCategoryName   AS [CATEGORY NAME], ProductCategoryID  AS ID 
FROM ProductCategories
ORDER BY [CATEGORY NAME] DESC;

SELECT FirstName, CustomerID 
FROM Customers ;


SELECT FirstName, CustomerID 
FROM Customers 
ORDER BY FirstName, CustomerID DESC;

SELECT FirstName, CustomerID 
FROM Customers 
ORDER BY 1, 2;  

/* USING TOP AND DISTINCT */

SELECT TOP 5  ProductName,NetRetailPrice
FROM Products 
ORDER BY ProductName;

SELECT TOP 50 PERCENT  ProductName,NetRetailPrice
FROM Products 
ORDER BY ProductName  ;

SELECT FirstName,LastName, Address
FROM Customers;

SELECT DISTINCT FirstName,LastName, Address
FROM Customers;

SELECT DISTINCT FirstName, Address
FROM Customers;

/* USING MATHEMATICAL EXPRESSIONS */

SELECT ProductID, Quantity,UnitPrice, (Quantity*UnitPrice) AS [Line Item Total]
FROM OrderItems;


SELECT ProductID, Quantity,UnitPrice, (Quantity*UnitPrice) AS [Line Item Total], Discount, ((Quantity*UnitPrice)-((Quantity*UnitPrice)*Discount)) AS [Price After Discount] 
FROM OrderItems;



/*  CHAPTER FIVE ACTIVITY SOLUTION*/

Select TOP 5
	   Products.ProductName as [Product Name],
	   Products.NetRetailPrice as [Product Retail Price],
	   Products.AvailableQuantity as [Available Quantity],
	   Products.AvailableQuantity * Products.NetRetailPrice as [Total Price of Available QTY]
from Products 

ORDER BY Products.NetRetailPrice Desc
