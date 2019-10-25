/****** Introduction To SQL Chapter EIGHT  Scripts ******/

/****** INNER JOINS ******/

SELECT Orders.OrderNumber, Orders.OrderStatus, Orders.OrderDate, Customers.FirstName,Customers.LastName,Customers.Email

FROM Orders JOIN Customers ON Orders.CustomerID = Customers.CustomerID



SELECT Orders.OrderNumber,
OrderItems.UnitPrice,
OrderItems.Quantity,
Products.ProductName
FROM Orders JOIN OrderItems ON Orders.OrderID = OrderItems.OrderID 
	     JOIN Products ON OrderItems.ProductID = Products.ProductID


/****** SELF JOINS ******/

SELECT 
R2.REGION AS [Region],
R1.REGION AS [Parent]
 
 FROM Regions R1 join Regions R2 ON R1.ID = R2.PARENT 

 /****** RIGHT JOINS ******/

 SELECT Customers.FirstName,
Customers.LastName,
Customers.Email , 
Orders.OrderNumber,
Orders.OrderStatus

FROM Orders RIGHT JOIN Customers ON Orders.CustomerID = Customers.CustomerID



 /****** LEFT JOINS ******/

 SELECT   Orders.OrderNumber,
		 Orders.OrderStatus,
		 Payments.PaymentRef,
		 Payments.PaymentType

FROM Payments LEFT JOIN Orders ON Payments.OrderID = Orders.OrderID

SELECT   Orders.OrderNumber,
		 Orders.OrderStatus,
		 Payments.PaymentRef,
		 Payments.PaymentType

FROM Orders LEFT JOIN Payments ON Payments.OrderID = Orders.OrderID



 /****** FULL JOINS ******/

 SELECT   	 Orders.OrderNumber,
		 Orders.OrderStatus,
		 Customers.FirstName, 
		 Customers.LastName
		
FROM Orders FULL JOIN Customers ON Orders.CustomerID = Customers.CustomerID


 /****** CROSS JOINS ******/

 SELECT Products.ProductName,
       ProductCategories.ProductCategoryName

FROM Products  CROSS JOIN ProductCategories
ORDER BY ProductName


 /****** UNION ******/


 SELECT CONCAT(Customers.FirstName,' ',Customers.LastName) as [FULL NAME],
		Customers.Phone AS [Phone Number]
	FROM Customers
	UNION 
	SELECT    Suppliers.ContactPerson AS[Full Name],
		   Suppliers.PhoneNumber AS[Phone Number]
	FROM Suppliers


	
 /****** ACTIVITY 1 SOLUTION  ******/


SELECT Orders.OrderNumber,
	   Products.ProductName,
	   CONCAT( Customers.FirstName,' ',Customers.LastName) As [Customer Name],
	   Suppliers.SupplierName,
	   ProductCategories.ProductCategoryName

from OrderItems join Orders on OrderItems.OrderID = Orders.OrderID
				join Products on OrderItems.ProductID = products.ProductID
				join Customers on Orders.CustomerID = Customers.CustomerID
				join Suppliers on Products.SupplierID = Suppliers.SupplierID
				join ProductCategories on Products.ProductCategoryID = ProductCategories.ProductCategoryID

 /****** ACTIVITY 2 SOLUTION  ******/
 
 select distinct Suppliers.SupplierName 
 from OrderItems left join Products on OrderItems.ProductID = Products.ProductID
				 left join Suppliers on Products.SupplierID = Suppliers.SupplierID	
 
 /****** ACTIVITY 3 SOLUTION  ******/


 select distinct Suppliers.ContactPerson AS [Name],'Supplier' AS [Type]
 from OrderItems left join Products on OrderItems.ProductID = Products.ProductID
				 left join Suppliers on Products.SupplierID = Suppliers.SupplierID	
union 
select distinct CONCAT(Customers.FirstName,' ',Customers.LastName) as [Name], 'Customer' as [Type]
from OrderItems join Orders on OrderItems.OrderID = Orders.OrderID
join Customers  on orders.CustomerID = Customers.CustomerID