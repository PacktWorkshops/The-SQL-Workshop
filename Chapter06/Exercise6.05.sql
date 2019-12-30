SELECT CONCAT(Customers.FirstName,' ',Customers.LastName) as 'FULL NAME',
        Customers.Phone AS 'Phone Number'
    FROM Customers
    UNION 
    SELECT    Suppliers.ContactPerson AS 'Full Name',
              Suppliers.PhoneNumber AS 'Phone Number'
    FROM Suppliers
