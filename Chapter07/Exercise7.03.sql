USE     PACKT_ONLINE_SHOP;
CREATE VIEW PACKT_VIEW_1
AS
SELECT  customers.CustomerID, orders.OrderDate,
        products.ProductID, products.ProductName,
        orderitems.Quantity * orderitems.UnitPrice AS
        'PerProductSpending'
FROM    customers INNER JOIN orders ON
          customers.CustomerID = orders.CustomerID
        INNER JOIN orderitems ON
          orders.OrderID = orderitems.OrderID
        INNER JOIN products ON
          orderitems.ProductID = products.ProductID;


USE     PACKT_ONLINE_SHOP;

SELECT  CustomerID, OrderDate, ProductID, ProductName,
        PerProductSpending
FROM    PACKT_VIEW_1
WHERE   PerProductSpending > 14.99;
