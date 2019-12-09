/* Activity 1.01: Inserting Values into the Products Table in the PACKT_ONLINE_SHOP Database */
/* 1.	Create the Products table with the same column names that were provided in the Excel spreadsheet: */
CREATE TABLE Products
(
	ProductID INT NOT NULL AUTO_INCREMENT,
	ProductCategoryID INT NOT NULL,
	SupplierID INT NOT NULL,
	ProductName CHAR(50) NOT NULL,
	NetRetailPrice DECIMAL(10, 2) NULL,
	AvailableQuantity INT NOT NULL,
	WholesalePrice DECIMAL(10, 2) NOT NULL,
	UnitKGWeight DECIMAL(10, 5) NULL,
	Notes VARCHAR(750) NULL,
    PRIMARY KEY (ProductID)
);
/* 2.	Enter the values into the Products table: */
INSERT INTO Products ( ProductCategoryID, SupplierID, ProductName, NetRetailPrice, AvailableQuantity, WholesalePrice, UnitKGWeight, Notes )
VALUES
(5, 2, 'Calculatre', 24.99, 100, 17.99, 1, 'calculation application'),
(5, 5, 'Penwrite', 79.99, 27, 49.99, 2, 'word processing product'),
(1, 6, 'Vortex Generator', 2499.99, 1000, 1999.99, 0.01, 'space engine component'),
(1, 6, 'The Gourmet Crockpot', 24.99, 72, 19.99, 1.63, 'cookbook'),
(1, 6, 'Account Books', 14.99, 26, 9.99, 1.22, 'government accounting book'),
(3, 6, 'habanero peppers', 4.49, 189, 2.99, 0.009, 'hot peppers'),
(2, 1, '10-mm socket wrench', 3.49, 39, 1.89, 0.018, 'important tool'),
(3, 4, 'tomato sauce', 1.19, 1509, 0.89, 0.232, 'bottled in glass'),
(1, 6, 'pure vanilla', 10.39, 1509, 7.89, 0.032, 'high-quality vanilla'),
(3, 2, 'keyboard wrench', 399999.95, 6128, 149999.99, 521.38, 'handle with care'),
(2, 1, 'power cell', 47.89, 2346, 29.99, 0.298, 'ten amp-hours per cell');
