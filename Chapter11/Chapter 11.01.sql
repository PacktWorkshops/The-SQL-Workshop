USE packt_online_shop;

SELECT    OrderID, LTRIM(RTRIM(CONCAT(CAST(Quantity AS CHAR), ' Ordered: ', UPPER(Notes))))
          AS 'ITEM_QUANTITY_ORDERED_AND_NOTES'

FROM OrderItems;
