/****** Introduction To SQL Chapter TWELVE  Scripts ******/


/****** STRING FUNCTIONS ******/

--	SQL SERVER:

USE PACKT_ONLINE_SHOP;

SELECT	ProductID, ProductName, UPPER(ProductName) AS 'UPPER CASE PRODUCT NAME'
FROM		Products;


USE PACKT_ONLINE_SHOP;

SELECT	OrderItemID, Quantity, UnitPrice, STR((Quantity * UnitPrice), 10, 2) AS 'Quantity * UnitPrice'
FROM		OrderItems;


USE PACKT_ONLINE_SHOP;

SELECT	OrderItemID, Quantity, UnitPrice, LTRIM(RTRIM(STR((Quantity * UnitPrice), 10, 2))) AS 'Quantity * UnitPrice'
FROM		OrderItems;


/****** EXERCISE 1 ******/

USE PACKT_ONLINE_SHOP;

SELECT OrderID, LTRIM(RTRIM(CONCAT(STR(Quantity), ' Ordered: ', UPPER(Notes))))
AS 'ITEM_QUANTITY_ORDERED_AND_NOTES'

FROM OrderItems;

--	MySQL:

USE PACKT_ONLINE_SHOP;

SELECT	ProductID, ProductName, UPPER(ProductName) AS 'PRODUCT NAME'
FROM		Products;


USE PACKT_ONLINE_SHOP;

SELECT	OrderItemID, Quantity, UnitPrice,
		CONCAT('     ', CAST((Quantity * UnitPrice) AS CHAR), '   ') AS 'Quantity * UnitPrice'
FROM		OrderItems;


USE PACKT_ONLINE_SHOP;

SELECT	OrderItemID, Quantity, UnitPrice,
		CONCAT('     ', CAST((Quantity * UnitPrice) AS CHAR), '   ') AS 'Quantity * UnitPrice',
		TRIM(CONCAT('     ', CAST((Quantity * UnitPrice) AS CHAR), '   ')) AS 'Trimmed Quantity * UnitPrice',
		LTRIM(RTRIM(CONCAT('     ', CAST((Quantity * UnitPrice) AS CHAR), '   '))) AS 'LTRIM(RTRIM( Quantity * UnitPrice ))'
FROM		OrderItems;


/****** EXERCISE 2 ******/

USE PACKT_ONLINE_SHOP;

SELECT	OrderID,
		LTRIM(RTRIM(CONCAT(CAST(Quantity AS CHAR), ' Ordered: ', UPPER(Notes))))
		AS 'ITEM_QUANTITY_ORDERED_AND_NOTES'
FROM		OrderItems;


--	SQL Server and MySQL:

USE PACKT_ONLINE_SHOP;

SELECT	PaymentID, OrderID, PaymentDate, PaymentType, PaymentRef,
		Amount, Notes, BalanceNotes
FROM		Payments
WHERE	amount > 50.00;


USE PACKT_ONLINE_SHOP;

SELECT	CustomerID, FirstName, MiddleName, LastName, Address,
		Email, Phone, Notes
FROM		Customers
WHERE	email = 'jtkirk@NCC1701Enterprise.gov';


USE PACKT_ONLINE_SHOP;

SELECT	*
FROM		Customers
WHERE	email LIKE '%NCC1701Enterprise.gov%';


--	SQL Server:

CREATE PROCEDURE spFilterCustomers

	@emailStringNVARCHAR(100)

AS

-- to test: spFilterCustomers 'NCC1701Enterprise.gov'

SELECT	C.CustomerID, C.FirstName, C.LastName, C.Address,
		C.Email, C.Phone, C.Notes, C.BalanceNotes
FROM		Customers C
WHERE	C.email LIKE '%' + @emailString + '%'


--	MySQL:

USE PACKT_ONLINE_SHOP;

DELIMITER $$

CREATE PROCEDURE `spFilterCustomers` (IN emailString VARCHAR(100))
BEGIN

	# to test:USEPACKT_ONLINE_SHOP;
	# CALL spFilterCustomers('NCC1701Enterprise.gov');

	SELECT	C.CustomerID, C.FirstName, C.LastName, C.Address,
			C.Email, C.Phone, C.Notes, C.BalanceNotes
	FROM		Customers C
	WHERE	C.email LIKE CONCAT('%', emailString, '%');

END$$

DELIMITER ;


/****** ACTIVITY 1 SOLUTION ******/

--	SQL Server:

SELECT	O.OrderID, O.CustomerID, O.OrderNumber, O.OrderDate,
		O.ShipmentDate, O.OrderStatus, O.Notes
FROM		Orders O
WHERE	O.Notes LIKE '%CUST%' AND
		O.ShipmentDate > 'May 1, 1995'


--	MySQL:

USE PACKT_ONLINE_SHOP;

SELECT	O.OrderID, O.CustomerID, O.OrderNumber, O.OrderDate,
		O.ShipmentDate, O.OrderStatus, O.Notes
FROM		Orders O
WHERE	O.Notes LIKE '%CUST%' AND
		O.ShipmentDate > '19950501';


/****** ISNULL ******/

--	SQL Server:

USE PACKT_ONLINE_SHOP;

SELECT	C.FirstName + ' ' + C.LastName as 'Name', C.Phone,
		O.Notes AS 'Order Notes'
FROM		Customers C LEFT OUTER JOIN
		Orders O ON C.CustomerID = O.CustomerID
ORDER BY	C.LastName;


--	MySQL:

USE PACKT_ONLINE_SHOP;

SELECT	CONCAT(C.FirstName, ' ', C.LastName) as 'Name', C.Phone,
		O.Notes AS 'Order Notes'
FROM		Customers C LEFT OUTER JOIN
		Orders O ON C.CustomerID = O.CustomerID
ORDER BY	C.LastName;


--	SQL Server:

USE PACKT_ONLINE_SHOP;

SELECT	C.FirstName + ' ' + C.LastName as 'Name', C.Phone,
		ISNULL(O.Notes, 'NO ORDER NOTES FOUND') AS 'Order Notes'
FROM		Customers C LEFT OUTER JOIN
		Orders O ON C.CustomerID = O.CustomerID
ORDER BY	C.LastName;


/****** EXERCISE 3 ******/

--	SQL Server:

USE PACKT_ONLINE_SHOP;

SELECT	P.ProductID, P.ProductName,
		ISNULL(OI.OrderItemID, 0) AS 'OrderItemID'
FROM		Products P LEFT OUTER JOIN OrderItems OI ON
		P.ProductID = OI.OrderID;

--	MySQL:

USE PACKT_ONLINE_SHOP;

SELECT	CONCAT(C.FirstName, ' ', C.LastName) AS 'Name', C.Phone,
		IFNULL(O.Notes, 'NO ORDER NOTES FOUND') AS 'Order Notes'
FROM		Customers C LEFT OUTER JOIN Orders O ON
		C.CustomerID = O.CustomerID
ORDER BY	C.LastName;


/****** EXERCISE 4 ******/

--	MySQL:

USE PACKT_ONLINE_SHOP;

SELECT	P.ProductID, P.ProductName,
		IFNULL(OI.OrderItemID, 0) AS 'OrderItemID'
FROM		Products P LEFT OUTER JOIN
		OrderItems OI ON P.ProductID = OI.OrderID;


/****** COALESCE ******/

-- MySQL:

SELECT 'A' + '^' + NULL + 'asdf';

SELECT 3 * 12.356 * NULL;

SELECT TRUE + NULL + FALSE;


-- SQL Server:

SELECT 'A' + '^' + NULL + 'asdf' AS "A + '^' + NULL + 'asdf'"

SELECT 3 * 12.356 * NULL AS "3 * 12.356 * NULL"

DECLARE @val1 BIT = 1 -- TRUE
DECLARE @val2 BIT = 0 -- FALSE

SELECT @val1 & NULL & @val2 AS "TRUE + NULL + FALSE"


USE PACKT_ONLINE_SHOP;

--	SQL Server and MySQL:

SELECT	FirstName, MiddleName, LastName,
		FirstName + ' ' + MiddleName + ' ' + LastName as 'CombinedName'
FROM		Customers;


USE PACKT_ONLINE_SHOP;


SELECT	COALESCE(FirstName, ' ') AS 'FirstName',
		COALESCE(MiddleName, 'SUBSTITUTE MIDDLE NAME') AS 'MiddleName',
		COALESCE(LastName, ' ') AS 'LastName'
FROM		Customers;


--	SQL Server:

DECLARE @intVal1 INT;

SELECT COALESCE(@intVal1, -5) + 4 AS 'COALESCE(@intVal1, -5) + 4';


--	MySQL:

SET		@intVal1 = NULL;

SELECT	COALESCE(@intVal1, -5) + 4;


/****** EXERCISE 5 ******/

--	SQL Server:

USE PACKT_ONLINE_SHOP;

SELECT	COALESCE(FirstName, ' ') + ' ' +
		COALESCE(MiddleName, 'SUBSTITUTE MIDDLE NAME') + ' ' +
		COALESCE(LastName, ' ') as 'CombinedName'
FROM		Customers;


/****** EXERCISE 5 ******/

--	MySQL:

USE PACKT_ONLINE_SHOP;

SELECT	CONCAT(COALESCE(FirstName, ' '), ' ',
		COALESCE(MiddleName, 'SUBSTITUTE MIDDLE NAME'), ' ',
		COALESCE(LastName, ' ')) as 'CombinedName'
FROM		Customers;


--	SQL Server:

INSERT	Products (ProductCategoryID, SupplierID, ProductName, ProductImage, NetRetailPrice,
		AvailableQuantity, WholesalePrice, UnitKGWeight, Notes)
VALUES	(3, 2, 'antimatter bottle', NULL, 399999.95, 6128, 149999.99, 521.38, 'handle with care'),
		(3, 2, 'antimatter bottle', NULL, 399999.95, 6128, 149999.99, 521.38, 'handle with care'),
		(3, 2, 'antimatter bottle', NULL, 399999.95, 6128, 149999.99, 521.38, 'handle with care'),
		(3, 2, 'antimatter bottle', NULL, 399999.95, 6128, 149999.99, 521.38, 'handle with care'),
		(3, 2, 'antimatter bottle', NULL, 399999.95, 6128, 149999.99, 521.38, 'handle with care');

SELECT	ProductID, ProductCategoryID, SupplierID, ProductName, ProductImage,
		NetRetailPrice, AvailableQuantity, WholesalePrice, UnitKGWeight, Notes
FROM		Products;


DELETE FROM Products WHERE ProductID > 11;


WITH demoCTE AS
(
	SELECT	ProductID, ProductCategoryID, SupplierID, ProductName, NetRetailPrice,
			AvailableQuantity, WholesalePrice, UnitKGWeight, Notes
	FROM		Products
)

SELECT	ProductID, ProductCategoryID, SupplierID, ProductName, NetRetailPrice,
		AvailableQuantity, WholesalePrice, UnitKGWeight, Notes
FROM		demoCTE


USE PACKT_ONLINE_SHOP;

WITH demoCTE AS

(
	SELECT	ProductID, ProductCategoryID, SupplierID, ProductName, NetRetailPrice,
			AvailableQuantity, WholesalePrice, UnitKGWeight, Notes,
			ROW_NUMBER() OVER (
				PARTITION BYProductCategoryID, SupplierID, ProductName, NetRetailPrice,
				AvailableQuantity, WholesalePrice, UnitKGWeight, Notes
			ORDER BY ProductID
			) AS RowNumber
	FROM Products
)

SELECT	ProductID, ProductCategoryID, SupplierID, ProductName, NetRetailPrice,
		AvailableQuantity, WholesalePrice, UnitKGWeight, Notes, RowNumber
FROM		demoCTE
ORDER BY	ProductID;


USE PACKT_ONLINE_SHOP;

WITH demoCTE
AS
(
	SELECT	ProductID, ProductCategoryID, SupplierID, ProductName,
			NetRetailPrice, AvailableQuantity, WholesalePrice, UnitKGWeight, Notes,
			ROW_NUMBER() OVER (
				PARTITION BY ProductCategoryID, SupplierID, ProductName, NetRetailPrice,
				AvailableQuantity, WholesalePrice, UnitKGWeight, Notes
				ORDER BY ProductID
			) AS RowNumber
	FROM Products
)

DELETE FROM	demoCTE
WHERE		RowNumber > 1;

SELECT * FROM Products;


--	MySQL:

USE PACKT_ONLINE_SHOP;

INSERT Products (ProductCategoryID, SupplierID, ProductName, ProductImage, NetRetailPrice, AvailableQuantity, WholesalePrice, UnitKGWeight, Notes)

VALUES(3, 2, 'antimatter bottle', NULL, 399999.95, 6128, 149999.99, 521.38, 'handle with care'),
		(3, 2, 'antimatter bottle', NULL, 399999.95, 6128, 149999.99, 521.38, 'handle with care'),
		(3, 2, 'antimatter bottle', NULL, 399999.95, 6128, 149999.99, 521.38, 'handle with care'),
		(3, 2, 'antimatter bottle', NULL, 399999.95, 6128, 149999.99, 521.38, 'handle with care'),
		(3, 2, 'antimatter bottle', NULL, 399999.95, 6128, 149999.99, 521.38, 'handle with care');


USE PACKT_ONLINE_SHOP;

WITH demoCTE AS
(
	SELECT	ProductID, ProductCategoryID, SupplierID, ProductName, NetRetailPrice,
			AvailableQuantity, WholesalePrice, UnitKGWeight, Notes
	FROM		Products

)

SELECT	ProductID, ProductCategoryID, SupplierID, ProductName, NetRetailPrice,
		AvailableQuantity, WholesalePrice, UnitKGWeight, Notes
FROM		demoCTE;


USE PACKT_ONLINE_SHOP;

WITH demoCTE AS
(
	SELECT ROW_NUMBER() OVER (PARTITION BY ProductCategoryID, SupplierID, ProductName,
									ProductImage, NetRetailPrice, AvailableQuantity,
									WholesalePrice, UnitKGWeight, Notes
							ORDER BY ProductID) AS RowNumber,
			ProductID, ProductCategoryID, SupplierID, ProductName, ProductImage,
			NetRetailPrice, AvailableQuantity, WholesalePrice, UnitKGWeight, Notes
	FROM	Products)

SELECT	RowNumber, ProductID, ProductCategoryID, SupplierID, ProductName,
		NetRetailPrice, AvailableQuantity, WholesalePrice, UnitKGWeight, Notes
FROM		demoCTE
ORDER BY	RowNumber;


USE PACKT_ONLINE_SHOP;

WITH demoCTE
AS
(
	SELECT	ProductID, ProductID, ProductCategoryID, SupplierID, ProductName,
			NetRetailPrice, AvailableQuantity, WholesalePrice, UnitKGWeight, Notes,
			ROW_NUMBER() OVER (
			PARTITION BY ProductCategoryID, SupplierID, ProductName, NetRetailPrice,
			AvailableQuantity, WholesalePrice, UnitKGWeight, Notes
			ORDER BY ProductID
			) AS RowNumber
	FROM Products
)

DELETE FROM	Products
USING		Products JOIN demoCTE ON Products.ProductID = demoCTE.ProductID
WHERE		demoCTE.RowNumber > 1;

SELECT * FROM Products;


DELETE FROM	demoCTE
WHERE		RowNumber > 1;


/****** TRANSACTIONS ******/

--	SQL Server:

USE PACKT_ONLINE_SHOP;

SELECT	ProductID, Availablequantity
FROM		Products
WHERE	productid = 3;


UPDATE	Products
SET		AvailableQuantity = 150
WHERE	ProductID = 3


USE PACKT_ONLINE_SHOP;

SELECT	ProductID, Availablequantity
FROM		Products
WHERE	Productid = 3;

BEGIN TRANSACTION;

UPDATE	Products
SET		AvailableQuantity = 150 --Original value = 1000
WHERE	ProductID = 3

-- COMMIT TRANSACTION;
ROLLBACK TRANSACTION;


--	MySQL:

USE PACKT_ONLINE_SHOP;

SELECT	ProductID, Availablequantity
FROM		Products
WHERE	Productid = 3;

START TRANSACTION;

UPDATE	Products
SET		AvailableQuantity = 150 #Original value = 1000
WHERE ProductID = 3;

# COMMIT;

ROLLBACK;
