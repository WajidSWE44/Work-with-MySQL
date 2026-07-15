
USE LabTask;

-- Create Employee Table
CREATE TABLE empl(
    eid INT PRIMARY KEY,
    ename VARCHAR(50),
    eadd VARCHAR(100),
    job VARCHAR(50),
    sal DECIMAL(10, 2),
    hire_date DATE,
    dept_id INT
);

-- Insert modified data into Employee Table
INSERT INTO empl (eid, ename, eadd, job, sal, hire_date, dept_id)
VALUES 
(1001, 'Michael Green', '101 Willow St', 'Project Manager', 6100, '2022-06-01', 201),
(1002, 'Sarah White', '202 Birch Ave', 'Sales Executive', 4800, '2021-09-15', 202),
(1003, 'Tom Harris', '303 Pine St', 'HR Specialist', 3700, '2023-01-20', 203),
(1004, 'Laura Black', '404 Aspen Rd', 'Software Engineer', 5400, '2022-10-05', 204),
(1005, 'Kevin Brown', '505 Maple Dr', 'Data Analyst', 3300, '2020-12-18', 205),
(1006, 'Emily Stone', '606 Redwood Ln', 'Marketing Assistant', 2900, '2019-07-01', 50),
(1007, 'Casey Lee', '707 Cedar Pl', 'Operations Clerk', 3200, '2021-03-11', 60);


-- Verify Employee Data
SELECT * FROM empl;

-- Create Department Table
CREATE TABLE Department(
    Department_id INT PRIMARY KEY,
    Department_name VARCHAR(50)
);

-- Insert modified data into Department Table
INSERT INTO Department (Department_id, Department_name) 
VALUES 
(50, 'Marketing'),
(201, 'Operations'),
(202, 'Sales'),
(203, 'Human Resources'),
(204, 'Engineering'),
(205, 'Finance');

-- Verify Department Data
SELECT * FROM Department;

-- Task NO: 1
SELECT * FROM empl 
WHERE job = (SELECT job FROM empl WHERE eid = 1001) 
AND sal > (SELECT sal FROM empl WHERE eid = 1002);

-- TASK NO: 2
SELECT Department_id, MIN(sal) 
FROM empl
GROUP BY Department_id
HAVING MIN(sal) > (SELECT sal FROM empl WHERE Department_id = 50);

-- TASK NO: 3
SELECT job, AVG(sal)
FROM empl
GROUP BY job HAVING AVG(sal) = (SELECT MIN(avg_sal) FROM ( SELECT job, AVG(sal) AS avg_sal FROM empl GROUP BY job)
);

-- TASK NO: 4
SELECT * FROM empl
WHERE sal < ANY(SELECT sal FROM empl WHERE job = 'Operations Clerk') 
AND job != 'Operations Clerk';

-- TASK NO: 5
SELECT * FROM empl
WHERE sal IN (SELECT MIN(sal) FROM empl GROUP BY Department_id);

-- TASK NO: 6
SELECT * FROM emp 
WHERE sal > ANY(SELECT MIN(sal) FROM empl GROUP BY Department_id);
