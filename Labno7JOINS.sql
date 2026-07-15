CREATE DATABASE LabTask;
USE LabTask;

-- Create Employee Table
CREATE TABLE emp (
    eno INT PRIMARY KEY,
    ename VARCHAR(50) NOT NULL,
    ecity VARCHAR(50),
    job VARCHAR(50),       
    commis DECIMAL(10,2), 
    mgrID INT              
);

-- Create Department Table
CREATE TABLE dept (
    deptnumber INT PRIMARY KEY,
    deptname VARCHAR(50) NOT NULL,
    deptlocation VARCHAR(50),
    eno INT
);

-- Insert Data into Employee Table with modified values
INSERT INTO emp (eno, ename, ecity, job, commis, mgrID) 
VALUES 
(10, 'Michael Green', 'Seattle', 'Project Manager', 700.00, NULL),
(11, 'Sarah White', 'Denver', 'Sales Executive', NULL, 10),
(12, 'Tom Harris', 'Phoenix', 'HR Coordinator', 300.00, 10),
(13, 'Laura Black', 'San Diego', 'Software Developer', NULL, 10),
(14, 'Kevin Brown', 'Austin', 'Marketing Analyst', 450.00, 11);

-- Verify Employee Data
SELECT * FROM emp;

-- Insert Data into Department Table with modified values
INSERT INTO dept (deptnumber, deptname, deptlocation, eno) 
VALUES 
(201, 'Operations', 'Building 1', 10),
(202, 'Sales', 'Building 2', 11),
(203, 'Human Resources', 'Building 4', 12),
(204, 'Engineering', 'Building 3', 13),
(205, 'Research & Development', 'Building 2', NULL);

-- Verify Department Data
SELECT * FROM dept;

-- TASK 1: INNER JOIN
SELECT e.ename, d.deptnumber, d.deptlocation, d.deptname 
FROM emp e  
INNER JOIN dept d ON e.eno = d.eno;

-- TASK 2: DISTINCT Job in Department 203
SELECT DISTINCT e.job, e.eno, d.deptnumber, d.deptlocation 
FROM emp e
INNER JOIN dept d ON e.eno = d.eno
WHERE d.deptnumber = 203;

-- TASK 3: List employees with non-null commission
SELECT e.eno, e.commis, e.ename, e.job, d.deptnumber, d.deptlocation 
FROM emp e 
INNER JOIN dept d ON e.eno = d.eno
WHERE e.commis IS NOT NULL;

-- TASK 4: List Employee and Manager Details
SELECT e.eno, e.ename, e.mgrID, d.deptnumber 
FROM emp e
INNER JOIN dept d ON e.eno = d.eno;

-- TASK 5: RIGHT JOIN to get all departments with matching employee data
SELECT e.ename, e.eno, e.job, d.deptname, d.deptlocation
FROM emp e
RIGHT JOIN dept d ON e.eno = d.eno;

-- Create Salary Grade Table
CREATE TABLE salGrade2 (
    grade INT PRIMARY KEY,
    losal INT,
    hisal INT
);

-- Insert Data into Salary Grade Table with modified values
INSERT INTO salGrade2 (grade, losal, hisal) 
VALUES 
(1, 1000, 1600),
(2, 1601, 2700),
(3, 2701, 4000),
(4, 4001, 5500);
