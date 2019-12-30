SELECT    PC.ProductCategoryName,
          SUM(P.AvailableQuantity) AS 'TOTAL COUNT OF ALL
          PRODUCTS IN PRODUCT CATEGORY'
FROM      Products P INNER JOIN ProductCategories PC ON
          P.ProductCategoryID = PC.ProductCategoryID
GROUP BY  PC.ProductCategoryName
HAVING    SUM(P.AvailableQuantity) > 250
ORDER BY  ProductCategoryName; 
