/*Exercise 6.01 Implementing Inner Join */
SELECT Orders.OrderNumber, Orders.OrderStatus, Orders.OrderDate, Customers.FirstName, Customers.LastName, Customers.Email
FROM Orders JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

/* Exercise 6.02: Implementing RIGHT JOIN*/

SELECT Customers.FirstName,
Customers.LastName,
Customers.Email , 
Orders.OrderNumber,
Orders.OrderStatus

FROM Orders RIGHT JOIN Customers ON Orders.CustomerID = Customers.CustomerID

/*Exercise 6.03: Implementing LEFT JOIN*/
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

/*Exercise 6.04: Implementing FULL JOIN*/
SELECT    Orders.OrderNumber,
         Orders.OrderStatus,
         Customers.FirstName, 
         Customers.LastName

FROM Orders FULL JOIN Customers ON Orders.CustomerID = Customers.CustomerID

/* Exercise 6.05: Implementing CROSS JOINS */
Create table Facecards (cardvalue varchar (50)); 
insert into Facecards (cardvalue) values ('King');
insert into Facecards (cardvalue) values ('Queen');
insert into Facecards (cardvalue) values ('Jack');
insert into Facecards (cardvalue) values ('Ace');
					   
Create table CardSuit (suit varchar(50));
insert into CardSuit (suit) values ('Heart');
insert into CardSuit (suit) values ('Spade');
insert into CardSuit (suit) values ('Clubs');
insert into CardSuit (suit) values ('Diamond');
				   
SELECT Facecards.cardvalue,
       CardSuit.suit

FROM Facecards CROSS JOIN CardSuit;
				    
/*Exercise 6.06: Implementing a UNION JOIN*/
SELECT CONCAT(Customers.FirstName,' ',Customers.LastName) as 'FULL NAME',
        Customers.Phone AS 'Phone Number'
    FROM Customers
    UNION 
    SELECT    Suppliers.ContactPerson AS'Full Name',
              Suppliers.PhoneNumber AS 'Phone Number'
    FROM Suppliers
				    
				    
