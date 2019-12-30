USE        packt_online_shop;
 
SELECT     S.SupplierID, S.SupplierName,
           COUNT(P.ProductID) AS 'PRODUCT COUNT OF SUPPLIER',
           RANK () OVER (
               ORDER BY COUNT(P.ProductID) DESC
           ) AS 'SUPPLIER RANK',
           DENSE_RANK () OVER (
               ORDER BY COUNT(P.ProductID) DESC
           ) AS 'SUPPLIER DENSE_RANK'
FROM       Suppliers S INNER JOIN
           Products P ON S.SupplierID = P.SupplierID
GROUP BY   S.SupplierID, S.SupplierName;
