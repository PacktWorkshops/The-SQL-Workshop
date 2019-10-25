/****** Introduction To SQL Chapter SIX  Scripts ******/

/****** WHERE CLAUSE SYNTAX ******/

SELECT ProductName,NetRetailPrice
FROM Products
ORDER BY NetRetailPrice 


SELECT ProductName,NetRetailPrice
FROM Products
WHERE NetRetailPrice > 14.99
ORDER BY NetRetailPrice



SELECT ProductName,NetRetailPrice
FROM Products
WHERE NetRetailPrice >= 14.99
ORDER BY NetRetailPrice


SELECT ProductName,NetRetailPrice
FROM Products
WHERE NetRetailPrice BETWEEN 14.99 AND 50 
ORDER BY NetRetailPrice



SELECT ProductName,NetRetailPrice
FROM Products
WHERE NetRetailPrice != 24.99
ORDER BY NetRetailPrice


SELECT ProductName,NetRetailPrice  
FROM Products
WHERE NetRetailPrice <> 24.99
ORDER BY NetRetailPrice



 /****** USING LIKE OPERATOR ******/

 SELECT FirstName, LastName, Phone 
FROM Customers
WHERE FirstName LIKE 'J%'


SELECT FirstName, LastName, Phone 
FROM Customers
WHERE FirstName LIKE '_o%'


SELECT FirstName, LastName, Phone 
FROM Customers
WHERE FirstName LIKE '___'

 /****** HANDLING NULLS ******/

 SELECT FirstName, LastName, Phone, Notes
FROM Customers
WHERE Notes IS NULL 


SELECT FirstName, LastName, Phone, Notes
FROM Customers
WHERE Notes IS NOT NULL 

 /******  Combining Conditions with “AND”, “OR” and “Not” operators  ******/

 SELECT FirstName, LastName, Phone
FROM Customers
WHERE FirstName = 'Joe' AND Phone LIKE '(310)%' 


SELECT FirstName, LastName, Phone
FROM Customers
WHERE FirstName = 'Joe' OR Phone LIKE '(310)%' 


SELECT FirstName, LastName, Phone,Notes
FROM Customers
WHERE FirstName LIKE 'Jo%' AND (Phone LIKE '(310)%' OR Phone LIKE'(210)%') AND NOT LastName = 'Carter'


 /******  ACTIVITY SOLUTION  ******/
 

SELECT	ProductName AS[Product Name],
		NetRetailPrice AS [Product Retail Price],
		AvailableQuantity AS[Available Quantity]
From products 
WHERE NetRetailPrice <= 24.99 AND
	  AvailableQuantity >=38 AND
	  NOT ProductName LIKE '10%' 
