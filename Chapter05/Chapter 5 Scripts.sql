/*The WHERE Clause Syntax*/
USE studentdemo; 
SELECT *
FROM Student;

SELECT *
FROM Student
WHERE course = 'Electronics';

/* Exercise 5.01: Implementing Logical Operators in the WHERE Clause */

USE PACKT_ONLINE_SHOP;
SELECT ProductName AS 'High-value Products', NetRetailPrice
FROM Products
WHERE NetRetailPrice > 14.99

USE PACKT_ONLINE_SHOP;
SELECT  ProductName AS [High-value Products], NetRetailPrice
FROM Products
WHERE NetRetailPrice >= 14.99

/*Exercise 5.02: Using the BETWEEN Operator*/
SELECT ProductName,NetRetailPrice
FROM Products
WHERE NetRetailPrice BETWEEN 14.99 AND 50 
ORDER BY NetRetailPrice;

/* Exercise 5.03: Using the != and <> Operators */

SELECT ProductName,NetRetailPrice
FROM Products
WHERE ProductName != 'tomato sauce'
ORDER BY NetRetailPrice;

SELECT ProductName,NetRetailPrice
FROM Products
WHERE ProductName <> 'tomato sauce'
ORDER BY NetRetailPrice;

/*The LIKE Operator*/

SELECT FirstName, LastName, Phone 
FROM Customers
WHERE FirstName LIKE '_o%';

/*Exercise 5.04: Using the LIKE Operator to Check a Pattern at the Beginning of a String8/

SELECT FirstName AS 'Customers from LA', Phone 
FROM Customers
WHERE Phone LIKE '(310)%';

/*Exercise 5.05: Using the LIKE Operator to Check for a Specified Length*/

SELECT FirstName, LastName, Phone 
FROM Customers
WHERE FirstName LIKE '___';

/*Exercise 5.06: Searching for NULL Values*/

SELECT MiddleName, LastName, Phone 
FROM Customers
WHERE FirstName IS NULL;

/*Exercise 5.07: Querying Multiple Conditions*/

SELECT *
FROM Customers
WHERE FirstName = 'Joe' AND Phone LIKE '(310)%';

SELECT FirstName, LastName, Phone
FROM Customers
WHERE FirstName = 'Joe' OR Phone LIKE '(310)%'; 

SELECT FirstName, LastName, Phone,Notes
FROM Customers
WHERE FirstName LIKE 'Jo%' AND (Phone LIKE '(310)%' OR Phone LIKE '(210)%') AND NOT LastName = 'Carter';

