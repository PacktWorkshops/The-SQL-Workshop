SELECT ProductID, Quantity, UnitPrice, (Quantity*UnitPrice) AS 'Line Item Total', Discount, ((Quantity*UnitPrice)-(Quantity*Discount)) AS 'Price After Discount' 
FROM OrderItems;
