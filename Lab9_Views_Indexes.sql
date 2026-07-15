CREATE DATABASE views_indexes;
use views_indexes;
CREATE TABLE Employees (

    eno INT PRIMARY KEY,
    ename VARCHAR(100),
    department_number INT
    
);
INSERT INTO Employees (eno, ename, department_number) VALUES (1, 'Alice', 101);
INSERT INTO Employees (eno, ename, department_number) VALUES (2, 'Michael', 102);
INSERT INTO Employees (eno, ename, department_number) VALUES (3, 'Sarah', 101);
INSERT INTO Employees (eno, ename, department_number) VALUES (4, 'Smith', 103);
INSERT INTO Employees (eno, ename, department_number) VALUES (5, 'John', 102);
Drop Table Employees;
SELECT * from Employees;

CREATE VIEW employee_vu AS
SELECT Employees.eno, Employees.ename AS "Employee",  Employees.department_number
From Employees;

SELECT * from employee_vu;

CREATE TABLE Emp2 (

    eno INT PRIMARY KEY,
    ename VARCHAR(100),
    department_number INT,
    sal INT
);

INSERT INTO Emp2 (eno, ename, department_number, sal) 
VALUES 
(1, 'Alice ', 101, 50000),
(2, 'Michael', 102, 49000),
(3, 'Sarah', 103, 45000),
(4, 'Smith', 101, 55000),
(5, 'John', 102, 48000);

Drop Table Emp2;
SELECT  * from Emp2;

CREATE TABLE SALGRADE (
    losal INT,       
    hisal INT,       
    grade VARCHAR(2)   
);

INSERT INTO SALGRADE (losal, hisal, grade) 
VALUES
(0, 2000, 'C'),
(2001, 4000, 'B'),
(4001, 6000, 'A'),
(6001, 8000, 'A+'),
(8001, 10000, 'S'),
(10001, 50000, 'S');

SELECT  * from SALGRADE;

CREATE VIEW SALARY_VU AS 
SELECT 
    e.ename AS EMPLOYEE, 
    e.sal AS SALARY, 
    s.grade AS GRADE
FROM Emp2 e
JOIN SALGRADE s 
ON e.sal BETWEEN s.losal AND s.hisal;

Drop VIEW SALARY_VU;

SELECT * from SALARY_VU;


SELECT * FROM USER_VIEWS 
WHERE VIEW_NAME = 'SALARY_VU';

UPDATE Employees set ename = 'BOb '
WHERE department_number = 103;

SELECT * FROM Employees;

SELECT * FROM employee_vu;

CREATE INDEX Employees_IDX ON Employees(department_number);

DROP INDEX Employees_IDX ON Employees;

CREATE INDEX EMPLOYEES_IDX_com ON Employees(department_number, ename);

DROP INDEX EMPLOYEES_IDX_com ON Employees;
