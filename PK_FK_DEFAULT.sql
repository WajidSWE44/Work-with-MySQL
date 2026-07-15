Create database Contraints;
use Contraints;
CREATE TABLE EMPLOYEES(
ID INT PRIMARY KEY,
Name VARCHAR(50),
Salary INT DEFAULT 25000
);
INSERT INTO EMPLOYEES (ID,Name)
VALUES
(01,"Adam"),
(02,"Bob"),
(03,"Casey");   
SELECT * FROM EMPLOYEES;

CREATE TABLE university(
DEPTName VARCHAR(50),
emp_ID INT ,
FOREIGN KEY(emp_ID) references EMPLOYEES(ID)
);
SHOW TABLES ;


SELECT * FROM university;
drop Database Contraints;






Drop table university;

CREATE TABLE emp(
id INT ,
Salary INT DEFAULT 25000
);
INSERT INTO emp(id) Value (101);
SELECT * FROM emp;