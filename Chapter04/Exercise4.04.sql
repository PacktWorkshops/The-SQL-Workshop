SELECT ProductID, Quantity, UnitPrice, (Quantity*UnitPrice) AS 'Line Item Total'
FROM OrderItems;
