USE PACKT_ONLINE_SHOP;

INSERT INTO Products ( ProductCategoryID, SupplierID, 
  ProductName, ProductImage, NetRetailPrice, AvailableQuantity,
  WholesalePrice, UnitKGWeight, Notes )

VALUES
(4, 1, 'Helios 5', NULL, 24999.99, 22, 17999.99, 15,
  'helium airship'),
(4, 1, 'Arctan Pi', NULL, 84999.99, 3, 77999.99, 2,
  'high-lift freight dirigible'),
(4, 1, 'Fermat Radian', NULL, 199999.95, 18, 185999.99,
  17.4, 'passenger airship'),
(2, 4, 'Hammer', NULL, 39.95, 19, 33.49, 0.5,
  'basic hammer'),
(2, 4, 'Dishwasher Airgap', NULL, 14.95, 34, 10.89, 0.45,
  'countertop airgap'),
(2, 4, 'Flathead Screwdriver', NULL, 7.49, 208, 5.19, 0.15,
  'regular screwdriver'),
(2, 4, 'Phillips Screwdriver', NULL, 7.29, 155, 5.49, 0.15,
  'phillips-head screwdriver'),
(2, 4, 'Pliers', NULL, 19.95, 44, 15.23, 0.45, 'pliers'),
(6, 4, 'Wealth of Nations', NULL, 24.95, 144, 19.49, 0.65,
  'Great economics book');
