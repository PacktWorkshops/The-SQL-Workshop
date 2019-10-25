/****** Introduction To SQL Chapter NINE  Scripts ******/

/****** SUBQUERIES ******/

USE		packt_online_shop;

SELECT	Products.ProductID, Products.ProductName,
		Products.ProductCategoryID
FROM		Products LEFT OUTER JOIN
		OrderItems
ON		Products.ProductID = OrderItems.ProductID
WHERE	OrderItems.ProductID IS NULL
ORDER BY	Products.ProductID;


USE		packt_online_shop;

SELECT	Products.ProductID, Products.ProductName,
		Products.ProductCategoryID
FROM		Products INNER JOIN	OrderItems
ON		Products.ProductID = OrderItems.ProductID
WHERE	OrderItems.ProductID IS NULL
ORDER BY	Products.ProductID;


USE packt_online_shop;

SELECT	Products.ProductID, Products.ProductName,
		Products.ProductCategoryID
FROM		Products
WHERE	Products.ProductID NOT IN
		(SELECT ProductID FROM OrderItems)
ORDER BY	Products.ProductID;


SELECT	ProductID FROM OrderItems


/****** EXERCISE 1 ******/

--	STEP 1:

USE		packt_online_shop;

SELECT	OrderID FROM ORDERITEMS;

--	STEP 2:

USE		packt_online_shop;
SELECT	O.OrderID
FROM		Orders O

--	STEP 3:

USE		packt_online_shop;

SELECT	O.OrderID
FROM		Orders O
WHERE	O.OrderID NOT IN

			(SELECT OrderID FROM ORDERITEMS)

ORDER BY	O.OrderID;


/****** ACTIVITY 1 SOLUTION ******/

USE		packt_online_shop;

SELECT	PC.ProductCategoryName
FROM		ProductCategories PC
WHERE	ProductCategoryID IN

		(	SELECT	ProductCategoryID
			FROM		Products
			WHERE	ProductName = 'habanero peppers' );


/****** CASE STATEMENTS ******/

USE		packt_online_shop;

SELECT	ProductName, WholesalePrice, NetRetailPrice,
		'Price Point' AS 'Price Point', UnitKGWeight
FROM		products
ORDER BY	ProductName;


USE		packt_online_shop;

SELECT	ProductName, WholesalePrice, NetRetailPrice,
		CASE
				WHEN NetRetailPrice <= 24.99 THEN 'Cheap'
				WHEN NetRetailPrice > 24.99 AND
					NetRetailPrice <= 79.99 THEN 'Mid-price'
				WHEN NetRetailPrice > 79.99 AND
					NetRetailPrice <= 2499.99 THEN 'Expensive'
				ELSE 'Very Expensive'
		END AS 'Price Point',
		UnitKGWeight
FROM		products
ORDER BY	ProductName;


/****** EXERCISE 1 ******/

--	STEP 1:

USE		packt_online_shop;

SELECT	ProductName, NetRetailPrice, UnitKGWeight
FROM		products;

--	STEP 2:

USE		packt_online_shop;

SELECT	ProductName, NetRetailPrice, UnitKGWeight,
		CASE
			WHEN (NetRetailPrice * UnitKGWeight) <= 1.0 THEN 'Cheap'
		END AS 'Shipping Cost'
FROM		products

--	STEP 3:

USE packt_online_shop;

SELECT	ProductName, NetRetailPrice, UnitKGWeight,
		CASE
			WHEN (NetRetailPrice * UnitKGWeight) <= 1.0 THEN 'Cheap'
			WHEN (NetRetailPrice * UnitKGWeight) > 1.0 AND
				(NetRetailPrice * UnitKGWeight) <= 35.00 THEN 'Mid-price'
			WHEN (NetRetailPrice * UnitKGWeight) > 35.00 AND
				(NetRetailPrice * UnitKGWeight) <= 100.00 THEN 'Expensive'
			ELSE 'Very Expensive'
		END AS 'Shipping Cost'
FROM		products;


/****** ACTIVITY 2 SOLUTION ******/

USE		packt_online_shop;

SELECT	OrderNumber, ShipmentDate,
		CASE
			WHEN ShipmentDate < ' 2010-12-10' THEN 'Past Shipment Date'
			WHEN ShipmentDate >= ' 2010-12-10' AND
				ShipmentDate < ' 2018-12-18' THEN 'Recent Shipment Date'
			ELSE 'Future Shipment Date'
		END AS 'Shipment Date Category'
FROM		Orders;


/****** VIEWS ******/

USE		packt_online_shop;

SELECT	CONCAT(customers.FirstName, ' ', customers.LastName) AS 'CustomerName',
		orders.OrderDate, products.ProductName
FROM		customers INNER JOIN orders ON
		customers.CustomerID = orders.CustomerID
		INNER JOIN orderitems ON
		orders.OrderID = orderitems.OrderID
		INNER JOIN products ON
		orderitems.ProductID = products.ProductID;


USE		packt_online_shop;
GO		-- Include for SQL Server; remove for MySQL


CREATE VIEW CUSTOMER_PRODUCT_VIEW

AS

SELECT	CONCAT(customers.FirstName, ' ', customers.LastName) AS 'CustomerName',
		orders.OrderDate, products.ProductName
FROM		customers INNER JOIN orders ON
		customers.CustomerID = orders.CustomerID
		INNER JOIN orderitems ON
		orders.OrderID = orderitems.OrderID
		INNER JOIN products ON
		orderitems.ProductID = products.ProductID;


SELECT	CustomerName, OrderDate, ProductName
FROM		customer_product_view;


/****** EXERCISE 3 ******/

--	STEP 1:

USE		PACKT_ONLINE_SHOP;

SELECT	customers.CustomerID, orders.OrderDate,
		products.ProductID, products.ProductName,
		orderitems.Quantity * orderitems.UnitPrice AS
		'PerProductSpending'
FROM		customers INNER JOIN orders ON
		customers.CustomerID = orders.CustomerID
		INNER JOIN orderitems ON
		orders.OrderID = orderitems.OrderID
		INNER JOIN products ON
		orderitems.ProductID = products.ProductID


--	STEP 2:

USE		PACKT_ONLINE_SHOP;

CREATE VIEW PACKT_VIEW_1

AS

SELECT	customers.CustomerID, orders.OrderDate,
		products.ProductID, products.ProductName,
		orderitems.Quantity * orderitems.UnitPrice AS
		'PerProductSpending'
FROM		customers INNER JOIN orders ON
		customers.CustomerID = orders.CustomerID
		INNER JOIN orderitems ON
		orders.OrderID = orderitems.OrderID
		INNER JOIN products ON
		orderitems.ProductID = products.ProductID


--	STEP 3:

USE PACKT_ONLINE_SHOP;

GO -- Include for SQL Server; don't include for MySQL

CREATE VIEW PACKT_VIEW_1

AS

SELECT	customers.CustomerID, orders.OrderDate,
		products.ProductID, products.ProductName,
		orderitems.Quantity * orderitems.UnitPrice AS
		'PerProductSpending'
FROM		customers INNER JOIN orders ON
		customers.CustomerID = orders.CustomerID
		INNER JOIN orderitems ON
		orders.OrderID = orderitems.OrderID
		INNER JOIN products ON
		orderitems.ProductID = products.ProductID


--	STEP 4:

USE		PACKT_ONLINE_SHOP;

SELECT	CustomerID, OrderDate, ProductID, ProductName,
		PerProductSpending
FROM		PACKT_VIEW_1
WHERE	PerProductSpending > 14.99;


/****** ACTIVITY 3 SOLUTION ******/

USE packt_online_shop;

CREATE VIEW Atreides_Sales_View AS

SELECT	OI.OrderID, OI.ProductID, OI.Quantity, OI.UnitPrice,
		(OI.Quantity * OI.UnitPrice) AS 'subtotal',
		CASE
			WHEN (OI.Quantity * OI.UnitPrice) < 25.00 THEN 'Small'
			WHEN (OI.Quantity * OI.UnitPrice) <= 79.99 THEN 'Medium'
			ELSE 'Large'
		END AS 'Subtotal Category'
FROM		OrderItems OI INNER JOIN
		Orders O ON OI.OrderID = O.OrderID
WHERE	O.CustomerID IN
		( SELECT	CustomerID
		  FROM	Customers
		  WHERE	LastName = 'Atreides' );
