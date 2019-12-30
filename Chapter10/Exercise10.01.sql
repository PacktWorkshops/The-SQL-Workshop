SELECT    O.OrderID, C.LastName,
          MIN(OI.UnitPrice) AS 'PRICE OF LOWEST PRICED PRODUCT OF
          THE ORDER',
          MAX(OI.UnitPrice) AS 'PRICE OF HIGHEST PRICED PRODUCT 
          OF THE ORDER'
FROM      Customers C INNER JOIN Orders O ON
          C.CustomerID = O.CustomerID
          INNER JOIN OrderItems OI ON
          O.OrderID = OI.OrderID
GROUP BY  C.LastName, O.OrderID; 
