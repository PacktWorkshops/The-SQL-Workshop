SELECT Orders.OrderNumber, Orders.OrderStatus, Orders.OrderDate, 
  Customers.FirstName, Customers.LastName, Customers.Email
FROM Orders JOIN Customers ON Orders.CustomerID = Customers.CustomerID;
