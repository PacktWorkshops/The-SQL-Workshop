USE packt_online_shop;

SELECT ProductName, NetRetailPrice, UnitKGWeight,
    CASE
        WHEN (NetRetailPrice * UnitKGWeight) <= 1.0 THEN 'Cheap'
        WHEN (NetRetailPrice * UnitKGWeight) > 1.0 AND(NetRetailPrice * 
              UnitKGWeight) <= 35.00 THEN 'Mid-price'
        WHEN (NetRetailPrice * UnitKGWeight) > 35.00 AND 
             (NetRetailPrice * UnitKGWeight) <= 100.00 THEN 'Expensive'
        ELSE 'Very Expensive'
    END AS 'Shipping Cost'
FROM products;
