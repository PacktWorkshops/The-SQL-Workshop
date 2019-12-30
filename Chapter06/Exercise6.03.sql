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
