CREATE DATABASE LAB6;
USE LAB6;

CREATE TABLE Department (
    deptno INT PRIMARY KEY,
    deptname VARCHAR(50),
    location VARCHAR(50)
);

INSERT INTO Department (deptno, deptname, location)
 VALUES
(10, 'IT', 'Karachi'),
(20, 'Marketing', 'Hyderabad'),
(30, 'Human Resources', 'Hyderabad'),
(40, 'Finance', 'Karachi');

SELECT * FROM Department;

CREATE TABLE Employee (
    empno INT PRIMARY KEY,
    ename VARCHAR(50),
    job VARCHAR(50),
    mgr INT,
    hiredate DATE,
    deptno INT,
    FOREIGN KEY (deptno) REFERENCES Department(deptno)
);

INSERT INTO Employee (empno, ename, job, mgr, hiredate, deptno) VALUES
(201, 'Ali', 'Manager', NULL, '2022-05-20', 10),
(202, 'Bilal', 'Salesperson', 201, '2021-09-15', 20),
(203, 'Faisal', 'Clerk', 201, '2020-02-10', 30),
(204, 'Zainab', 'Analyst', 202, '2019-04-05', 10),
(205, 'Ayesha', 'Salesperson', 202, '2018-07-22', 30),
(206, 'Wajid', 'Clerk', 204, '2017-03-19', 20),
(207, 'Sara', 'Analyst', 201, '2016-12-01', 10),
(208, 'Nadeem', 'Salesperson', 205, '2023-01-11', 20),
(209, 'Kamran', 'Clerk', 204, '2022-10-25', 30),
(210, 'Kaleem', 'Manager', NULL, '2020-08-30', 20);


SELECT * FROM Employee;

CREATE TABLE salaries (
    empno INT PRIMARY KEY,
    salary DECIMAL(10, 2),
    commission DECIMAL(10, 2),
    FOREIGN KEY (empno) REFERENCES Employee(empno)
);

INSERT INTO salaries (empno, salary, commission) VALUES
(201, 70000.00, 6000.00),
(202, 50000.00, NULL),
(203, 32000.00, 2500.00),
(204, 55000.00, 3000.00),
(205, 42000.00, 2000.00),
(206, 39000.00, NULL),
(207, 60000.00, 3500.00),
(208, 48000.00, NULL),
(209, 36000.00, 1500.00),
(210, 62000.00, NULL);

SELECT * FROM salaries;

-- Queries

-- Q1.i.Display the emp name, salary, and commission for all employees who earn commissions. Sort data in descending order of salary and commissions
SELECT e.ename AS "Employee Name", s.salary AS "Salary", s.commission AS "Commission"
FROM Employee e
JOIN salaries s ON e.empno = s.empno
WHERE s.commission IS NOT NULL
ORDER BY s.salary DESC, s.commission DESC;

-- Q1.ii.Show empno and ename having deptno 20 or 30 in descending order
SELECT empno, ename, deptno
FROM Employee
WHERE deptno IN (20, 30)
ORDER BY empno DESC;

-- Q1.iii.Write a query that displays the employee name (with the first letter uppercase and all other letters lowercase) and the length of the name for all employees whose name starts with the letters J, A, or M. Give each column an appropriate label. Sort the results descending order of the employee name.
SELECT CONCAT(UPPER(LEFT(ename, 1)), LOWER(SUBSTRING(ename, 2))) AS "Employee Name",LENGTH(ename) AS "Name Length"
FROM Employee
WHERE ename LIKE 'J%' OR ename LIKE 'A%' OR ename LIKE 'M%'
ORDER BY ename DESC;

-- Q1.iv.Display the emp name and calculate the number of months between today and the date on which the employee was hired. Label the column MONTHS_WORKED. Order your results in descending order by the number of months employed.
SELECT ename AS "Employee Name",
       TIMESTAMPDIFF(MONTH, hiredate, CURDATE()) AS "MONTHS_WORKED"
FROM Employee
ORDER BY "MONTHS_WORKED" DESC;

-- Q1.v.Display the emp name and salary for all employees. Format the salary to be 15 characters long, left-padded with the “$” symbol. Label the column SALARY
SELECT e.ename AS "Employee Name", 
       LPAD(CONCAT('$', s.salary), 15, '$') AS "SALARY"
FROM Employee e
JOIN salaries s ON e.empno = s.empno;

-- Q1.vi.Write a query to display the current date. Label the column Date.
SELECT CURDATE() AS "Date";

-- Q1.vii.Display the employee number, hire date, number of months employed, first Friday after hire date, and last day of the month.
SELECT empno,hiredate, 
       TIMESTAMPDIFF(MONTH, hiredate, CURDATE()) AS "Months Employed",
       DATE_ADD(hiredate, INTERVAL (7 - DAYOFWEEK(hiredate) + 6) % 7 + 1 DAY) AS "First Friday After Hire",
       LAST_DAY(hiredate) AS "Last Day of Month"
FROM Employee;

-- viii.Create a query that displays the employees names and commission amounts. If an employee does not earn commission, show “No Commission.” Label the column COMM. (Hint: Use NVL Function)
SELECT e.ename AS "Employee Name", 
       IFNULL(s.commission, 'No Commission') AS "COMM"
FROM Employee e
LEFT JOIN salaries s ON e.empno = s.empno;


-- Q2.i.Display ename, hiredate and print the date in DD Month YYYY Format. Label the coulmn as “DATE FORMAT”. (Hint: Use To_CHAR Function)
SELECT ename AS "Employee Name",
       DATE_FORMAT(hiredate, '%d %M %Y') AS "DATE FORMAT"
FROM Employee;

-- Optional Query: Display the employee name and email address.
SELECT ename AS "Employee Name",
       LOWER(CONCAT(SUBSTRING(ename, 1, 4), '@gmail.com')) AS "Email Address"
FROM Employee;
