USE       packt_online_shop;

SELECT    O.OrderID
FROM      Orders O
WHERE     O.OrderID NOT IN (SELECT OrderID FROM ORDERITEMS)
ORDER BY  O.OrderID;
