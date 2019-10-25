/****** Introduction To SQL Chapter SEVEN  Scripts ******/

/****** Aggregate Functions  ******/

SELECT COUNT(CustomerID) 
FROM CUSTOMERS; 


SELECT COUNT(Notes)  
FROM CUSTOMERS; 


SELECT COUNT(*) 
FROM CUSTOMERS; 


SELECT SUM(AMOUNT) 
FROM PAYMENTS


SELECT SUM(AMOUNT) 
FROM PAYMENTS
WHERE AMOUNT>50


SELECT AVG(AMOUNT) 
FROM PAYMENTS


SELECT MAX(Amount) 
FROM PAYMENTS


/****** GROUPING  ******/


SELECT PaymentType, SUM(Amount)as TotalAmount
FROM  Payments
GROUP BY PaymentType


SELECT paymentid ,PaymentType, SUM(Amount)as TotalAmount
FROM  Payments
GROUP BY PaymentType,PaymentID

/****** Using the Having Clause to narrow down results  ******/


SELECT PaymentType, SUM(Amount)as TotalAmount
FROM  Payments
GROUP BY PaymentType
Having SUM(AMOUNT) > 50


/****** Built In Value Functions  ******/




/****** String Value Functions  ******/



SELECT ASCII('A')


Select CHAR(65)


SELECT CHARINDEX('ck', 'Packt') AS MatchIndex;


SELECT CHARINDEX('ck', 'Packt',3) AS MatchIndex;

SELECT CONCAT ( 'Happy ', 'Birthday ', 11, '/', '25' ) AS Result;

SELECT CONCAT_WS(',','1 Microsoft Way', NULL, NULL, 'Redmond', 'WA', 98052) AS Address;

SELECT 'SQL' + ' is' + ' fun!';

SELECT SOUNDEX('Green'), SOUNDEX('Greene'), DIFFERENCE('Green','Greene');


SELECT SOUNDEX('Blotchet-Halls'), SOUNDEX('Greene'), DIFFERENCE('Blotchet-Halls', 'Greene');  
 

DECLARE @d DATETIME = GETDATE();  
SELECT FORMAT( @d, 'dd/MM/yyyy', 'en-US' ) AS 'DateTime Result'  
       ,FORMAT(123456789,'###-##-####') AS 'Custom  Number Result';


SELECT LEFT('abcdefg',2);  


SELECT DATALENGTH('PACKT');



DECLARE @v1 varchar(40),  
	    @v2 nvarchar(40);  
SELECT   
@v1 = 'Test of 22 characters ',   
@v2 = 'Test of 22 characters ';  
SELECT LEN(@v1) AS [varchar LEN] , DATALENGTH(@v1) AS [varchar DATALENGTH];  
SELECT LEN(@v2) AS [nvarchar LEN], DATALENGTH(@v2) AS [nvarchar DATALENGTH]; 


SELECT LEN('PACKT');

SELECT LOWER('PACKT');

SELECT LTRIM('     Five spaces are at the beginning of this string.')


SELECT NCHAR(100)


SELECT PATINDEX('%ter%', 'interesting data');

SELECT PATINDEX('%en_ure%', 'please ensure the door is locked');  


SELECT QUOTENAME('abc[]def');


SELECT REPLACE('abcdefghicde','cde','xxx'); 


SELECT REPLICATE('PACKT ',4)

SELECT REVERSE(1234) AS Reversed ;  


SELECT REVERSE('PACKT');

SELECT RIGHT('PACKT',2);

SELECT RTRIM('Removes trailing spaces.   ');


SELECT SOUNDEX ('Smith'), SOUNDEX ('Smythe');  

SELECT CONCAT('PACKT',SPACE(3),'BOOK');

SELECT STR(123.45, 6, 1);  


SELECT STUFF('abcdef', 2, 3, 'ijklmn');  


SELECT SUBSTRING('abcdef', 2, 3); 

SELECT TRANSLATE('2*[3+4]/{7-2}', '[]{}', '()()');

SELECT TRIM( '     test    ') ;

SELECT TRIM( '.,! ' FROM  '     #     test    .') ;


DECLARE @nstring nchar(12);  
SET @nstring = N'Åkergatan 24';  
SELECT UNICODE(@nstring), NCHAR(UNICODE(@nstring));  



SELECT UPPER('Packt')






/******  Numeric Value Functions  ******/


SELECT ABS(-1.0), ABS(0.0), ABS(1.0);  


SELECT ACOS(-1.0)


SELECT ASIN(-1.0)



SELECT ATAN(45.0)


DECLARE @x float = 35.175643, @y float = 129.44;  
SELECT  ATN2(@y, @x);  




SELECT CEILING($123.45), CEILING($-123.45), CEILING($0.0);  



DECLARE @x float = 45
SELECT COS(@x)

DECLARE @x float = 90
SELECT COT(@x)



SELECT DEGREES(5)


DECLARE @x float = 10
SELECT EXP(@x)


SELECT FLOOR(123.45), FLOOR(-123.45), FLOOR($123.45);  

SELECT LOG (EXP (10));  

DECLARE @x float = 145.175643
SELECT log10(@x)


SELECT PI();  

SELECT POWER(4,2);

SELECT RADIANS(180);


SELECT RAND(100), RAND(), RAND()   ;


SELECT ROUND(123.9994, 3), ROUND(123.9995, 3);  


SELECT SIGN(-125), SIGN(0), SIGN(564);  

DECLARE @x float = 90
SELECT SIN(@x)


SELECT SQRT(4)



SELECT SQUARE(4)



DECLARE @x float = 90
SELECT TAN(@x)



/******  Date and Time Value Functions  ******/

Select CURRENT_TIMESTAMP

SELECT DATEADD(year,2, '20060731');  

SELECT DATEDIFF(day,
   '2007-05-07 09:53:01.0376635',
   '2007-05-08 09:53:01.0376635');  

SELECT DATEFROMPARTS ( 2010, 12, 31 )


SELECT DATEPART(week, '2007-04-21 ')
   
SELECT DAY('2015-04-30 01:01:01.1234567');

SELECT GETDATE()


SELECT GETUTCDATE()

SELECT ISDATE('THIS IS NOT A DATE'),ISDATE('2019-08-31')

SELECT MONTH('2007-04-30');  


SELECT SYSDATETIME ( )  

SELECT Year('2007-04-30');  



/******  Conversion Functions  ******/

SELECT CAST(25.65 AS int), CAST(25.65 AS varchar);

SELECT Convert(int, 25.65), Convert(varchar, 25.65 ),  CONVERT(nvarchar(30), GETDATE(), 109); 

SELECT PARSE('€345,98' AS money USING 'de-DE') AS Result

SELECT PARSE('Monday, 13 December 2010' AS datetime2 USING 'en-US') AS Result; 

SELECT TRY_CAST('test' AS float) , TRY_CAST('12/31/2010' AS datetime2)

SELECT TRY_CONVERT(float, 'test') , TRY_CONVERT(datetime2, '12/31/2010')


SELECT TRY_PARSE('Jabberwokkie' AS datetime2 USING 'en-US'),TRY_PARSE('01/01/2011' AS datetime2)


/******  Activity Solutions  ******/


Select  OrderItems.OrderID,  Sum(Quantity * ( OrderItems.UnitPrice - (OrderItems.Discount * OrderItems.UnitPrice ) )) as 'Total Amount After Discount', Count(OrderID) as'Count Of Line Items in Each OrderID' 
from OrderItems

Group By OrderID


Select UPPER(CONCAT(FIRSTNAME,' ',LASTNAME,'-',LEFT(Phone,5))),
	   YEAR(GETDATE()) as 'Year',
	    Month(GETDATE())as 'Month',
		 DAY(getdate())as 'Day'

from customers 

