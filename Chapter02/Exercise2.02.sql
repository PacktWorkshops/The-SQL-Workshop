DROP TABLE IF EXISTS department;
CREATE TABLE department (
    departmentNo INT PRIMARY KEY AUTO_INCREMENT,
    departmentName VARCHAR(20) NOT NULL,
    departmentLoc VARCHAR(50) DEFAULT 'NJ',
    departmentEstDate DATETIME DEFAULT NOW()
);  
INSERT INTO department (
    departmentName
)
VALUES (
    'MyDepartment'
); 
INSERT INTO department (
    departmentName,
    departmentLoc)
VALUES
(
    'Administration',
    DEFAULT
),
(
    'IT',
    DEFAULT
); 
INSERT INTO department (
    departmentName,
    departmentLoc)
VALUES
(
    'Administration',
    'NYC'
); 
