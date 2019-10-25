USE [PACKT_ONLINE_SHOP]
GO

INSERT INTO Customers ( FirstName, MiddleName, LastName, [Address], Email, Phone, Notes )
VALUES
('Joe', 'Greg', 'Smith', '2356 Elm St.', 'joesmith@sfghwert.com', '(310) 555-1212', 'A note'),
('Grace', 'Murray', 'Hopper', '123 Compilation Street', 'gmhopper@ftyuw46.com', '(818) 555-3678', 'Compiler pioneer'),
('Ada', NULL, 'Lovelace', '22 Algorithm Way', 'adalovelace@fgjw54af.gov', '(717) 555-3457', 'First software engineer'),
('Joseph', 'Force', 'Crater', '1313 Mockingbird Lane', 'judgecrater@ev56gfwrty.com', '(212) 555-5678', 'Might undisappear any minute . . .'),
('Jacqueline', 'Jackie', 'Cochran', '1701 Flightspeed Avenue', 'jackiecochrane@jryuwp8qe4w.gov', '(717) 555-3457', 'Research aviator'),
('William', NULL, 'Shakespeare', '456 Old Globe', 'wshakespeare@dyuioety4.gov', '(213) 555-3421', 'Playwright'),
('Nellie', NULL, 'Bly', '614 Printing Press Way', 'nellie@fthw45asdgf.com', '(213) 555-8523', 'Investigative Journalist'),
('Yuri', 'Alekseyevich', 'Gagarin', '1 Ad Astra', 'yuri@rheysdagf.edu', '(310) 555-5462', 'First human to space'),
(NULL, 'Paul', 'Jones', '126 Bonhomme Richard Ave.', 'jpjones@bonhommerichard.edu', '(216) 555-6232', 'Admiral'),
(NULL, 'Al', 'Smith', '1818 Eratosthenes Blvd.', 'alsmith@dytsdrg.edu', '(345) 555-5434', 'Writer'),
(NULL, NULL, 'Pythagoras', '32 Hypotenuse Way', 'pythagoras@sdrg.edu', '(260) 555-3461', 'Mathematician'),
(NULL, NULL, 'Bleriot', '55 Rue Montgolfier', 'bleriot@wtrasf.gov', '(818) 555-3562', 'Pilot'),
('Aristotle', NULL, NULL, '32 Parthenon Way', 'aristotle@ertyasdf.edu', '(310) 555-9182', 'Scholar'),
('Cicero', NULL, NULL, '25 Appian Way', 'Cicero@ghyu45y.edu', '(310) 555-0822', 'Orator'),
('Srinivasa', NULL, 'Ramanujan', '123 Bernoulli Number Drive', 'srinivasa@imaginarynumber.edu', '(211) 555-1111', 'Sharp Mathematician'),
('Orville', NULL, 'Wright', '80 Bicycle Lane', 'owright@sdg98.edu', '(211) 555-4444', 'First pilot')


INSERT INTO Suppliers ( SupplierName, Country, [Address], PhoneNumber, ContactPerson, Notes )
VALUES
('Acme Systems', 'Switzerland', '123 Capital Drive', '(818) 555-3456', 'Smith Johns', 'spaceship company'),
('Amalgamated Software', 'Antarctica', '771 South Pole Ave.', '(415) 555-2347', 'Smith Johns', 'software company'),
('AWT', 'USA', '123 Rockefeller Drive', '(212) 555-3783', 'Trippe Juan', 'airline'),
('Consolidated Products', 'Canada', '771 Winnipeg Way', '(109) 555-4721', 'Allen Wight', 'food and aluminum company'),
('CHOAM', 'Atlantis', '123 Atlantean Way', '(213) 555-7567', 'Horace Greeley', 'transport services company'),
('Sliderule Computers', 'USA', '22 Prediction Ave.', '(310) 555-3456', 'Adam Osborne', 'Computer company')


INSERT INTO ProductCategories ( ProductCategoryName, Notes )
VALUES
('condiments', 'melange, spices of all types and flavorings' ),
('tools', 'automotive, aviation, medical, and software repair / maintenance devices ' ),
('food', 'food products for humans and non-humans' ),
('airships', 'lighter-than-air aircraft' ),
('software', 'program products for execution on / by computers' ),
('books', 'bound, multi-page printed material' ),
('horse-drawn carriages', 'wheeled vehicles pulled by plant-eating non-human animals')

INSERT INTO Products ( ProductCategoryID, SupplierID, ProductName, ProductImage, NetRetailPrice, AvailableQuantity, WholesalePrice, UnitKGWeight, Notes )
VALUES
(5, 2, 'Calculatre', NULL, $24.99, 100, $17.99, 1, 'calculation application'),
(5, 5, 'Penwrite', NULL, $79.99, 27, $49.99, 2, 'word processing product'),
(1, 6, 'Vortex Generator', NULL, $2499.99, 1000, $1999.99, 0.01, 'space engine component'),
(1, 6, 'The Gourmet Crockpot', NULL, $24.99, 72, $19.99, 1.63, 'cookbook'),
(1, 6, 'Government Accounting', NULL, $14.99, 26, $9.99, 1.22, 'government accounting book'),
(3, 6, 'habanero peppers', NULL, $4.49, 189, $2.99, 0.009, 'hot peppers'),
(2, 1, '10-mm socket wrench', NULL, $3.49, 39, $1.89, 0.018, 'important tool'),
(3, 4, 'tomato sauce', NULL, $1.19, 1509, $0.89, 0.232, 'bottled in glass'),
(1, 6, 'pure vanilla', NULL, $10.39, 1509, $7.89, 0.032, 'high-quality vanilla'),
(3, 2, 'keyboard wrench', NULL, $399999.95, 6128, $149999.99, 521.38, 'handle with care'),
(2, 1, 'power cell', NULL, $47.89, 2346, $29.99, 0.298, 'ten amp-hours per cell')

INSERT INTO Orders ( CustomerID, OrderNumber, OrderDate, ShipmentDate, OrderStatus, Notes )
VALUES
(2, 'ABC123', '20170302', '20170212', 'shipped', 'shipped on time'),
(3, 'BCQ857', '23170307', '23170308', 'pending', 'for appropriate products, fully charge all power cells before packing'),
(4, 'RST321', '19300419', '19330522', 'returned', 'customer disappeared'),
(6, 'YQW672', '20091201', '20100117', 'shipped', 'repeat customer'),
(7, 'DTR321', '29300419', '29330522', 'shipped', 'customer requested freight forwarding'),
(3, 'BCQ858', '23170318', '23170329', 'shipped', 'customer prefers open-source software')

INSERT INTO OrderItems ( OrderID, ProductID, Quantity, UnitPrice, Discount, Notes )
VALUES
(1, 1, 2, $24.99, $0.00, 'handle with care'),
(1, 2, 1, $79.99, $2.38, 'keep away from magnetic fields'),
(1, 3, 2, $2499.99, $191.17, 'avoid exposure to light'),
(2, 5, 1, $14.99, $0.00, 'open source software'),
(2, 7, 1, $3.49, $0.91, 'exceedingly rare'),
(3, 11, 4, $47.89, $0.88, 'high-demand product'),
(3, 10, 7, $399999.95, $24999.95, 'high gravity'),
(5, 2, 2, $79.99, $2.17, 'customer transitioning from slide rules to software'),
(5, 6, 1, $4.49, $0.00, 'heavy Scoville Units'),
(5, 5, 1, $14.99, $1.89, 'financial planning'),
(6, 10, 2, $399999.95, $25000.00, 'aircraft construction'),
(6, 7, 1, $3.49, $0.00, 'Test for magnetism before use')

INSERT INTO Payments ( OrderID, PaymentDate, PaymentType, PaymentRef, Amount, Notes )
VALUES
(1, '20170221', 'credit card', 'W2GHA4', $100.00, 'payment received' ),
(1, '20170301', 'credit card', 'I3G2V7', $75.00, 'payment received' ),
(2, '20100105', 'check', 'SRT2Z7', $83.50, 'partial payment'),
(2, '20100222', 'cash', 'DET281', $12.79, 'partial payment')