create table Customers1
(
	FirstName varchar(50) ,
	MiddleName varchar(50) ,
	LastName varchar(50) ,
	HomeAddress varchar(250) ,
	Email varchar(200) ,
	Phone varchar(50) ,
	Notes varchar(250)
);
INSERT INTO Customers1 ( FirstName, MiddleName, LastName, HomeAddress, Email, Phone, Notes )
VALUES('Joe', 'Greg', 'Smith', '2356 Elm St.', 'joesmith@sfghwert.com', '(310) 555-1212', 'Always gets products home delivered'),
('Grace', 'Murray', 'Hopper', '123 Compilation Street', 'gmhopper@ftyuw46.com', '(818) 555-3678', 'Compiler pioneer'),
('Ada', NULL, 'Lovelace', '22 Algorithm Way', 'adalovelace@fgjw54af.gov', '(717) 555-3457', 'First software engineer'),
('Joseph', 'Force', 'Crater', '1313 Mockingbird Lane', 'judgecrater@ev56gfwrty.com', '(212) 555-5678', 'Works everyday'),
('Jacqueline', 'Jackie', 'Cochran', '1701 Flightspeed Avenue', 'jackiecochrane@jryuwp8qe4w.gov', '(717) 555-3457', 'Researcher'),
(NULL, 'Paul', 'Jones', '126 Bonhomme Richard Ave.', 'jpjones@bonhommerichard.edu', '(216) 555-6232', 'Admiral'), 
('Grace', 'NULL', 'Park', '5 Hollywood', 'gpark@ftyuw46.gov', '(310) 666-3678', 'Actor'), 
('Stephen', 'William', 'Hawking', '4 Cambridge', 'stephenh@cambridge.gov', '(454) 4444-9900', 'Professor of Mathematics'),
('Stephen', 'NULL', 'Hillenburg ', '100 LA', 'shillenburg@la.gov', '(454) 4433-9000', 'Director');
