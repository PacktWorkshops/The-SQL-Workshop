DROP DATABASE IF EXISTS employeedemo; 
CREATE DATABASE employeedemo;  
USE employeedemo; 

CREATE TABLE department 
  ( 
      dno       INT PRIMARY KEY, 
      dname     VARCHAR(30) UNIQUE NOT NULL, 
      dlocation VARCHAR(30) UNIQUE NOT NULL 
   ) 
CREATE TABLE employee 
( 
	eno		CHAR(4) PRIMARY KEY, 
	ename		VARCHAR(30) NOT NULL, 
	job		VARCHAR(30) NOT NULL, 
	manager	CHAR(4), 
	jdate		TIMESTAMP NOT NULL, 
	gender	CHAR(1) CONSTRAINT gender_chk 
	CHECK ( gender IN('M', 'F')), 
	salary	DECIMAL(8, 2) DEFAULT 0, 
	comission	DECIMAL(8, 2) DEFAULT 0, 
	deptno	INT NOT NULL,
    FOREIGN KEY (deptno) REFERENCES department(dno)
) 
  
