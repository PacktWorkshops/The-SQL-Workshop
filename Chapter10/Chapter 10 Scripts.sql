/****** Introduction To SQL Chapter TEN  Scripts ******/


/****** PROGRAMMING FOR SQL PRODUCTS - THE BASICS ******/

--	SQL SERVER:

DECLARE @var1 INTEGER -- 1. Declare variable @var1 as an INTEGER

SELECT @var1 -- 2. Output the value of @var1

SET @var1 = 3 -- 3. Set @var1 to 3

SELECT @var1 -- 4. Output the value of @var1

SET @var1 = @var1-7 -- 5. Subtract 7 from @var1

SELECT @var1 -- 6. Output the value of @var1

SET @var1 += 5 -- 7. Add 5 to @var1

SELECT @var1 -- 8. Output the value of @var1


--	MySQL:

SET @var1 = NULL; -- 1. Declare variable @var1 as an INTEGER

SELECT @var1; -- 2. Output the value of @var1

SET @var1 = 3; -- 3. Set @var1 to 3

SELECT @var1; -- 4. Output the value of @var1

SET @var1 = @var1-7; -- 5. Subtract 7 from @var1

SELECT @var1; -- 6. Output the value of @var1

SET @var1 = @var1 + 5; -- 7. Add 5 to @var1

SELECT @var1; -- 8. Output the value of @var1


/****** STORED PROCEDURES ******/

USE packt_online_shop;

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


CREATE PROCEDURE spFilterProductsByNRP

	@priceLevel float

AS

-- to test: spFilterProductsByNRP 206.00

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
WHERE	NetRetailPrice <= @priceLevel
ORDER	BY ProductName;


/****** EXERCISE 1 ******/

--	SQL SERVER:

CREATE PROCEDURE spCustomerOrders

	@orderDate Datetime

AS

-- to test: spCustomerOrders 'January 2, 2010'

SELECT	C.FirstName + ' ' + C.LastName as 'Customer Name',
		O.OrderNumber, O.OrderDate

FROM		orders O INNER JOIN customers C ON
		C.CustomerID = O.CustomerID
WHERE	O.OrderDate <= @orderDate
ORDER BY	'Customer Name';

--	MySQL:
DELIMITER $$
CREATE PROCEDURE `spFilterProductsByNRP` (IN priceLevel FLOAT)

BEGIN

# to test: USE packt_online_shop;
# CALL spFilterProductsByNRP(10.50);

SELECT	ProductName, WholesalePrice, NetRetailPrice,
		CASE
			WHEN NetRetailPrice <= 24.99 THEN 'Cheap'
			WHEN NetRetailPrice > 24.99 AND
				NetRetailPrice <= 79.99 THEN 'Mid-price'
			WHEN	NetRetailPrice > 79.99 AND
				NetRetailPrice <= 2499.99 THEN 'Expensive'
			ELSE 'Very Expensive'
		END AS 'Price Point',
		UnitKGWeight
FROM		products
WHERE	NetRetailPrice <= priceLevel
ORDER	BY ProductName;

END$$


/****** EXERCISE 2 ******/

CREATE PROCEDURE `spCustomerOrders` (IN orderDate datetime)

# to test: USE packt_online_shop;
# CALL spCustomerOrders('2010-01-02');

SELECT	CONCAT(C.FirstName, ' ', C.LastName) as 'Customer Name',
		O.OrderNumber, O.OrderDate
FROM		orders O INNER JOIN customers C ON
		C.CustomerID = O.CustomerID
WHERE	O.OrderDate <= orderDate
ORDER BY 'Customer Name';


USE packt_online_shop;

DELIMITER $$

CREATE PROCEDURE `spFilterProductsByNRP` (IN priceLevel FLOAT)
BEGIN

# to test: USEpackt_online_shop;
# CALL spFilterProductsByNRP(10.50);

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
WHERE	products.NetRetailPrice <= priceLevel
ORDER BY	ProductName;

END$$

DELIMITER ;


/****** EXERCISE 3 ******/

--	SQL SERVER:

ALTER PROCEDURE spFilterProductsByNRP

	@priceLevel float,
	@unitWeight float

AS

-- to test: spFilterProductsByNRP 206.00, 1.0

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
WHERE	NetRetailPrice <= @priceLevel AND
		UnitKGWeight <= @unitWeight
ORDER BY ProductName;

--	MySQL:
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spFilterProductsByNRP`(IN priceLevel FLOAT, IN unitWeight FLOAT)

BEGIN

# to test: USE packt_online_shop;
# CALL spFilterProductsByNRP(10.50, 1.0);

SELECT	ProductName, WholesalePrice, NetRetailPrice,
		CASE
			WHEN NetRetailPrice <= 24.99 THEN 'Cheap'
			WHEN NetRetailPrice > 24.99 AND
				NetRetailPrice <= 79.99 THEN 'Mid-price'
			WHEN NetRetailPrice > 79.99 AND
				NetRetailPrice <= 2499.99 THEN 'Expensive'
			ELSE 'Very Expensive'
		END AS 'Price Point',
		UnitKGWeight,
		AvailableQuantity # New column requested by PACKT #management for Products webpage
FROM		products
WHERE	NetRetailPrice <= priceLevel AND
		UnitKGWeight <= unitWeight # Filter with unitWeight parameter value
ORDER BY	ProductName;

END$$


/****** ACTIVITY 1 SOLUTION ******/

--	SQL Server:

CREATE PROCEDURE [dbo].[spFilterOrdersByItemQuantity]

	@orderItemQuantityVal int

AS

-- to test: spFilterOrdersByItemQuantity 25

SELECT	O.OrderID, SUM(OI.Quantity) AS 'Total Order Item Quantity'
FROM		Orders O INNER JOIN OrderItems OI ON
		O.OrderID = OI.OrderID
GROUP BY	O.OrderID
HAVING	SUM(OI.Quantity) <= @orderItemQuantityVal
ORDER BY O.OrderID;

GO


--	MySQL:

USE	packt_online_shop;

DELIMITER $$

CREATE PROCEDURE `spFilterOrdersByItemQuantity` (IN orderItemQuantityVal int)
BEGIN

# to test: USE packt_online_shop;

# CALL spFilterOrdersByItemQuantity(25);

SELECT	O.OrderID, SUM(OI.Quantity) AS 'Total Order Item Quantity'
FROM		Orders O INNER JOIN
		OrderItems OI ON O.OrderID = OI.OrderID
GROUP BY	O.OrderID
HAVING	SUM(OI.Quantity) <= orderItemQuantityVal
ORDER BY	O.OrderID;

END$$

DELIMITER ;


/****** FUNCTIONS ******/

--	SQL SERVER:

DECLARE @var1 INT, @var2 NVARCHAR(500) = 'A test string'	--  1.	Declare variables and
												--		assign a value to a
												--		variable

SET @var1 = 3 --  2. Set @var1 to 3

SELECT LOG(@var1) --  3. The natural log function

SELECT @var1 --  4. @var1 did not change

SELECT EXP(LOG(@var1)) --  5. Nested function calls: natural log, then exponential

SELECT LOG(EXP(@var1)) --  6. Nested function calls: exponential, then natural log

SELECT @var1 --  7. @var1 did not change

SET @var1 = @var1 * 5 --  8. @var1 has a new value

SELECT @var1 --  9. Select @var1

SELECT @var2 -- 10. Set @var2 = natural log of @var1

SELECT UPPER(@var2) -- 11. Select UPPER CASE @var2


--	MySQL:

SET @var1 = NULL, @var2 = 'A test string';	#  1.	Declare variables and
									#		assign a value to a variable

SET @var1 = 3; #  2. Set @var1 to 3

SELECT LOG(@var1); #  3. Select the natural log of @var1

SELECT @var1; #  4. @var1 did not change

SELECT EXP(LOG(@var1)); #  5. Nested function calls: natural log, then exponential

SELECT LOG(EXP(@var1)); #  6. Nested function calls: exponential, then natural log

SELECT @var1; #  7. @var1 did not change

SET @var1 = @var1 * 5; #  8. @var1 has a new value

SELECT @var1; #  9. Select @var1

SELECT @var2; # 10. Set @var2 = natural log of @var1

SELECT UPPER(@var2); # 11. Select UPPER CASE @var2


DECLARE @custID AS INT = 3;

SELECT	SUM((OI.Quantity * (OI.UnitPrice - OI.Discount)))
FROM		OrderItems OI INNER JOIN Orders O ON
		OI.OrderID = O.OrderID
WHERE	O.CustomerID = @custID;


CREATE FUNCTION [dbo].[fnTotalSalesRvnByCust] (@CustomerID int)
RETURNS float -- The return value data type
AS

BEGIN

	/*

		To test:
		
		SELECT dbo.fnTotalSalesRvnByCust(12)
		SELECT dbo.fnTotalSalesRvnByCust(3)

	 */

DECLARE @retVal float; -- Variable to hold the return value

	SELECT	@retVal = SUM(OI.Quantity * (OI.UnitPrice - OI.Discount))
	FROM		OrderItems OI INNER JOIN Orders O ON
			OI.OrderID = O.OrderID
	WHERE	O.CustomerID = @CustomerID

	IF (@retVal IS NULL)	-- If a customer has not placed an order, (s)he
						-- has a total revenue value of null. We'll have
						-- an easier time dealing with a 0.00 return
						-- value in that case.

	BEGIN
		SET @retVal = 0.00;
	END

	RETURN @retVal;

END;


SELECT	CONCAT(FirstName, ' ', LastName) AS 'Customer Name',
		CustomerID, dbo.fnTotalSalesRvnByCust(CustomerID) AS 'Total Customer Revenue'
FROM		Customers





/****** EXERCISE 4 ******/

--	SQL SERVER:

CREATE FUNCTION dbo.fnCountCustomerOrders (@CustomerID int)

	RETURNS INT

AS

BEGIN

	/*

		To test:
		
		SELECT dbo.fnCountCustomerOrders(12)
		SELECT dbo.fnCountCustomerOrders(3)
		
	 */

	DECLARE	@retVal int;
	
	SELECT	@retVal = COUNT(O.OrderID)
	FROM		Orders O INNER JOIN Customers C ON
			O.CustomerID = C.CustomerID
	WHERE	C.CustomerID =  @CustomerID

	RETURN @retVal;

END;


--	MySQL:
DELIMITER $$
CREATE FUNCTION `fnTotalSalesRvnByCust` (CustomerID Integer)
RETURNS FLOAT
DETERMINISTIC
BEGIN

	/*

		To test:
		
		SELECT packt_online_shop.fnTotalSalesRvnByCust (12);
		SELECT packt_online_shop.fnTotalSalesRvnByCust (3);

	 */

	DECLARE retVal FLOAT;
	
	SET retVal = (
				SELECT	SUM(OI.Quantity * (OI.UnitPrice - OI.Discount))
				FROM		OrderItems OI INNER JOIN Orders O ON
						OI.OrderID = O.OrderID
				WHERE	O.CustomerID = CustomerID
			);

	IF (retVal IS NULL) THEN -- If a customer has not placed an order, (s)he
						-- has a total revenue value of null. We'll
						-- have an easier time dealing with a 0.00
						-- return value in that case.

		SET retVal = 0.00;
	END IF;

	RETURN (retVal);
END$$


SELECT packt_online_shop.fnTotalSalesRvnByCust (12);
SELECT packt_online_shop.fnTotalSalesRvnByCust (3);


/****** EXERCISE 5 ******/

--	MySQL:
DELIMITER $$
CREATE FUNCTION `fnCountCustomerOrders` (CustomerID Integer)
RETURNS INTEGER
DETERMINISTIC
BEGIN

	/*
		To test:

		SELECT packt_online_shop.fnCountCustomerOrders (12);
		SELECT packt_online_shop.fnCountCustomerOrders (3);

	 */

	DECLARE retVal INTEGER;

	SET retVal = (
				SELECT	COUNT(O.OrderID)
				FROM		Orders O INNER JOIN Customers C ON
						O.CustomerID = C.CustomerID
				WHERE	C.CustomerID =  CustomerID
			);

	RETURN(retVal);
END$$


/****** ACTIVITY 2 SOLUTION ******/

--	SQL SERVER:

CREATE FUNCTION dbo.fnProductTotalOrderQty (@ProductID int)
RETURNS INT
AS

BEGIN

	/*
		To test:

		SELECT dbo.fnProductTotalOrderQty(12)
		SELECT dbo.fnProductTotalOrderQty(3)
	 */

	DECLARE	@retVal AS INT;

	SET	@retVal = (
					SELECT
						CASE
							WHEN SUM(OI.quantity) IS NULL THEN 0
						ELSE
							SUM(OI.quantity)
						END AS 'quantity'

					FROM		OrderItems OI
					WHERE	OI.Productid = @ProductID
				);

	RETURN	@retVal;

END;

GO

--	MySQL:
DELIMITER $$
CREATE DEFINER =`root`@`localhost` FUNCTION `fnProductTotalOrderQty`(ProductID INT)
RETURNS INT
DETERMINISTIC
BEGIN

/*

To test:

	SELECT packt_online_shop.fnProductTotalOrderQty(12);
	SELECT packt_online_shop.fnProductTotalOrderQty(3);
 */



DECLARE	retVal INT;

SET	retVal = (
				SELECT
					CASE
						WHEN SUM(OI.quantity) IS NULL THEN 0
					ELSE
						SUM(OI.quantity)
					END AS 'quantity'
				FROM		OrderItems OI
				WHERE	OI.Productid = ProductID
			);
	RETURN retVal;
END$$


/****** TRIGGERS ******/

--	SQL Server:

CREATE TRIGGER tr_Basic
ON	Payments
AFTER INSERT
AS

BEGIN

/*
	To test: INSERT INTO Payments(OrderID, PaymentDate, PaymentType,
							PaymentRef, Amount, Notes, BalanceNotes)

					VALUES (1, '20140303', 'credit card', 'W26UA4',
							$7.10, 'payment received', NULL)
*/

	SELECT	'Basic trigger for the Payments table'

END


CREATE TRIGGER tr_OrderItems_OnInsert
ON OrderItems
AFTER INSERT
AS
BEGIN

	/*
		To test:	INSERT INTO OrderItems(OrderID, ProductID, Quantity,
									UnitPrice, Discount, Notes)
				VALUES(1, 6, 12, 4.49, 0.00, NULL)

				SELECT	C.BalanceNotes
				FROM		Customers C
				WHERE	C.CustomerID = 2

	*/

	DECLARE	@customerID INT, @orderBalance MONEY, @paymentBalance MONEY,
			@runningTotal MONEY

	DECLARE	@OrderID INT, @balanceNotesText NVARCHAR(1000)

	-- The "INSERTED" table has the CustomerID and OrderID values we'll need

	SELECT	@orderID = OrderID FROM INSERTED

	-- Find the customerID for that order

	SELECT	@customerID = O.CustomerID
	FROM		Orders O
	WHERE	OrderID = @OrderID

	-- Calculate the order balance for the customer

	SELECT	@orderBalance = SUM(OI.Quantity * (OI.UnitPrice - OI.Discount))
	FROM		OrderItems OI INNER JOIN Orders O ON
			OI.OrderID = O.OrderID
	WHERE	O.CustomerID = @CustomerID

	--	Calculate the payment balance for the customer

	SELECT	@paymentBalance = SUM(P.Amount)
	FROM		Payments P INNER JOIN Orders O ON
			P.OrderID = O.OrderID
	WHERE	O.CustomerID = @CustomerID

	--	Calculate the running total, and convert the value to NVARCHAR

	SET		@runningTotal = CAST((@orderBalance - @paymentBalance) AS NVARCHAR)

	--	Build the @balanceNotesText string

	SET		@balanceNotesText = CONCAT('Customer ', CAST(@customerID AS NVARCHAR))
	SET		@balanceNotesText = CONCAT(@balanceNotesText, ' has a new running balance of $')

	/*

		The GETDATE() function has the datestamp value we need;
		use the CONVERT function to format the datestamp value
	 */

	SET		@balanceNotesText += CONCAT(@runningTotal, ' as of ')
	SET		@balanceNotesText += CONVERT(VARCHAR, GETDATE(), 107)

	-- Update the Customers.BalanceNotes column for that specific @customerID

	UPDATE	Customers
	SET		Customers.BalanceNotes = @balanceNotesText
	WHERE	CustomerID = @customerID

END


INSERT	INTO OrderItems(OrderID, ProductID, Quantity,
						UnitPrice, Discount, Notes)
VALUES(1, 6, 12, 4.49, 0.00, NULL)

SELECT	C.BalanceNotes
FROM		Customers C
WHERE	C.CustomerID = 2


CREATE TRIGGER tr_Payments_OnInsert
ON Payments
AFTER INSERT
AS
BEGIN

	/*
		To test:	INSERT INTO Payments(OrderID, PaymentDate, PaymentType,
								PaymentRef, Amount, Notes, BalanceNotes)
				VALUES(1, GETDATE(), 'check', 'SDGH4A', 12.97, NULL, NULL)

				SELECT	C.BalanceNotes
				FROM		Customers C
				WHERE	C.CustomerID = 2

	*/

	DECLARE	@customerID INT, @orderBalance MONEY, @paymentBalance MONEY
	DECLARE	@runningTotal MONEY, @OrderID INT, @balanceNotesText NVARCHAR(1000)

	-- The "INSERTED" table has the CustomerID and OrderID values we'll need

	SELECT	@orderID = OrderID FROM INSERTED

	-- Find the customerID for that order

	SELECT	@customerID = O.CustomerID
	FROM		Orders O
	WHERE	OrderID = @OrderID

	-- Calculate the order balance for the customer

	SELECT	@orderBalance = SUM(OI.Quantity * (OI.UnitPrice - OI.Discount))
	FROM		OrderItems OI INNER JOIN Orders O ON
			OI.OrderID = O.OrderID
	WHERE	O.OrderID = @OrderID

	-- Calculate the payment balance for the customer

	SELECT	@paymentBalance = SUM(P.Amount)
	FROM		Payments P INNER JOIN Orders O ON
			P.OrderID = O.OrderID
	WHERE	O.CustomerID = @CustomerID

	-- Calculate the running total, and convert the value to NVARCHAR

	SET		@runningTotal = CAST((@orderBalance - @paymentBalance) AS NVARCHAR)

	-- Build the @balanceNotesText string

	SET	@balanceNotesText = CONCAT('Customer ', CAST(@customerID AS NVARCHAR))
	SET	@balanceNotesText = CONCAT(@balanceNotesText, ' has a new running balance of $')
	SET	@balanceNotesText += CONCAT(@runningTotal, ' as of ')

	/*

		The GETDATE() function has the datestamp value we need;
		use the CONVERT function to format the datestamp value
	 */

	SET	@balanceNotesText += CONVERT(VARCHAR, GETDATE(), 107)

	-- Update the Customers.BalanceNotes column for that specific @customerID

	UPDATE	Customers
	SET		Customers.BalanceNotes = @balanceNotesText
	WHERE	CustomerID = @customerID

END


INSERT INTO Payments(OrderID, PaymentDate, PaymentType,
				PaymentRef, Amount, Notes, BalanceNotes)
VALUES(1, GETDATE(), 'check', 'SDGH4A', 12.97, NULL, NULL)

SELECT	C.BalanceNotes
FROM		Customers C
WHERE	C.CustomerID = 2


/****** EXERCISE 6 ******/

--	SQL SERVER:

CREATE TRIGGER tr_Products_OnInsert
ON Products
AFTER INSERT
AS
BEGIN

	/*
		To test:	INSERT INTO Products(ProductCategoryID, SupplierID, ProductName, ProductImage, NetRetailPrice,
									AvailableQuantity, WholesalePrice, UnitKGWeight, Notes)
				VALUES(3, 4,'peanut butter', NULL, 3.79, 1000, 2.69, 0.75, 'caution: high calorie')

				SELECT	S.*
				FROM		Suppliers S
				WHERE	S.SupplierID = 4
	 */

	DECLARE	@supplierID INT, @supplierProductCount INT
	DECLARE	@supplierCountText NVARCHAR(1000)

	-- The "INSERTED" table has the CustomerID and OrderID
	-- values we'll need

	SELECT	@supplierID = supplierID FROM INSERTED

	-- Calculate the supplier product count, and convert
	-- the value to NVARCHAR

	SELECT	@supplierProductCount = COUNT(P.ProductID)
	FROM		Products P INNER JOIN Suppliers S ON
			P.SupplierID = S.SupplierID
	WHERE	S.SupplierID = @supplierID

	SET	@supplierCountText = CONCAT('This supplier (Supplier ', CAST(@supplierID AS NVARCHAR), ')')
	SET	@supplierCountText += CONCAT(' has ', CAST(@supplierProductCount AS NVARCHAR))
	SET	@supplierCountText += ' products available here at Packt as of '
	SET	@supplierCountText += CONVERT(VARCHAR, GETDATE(), 107)

	-- Update the Customers.BalanceNotes column for
	-- that specific @customerID

	UPDATE	Suppliers
	SET		Suppliers.Notes = @supplierCountText
	WHERE	SupplierID = @supplierID

END


--	MySQL:

USE packt_online_shop;

# drop trigger tr_Basic;

/*

	To test:	USE packt_online_shop;
	
			INSERT INTO Payments(OrderID, PaymentDate, PaymentType, PaymentRef, Amount, Notes, BalanceNotes)
			VALUES (1, '20140303', 'credit card', 'W26UA4', 7.10, 'payment received', NULL);

			SELECT * FROM CUSTOMERS;

 */

DELIMITER $$

CREATE TRIGGER tr_Basic AFTER INSERT ON Payments
	FOR EACH ROW
	BEGIN

	DECLARE customerID INT;
	SET customerID = (
					SELECT	O.CustomerID
					FROM		Orders O
					WHERE	O.OrderID = NEW.OrderID
				);

	UPDATE Customers

	SET		Customers.BalanceNotes = CONCAT('Customer ', CAST(customerID AS CHAR), ' just got updated again')
	WHERE	Customers.CustomerID = customerID;

	END$$

DELIMITER ;


USE packt_online_shop;

# drop trigger tr_OrderItems_OnInsert

DELIMITER $$

# Basic syntax to create the tr_OrderItems_OnInsert trigger
# to fire after every OrderItems table row insertion.

CREATE TRIGGER tr_OrderItems_OnInsert AFTER INSERT ON OrderItems
FOR EACH ROW
BEGIN

	/*

		To test:	INSERT INTO OrderItems(OrderID, ProductID, Quantity,
									UnitPrice, Discount, Notes)
				VALUES(1, 6, 12, 4.49, 0.00, NULL);

		SELECT	C.BalanceNotes
		FROM		Customers C
		WHERE	C.CustomerID = 2;
	 */

	# Assign the needed variable values, in order.
	# SELECT the values and assign then to the
	# variables with the SET command. For this,
	# place all SELECT statements in parentheses.

	DECLARE balanceNotesText VARCHAR(1000);
	DECLARE customerID INT;
	DECLARE orderBalance DECIMAL(10, 2);
	DECLARE orderIDVal INT;
	DECLARE paymentBalance DECIMAL(10, 2);
	DECLARE runningTotal DECIMAL(10, 2);

	# The "NEW" table has the CustomerID and OrderID values
	# from the new inserted row that we'll need.

	SET	orderIDVal = (
					SELECT NEW.orderID
				);

	SET	customerID = (
					SELECT	O.CustomerID
					FROM		Orders O
					WHERE	OrderID = orderIDVal
					);

	# Calculate the order balance for the customer

	SET	orderBalance = (
						SELECT	SUM(OI.Quantity * (OI.UnitPrice - OI.Discount))
						FROM		OrderItems OI INNER JOIN Orders O ON
								OI.OrderID = O.OrderID
						WHERE O.CustomerID = CustomerID
					);

	# Calculate the payment balance for the customer

	SET	paymentBalance = (
						SELECT	SUM(P.Amount)
						FROM		Payments P INNER JOIN Orders O ON
								P.OrderID = O.OrderID
						WHERE	O.CustomerID = CustomerID
					);

	# Calculate the running total, and convert the value to CHAR

	SET	runningTotal = (
						SELECT CAST((orderBalance - paymentBalance) AS CHAR)
					);

	# Build the balanceNotesText string

	SET	balanceNotesText = (
							SELECT CONCAT("Customer ", CAST(customerID AS CHAR))
						);

	SET	balanceNotesText = (
						SELECT CONCAT(balanceNotesText, " has a new running balance of $")
						);

	#
	# The NOW() function has the datestamp value we need;
	# use the CONVERT function to format the datestamp value
	#

	SET	balanceNotesText = (
						SELECT CONCAT(balanceNotesText, runningTotal, ' as of ')

						);

	SET	balanceNotesText = (
						SELECT CONCAT(balanceNotesText, DATE_FORMAT(NOW(), "%b %d, %Y"))
						);

	# Update the Customers.BalanceNotes column for that specific customerID

	UPDATE	Customers
	SET		Customers.BalanceNotes = balanceNotesText
	WHERE	Customers.CustomerID = customerID;

	END$$

DELIMITER ;


USE packt_online_shop;

# drop trigger tr_Payments_OnInsert

DELIMITER $$

#	Basic syntax to create the tr_Payments_OnInsert trigger
#	to fire after every payments table row insertion.

CREATE TRIGGER tr_Payments_OnInsert AFTER INSERT ON payments
FOR EACH ROW
BEGIN

	/*

		To test:	INSERT INTO Payments(OrderID, PaymentDate, PaymentType,
								PaymentRef, Amount, Notes, BalanceNotes)
				VALUES(1, NOW(), 'check', 'SDGH4A', 12.97, NULL, NULL);

		SELECT	C.BalanceNotes
		FROM		Customers C
		WHERE	C.CustomerID = 2;
	 */

	# Assign the needed variable values, in order.
	# SELECT the values and assign then to the
	# variables with the SET command. For this,
	# place all SELECT statements in parentheses.

	DECLARE balanceNotesText VARCHAR(1000);
	DECLARE customerID INT;
	DECLARE orderBalance DECIMAL(10, 2);
	DECLARE orderIDVal INT;
	DECLARE paymentBalance DECIMAL(10, 2);
	DECLARE runningTotal DECIMAL(10, 2);

	# The "NEW" table has the CustomerID and OrderID values
	# from the new inserted row that we'll need.

	SET orderIDVal = (
					SELECT	NEW.orderID
				);

	SET customerID = (
					SELECT	O.CustomerID
					FROM		Orders O
					WHERE	OrderID = orderIDVal
				);

	# Calculate the order balance for the customer

	SET	orderBalance = (
						SELECT	SUM(OI.Quantity * (OI.UnitPrice - OI.Discount))
						FROM		OrderItems OI INNER JOIN Orders O ON
								OI.OrderID = O.OrderID
						WHERE	O.CustomerID = CustomerID
					);

	# Calculate the payment balance for the customer

	SET paymentBalance = (
						SELECT	SUM(P.Amount)
						FROM		Payments P INNER JOIN Orders O ON
								P.OrderID = O.OrderID
						WHERE	O.CustomerID = CustomerID

					);

	# Calculate the running total, and convert the value to CHAR

	SET	runningTotal = (
						SELECT CAST((orderBalance - paymentBalance) AS CHAR)
					);

	# Build the balanceNotesText string

	SET	balanceNotesText = (
						SELECT CONCAT("Customer ", CAST(customerID AS CHAR))
						);

	SET	balanceNotesText = (
						SELECT CONCAT(balanceNotesText, " has a new running balance of $")
						);

	#
	# The NOW() function has the datestamp value we need;
	# use the CONVERT function to format the datestamp value
	#

	SET balanceNotesText = (
						SELECT CONCAT(balanceNotesText, runningTotal, ' as of ')
						);

	SET balanceNotesText = (
						SELECT CONCAT(balanceNotesText, DATE_FORMAT(NOW(), "%b %d, %Y"))
						);

	# Update the Customers.BalanceNotes column for that specific customerID

	UPDATE	Customers
	SET		Customers.BalanceNotes = balanceNotesText
	WHERE	Customers.CustomerID = customerID;

	END$$

DELIMITER ;


/****** EXERCISE 7 ******/

--	MySQL:

USE packt_online_shop;

# drop trigger tr_Products_OnInsert

DELIMITER $$

# Basic syntax to create the tr_Products_OnInsert trigger
# to fire after every OrderItems table row insertion.

CREATE TRIGGER tr_Products_OnInsert AFTER INSERT ON Products
FOR EACH ROW
BEGIN

	/*

		To test:	INSERT INTO Products(ProductCategoryID, SupplierID,
								ProductName, ProductImage, NetRetailPrice,
								AvailableQuantity, WholesalePrice,
								UnitKGWeight, Notes)
				VALUES(3, 3, 'peanut butter', NULL, 3.79, 1000, 2.69,
						0.75, 'caution: high calorie');

				SELECT P.*
				FROM Products P
				WHERE P.SupplierID = 3;

	*/

	DECLARE supplierID INT;
	DECLARE supplierProductCount INT;
	DECLARE supplierCountText VARCHAR(1000);

	# The "NEW" table has the SupplierID
	# value we'll need

	SET	supplierID = (
					SELECT NEW.supplierID
				);

	# Calculate the supplier product count,
	# and convert the value to TEXT

	SET supplierProductCount = (
							SELECT	COUNT(P.ProductID)
							FROM		Products P INNER JOIN Suppliers S ON
									P.SupplierID = S.SupplierID
							WHERE	S.SupplierID = supplierID
						);

	SET	supplierCountText = (
							SELECT CONCAT("This supplier (Supplier ", CAST(supplierID AS CHAR), ")")
						);

	SET	supplierCountText = (
							SELECT CONCAT(supplierCountText, " has ", CAST(supplierProductCount AS CHAR))
						);

	SET supplierCountText = (
							SELECT CONCAT(supplierCountText, " products available here at Packt as of ")
						);

	SET supplierCountText = (
							SELECT CONCAT(supplierCountText, DATE_FORMAT(NOW(), "%b %d, %Y"))
						);

	# Update the Customers.BalanceNotes column
	# for that specific customerID

	UPDATE	Suppliers
	SET		Suppliers.Notes = supplierCountText
	WHERE	Suppliers.SupplierID = supplierID;

	END$$

DELIMITER ;
