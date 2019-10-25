Example 1:

--To create a database, all you do is send the CREATE DATABASE command along with the name you wish your database

CREATE DATABASE PACKT_ONLINE_SHOP; 

Example 2:

--To create the database conditionally. If the database already exists, we will drop the existing database and create a new one. Else, we will simply create a new database. 

CREATE DATABASE IF NOT EXISTS PACKT_ONLINE_SHOP; 

Exmaple 3:

--To check configuration information of the newly created database can be found by running 

mysql –help 

Example 4:

--To review the created database command by running the SHOW CREATE DATABASE command: 

mysql> SHOW CREATE DATABASE PACKT_ONLINE_SHOP;

Example 5:

-- To create table within PACKT_ONLINE_SHOP. 

--To create a Customers table under the PACKT_ONLINE_SHOP database

USE PACKT_ONLINE_SHOP; 
CREATE TABLE Customers 
( 
    CustomerID INT NOT NULL AUTO_INCREMENT, 
    FirstName CHAR(50) NOT NULL, 
    LastName CHAR(50) NOT NULL, 
    Address CHAR(250) NULL, 
    Email CHAR(200) NULL, 
    Phone CHAR(50) NULL, 
    Notes TEXT(1024) NULL, 
    PRIMARY KEY (CustomerID) 
); 

Example 6:

--To Insert sample rows run the following command

INSERT INTO Customers (FirstName, LastName, Address, Email, Phone, Notes) 
VALUES 
('Joe', 'Doaks', '2356 Elm St.', 'joedoaks@sfghwert.com', '(310) 555-1212', 'A note'), 
('Paul', 'Atreides', '123 Caladan Drive', 'patreides@sietchtabr.com', '(818) 555-3678', 'Outworlder, now a Fremen'), 
('Mr.', 'Spock', '1701 Enterprise Drive', 'mrspock@NCC1701Enterprise.gov', '(717) 555-3457', 'Perceptive naval and science officer'), 
('Joseph', 'Crater', '1313 Mockingbird Lane', 'judgecrater@e56gfwrty.com', '(212) 555-5678', 'Might undisappear any minute . . .'), 
('James', 'Kirk', '1701 Enterprise Drive', 'jtkirk@NCC1701Enterprise.gov', '(717) 555-3457', 'Naval combat veteran'), 
('Luke', 'Skywalker', '456 Tosche Station', 'lskywalker@moseisley.gov', '(213) 555-3421', 'Pilot and mystic'), 
('Chew', 'Bacca', 'Docking Bay 94, Kashyyyk', 'chewbacca@rebelalliance.edu', '(213) 555-8523', 'Executive Officer, Millennium Falcon'), 
('Leto', 'Atreides', '1870 Arrakeen Ct.', 'latreides@arrakeen.org', '(310) 555-5462', 'Spice dealer'); 

Example 7:

--Add a new column to the existing Customer table, called ZipCode, which will contain the ZIP code. 

ALTER TABLE Customers 
ADD COLUMN ZipCode INT CONSTRAINT CHK_ZipCode 
CHECK ([ZipCode] LIKE '[0-9][0-9][0-9][0-9][0-9]'); 

Example 8:
/*
How to modify an existing column in a table. This is done using the MODIFY clause with the ALTER TABLE command. 
To expand the character limit for the firstName and the lastName columns of the Customer table, run the following command
*/
ALTER TABLE Customers 
  MODIFY COLUMN firstName char(100), 
  MODIFY COLUMN lastName char(100) 

