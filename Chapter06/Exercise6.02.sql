SELECT Customers.FirstName,
Customers.LastName,
Customers.Email , 
Orders.OrderNumber,
Orders.OrderStatus

FROM Orders RIGHT JOIN Customers ON Orders.CustomerID = Customers.CustomerID

SELECT Customers.FirstName,
Customers.LastName,
Customers.Email , 
Orders.OrderNumber,
Orders.OrderStatus

FROM Orders RIGHT JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE Orders.OrderNumber IS NULL

