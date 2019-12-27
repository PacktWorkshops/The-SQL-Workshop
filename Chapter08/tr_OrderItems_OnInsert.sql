USE packt_online_shop;

#	drop trigger tr_OrderItems_OnInsert
 
DELIMITER $$

#	Basic syntax to create the tr_OrderItems_OnInsert trigger
#	to fire after every OrderItems table row insertion.

CREATE TRIGGER tr_OrderItems_OnInsert AFTER INSERT ON OrderItems
	FOR EACH ROW
	BEGIN

		/*
			To test:	INSERT INTO	OrderItems(OrderID, ProductID, Quantity,
							UnitPrice, Discount, Notes)
					VALUES(1, 6, 12, 4.49, 0.00, NULL);

					SELECT	C.BalanceNotes
					FROM	Customers C
					WHERE	C.CustomerID = 2;
		*/
	
	#	Assign the needed variable values, in order.
	#	SELECT the values and assign then to the
	#	variables with the SET command. For this,
	#	place all SELECT statements in parentheses.
	
		DECLARE balanceNotesText VARCHAR(1000);
		DECLARE customerID INT;
		DECLARE orderBalance DECIMAL(10, 2);
		DECLARE orderIDVal INT;
		DECLARE paymentBalance DECIMAL(10, 2);
		DECLARE runningTotal VARCHAR(50);

	#	The "NEW" table has the CustomerID and OrderID values
	#	from the new inserted row that we'll need.

		SET	orderIDVal = (
			SELECT NEW.orderID
		);

		SET	customerID = (
						SELECT	O.CustomerID
						FROM	Orders O
						WHERE	OrderID = orderIDVal
				);

	#	Calculate the order balance for the customer

		SET	orderBalance = (
						SELECT	SUM(OI.Quantity * (OI.UnitPrice - OI.Discount))
						FROM	OrderItems OI INNER JOIN Orders O ON 
							OI.OrderID = O.OrderID
						WHERE	O.CustomerID = CustomerID
					);

	#	Calculate the payment balance for the customer

		SET	paymentBalance = (
						SELECT	SUM(P.Amount)
						FROM	Payments P INNER JOIN Orders O ON
							P.OrderID = O.OrderID
						WHERE	O.CustomerID = CustomerID
		);

	#	Calculate the running total, and convert the value to CHAR

		SET	runningTotal = (
						SELECT	CAST((orderBalance - paymentBalance) AS CHAR)
					);

	#	Build the balanceNotesText string

		SET	balanceNotesText = (
						SELECT CONCAT("Customer ", CAST(customerID AS CHAR))
					);
		
		SET	balanceNotesText = (
						SELECT CONCAT(balanceNotesText, " has a new running balance of $")
					);

	#
	#	The NOW() function has the datestamp value we need;
	#	use the CONVERT function to format the datestamp value
	#

		SET	balanceNotesText = (
						SELECT CONCAT(balanceNotesText, runningTotal, ' as of ')
					);
	
		SET	balanceNotesText = (
						SELECT CONCAT(balanceNotesText, DATE_FORMAT(NOW(), "%b %d, %Y"))
		);

	#	Update the Customers.BalanceNotes column for that specific customerID
	
		UPDATE	Customers
		SET	Customers.BalanceNotes = balanceNotesText
		WHERE	Customers.CustomerID = customerID;

	END$$

DELIMITER ;
