USE PACKT_ONLINE_SHOP;

SELECT    CONCAT(COALESCE(FirstName, ' '), ' ',
          COALESCE(MiddleName, 'SUBSTITUTE MIDDLE NAME'), ' ',
          COALESCE(LastName, ' ')) as 'CombinedName'

FROM      customers;
