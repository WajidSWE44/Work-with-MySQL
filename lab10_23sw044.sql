CREATE DATABASE LAB10;
USE LAB10;

-- Create the table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    job_title VARCHAR(50)
);
INSERT INTO employees (emp_id, emp_name, job_title) VALUES 
(01, 'Mohsin', 'Software Engineer'),
(02, 'Hamid', 'Project Manager'),
(03, 'Ali', 'HR Specialist'),
(04, 'Aamar', 'Sales Executive');

SELECT * FROM employees;


-- Task 1: Create 3 different users.

CREATE USER 'wajid'@'abc' IDENTIFIED BY '23sw143';
CREATE USER 'hassan'@'xyz' IDENTIFIED BY '23sw141';
CREATE USER 'ahmed'@'abc' IDENTIFIED BY '23sw110';


-- Task 2: Assign different system privileges to any one of the three users.

GRANT CREATE ON *.* TO 'wajid'@'abc';         
GRANT CREATE VIEW ON *.* TO 'wajid'@'abc';     
GRANT SHOW VIEW ON *.* TO 'wajid'@'abc';      
GRANT SHOW DATABASES ON *.* TO 'wajid'@'abc'; 

-- Task 3: Assign different object privileges to any one of the three users.

GRANT SELECT, INSERT, UPDATE ON lab10.employees TO 'hassan'@'xyz';


-- Task 4: Create a Role Named manager, Assign Privileges to That Role, and Assign the Role to One User

CREATE ROLE 'manager';
GRANT SELECT, INSERT, DELETE ON lab10.employees TO 'manager';
GRANT CREATE TEMPORARY TABLES ON *.* TO 'manager';
GRANT 'manager' TO 'ahmed'@'abc' ;


-- Task 5: Revoke all the privileges from all of the three users.

REVOKE CREATE, SHOW DATABASES ON *.* FROM 'wajid'@'abc' ;
REVOKE SELECT, INSERT, UPDATE ON lab10.employees FROM 'hassan'@'xyz'  ;
REVOKE 'manager' FROM 'ahmed'@'abc';
DROP ROLE IF EXISTS 'manager';
DROP USER IF EXISTS 'wajid'@'abc';
DROP USER IF EXISTS 'hassan'@'xyz' ;
DROP USER IF EXISTS 'ahmed'@'abc';

DROP DATABASE IF EXISTS LAB10;
