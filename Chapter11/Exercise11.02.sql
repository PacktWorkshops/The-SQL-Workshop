CREATE PROCEDURE spFilterCustomers
(emailString    VARCHAR(100))
SELECT    C.CustomerID, C.FirstName, C.LastName, C.Address,
          C.Email, C.Phone, C.Notes, C.BalanceNotes
FROM      Customers C
WHERE     C.email LIKE CONCAT('%', emailString, '%');
CALL spFilterCustomers('.edu')
