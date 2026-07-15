-- JOINS ,
-- TYPES OF JOINS --> INNER JOINS , OUTER JOINS
-- TYPES OF OUTERJOIN --> LEFT_OUTER_JOIN , RIGHT_OUTER_JOIN ,FULL_OUTER_JOIN,
-- SELF JOIN, EQUI JOIN, NON EQUI JOIN, NATURAL JOIN , CROSS JOIN


-- JOINS : Used for combining column/rows from two or more tables by using values common to both tables.
-- TYPES :


CREATE DATABASE joins;
use joins;     

CREATE TABLE students(
std_id INT PRIMARY KEY,
std_name VARCHAR(20)
);   
INSERT INTO students(std_id,std_name)
values
(101,'adam'),
(102,'bob'),
(103,'casey');

select * From students;

CREATE TABLE course(
std_id INT PRIMARY KEY,
course_name VARCHAR(50)
);
INSERT INTO course(std_id,course_name)
values
(102,'Science'),
(103,'Math'),
(105,'English'),
(107,'Computer Science');

Select * From course;
Drop Table course;

-- 1.Inner Joins: Returns records that have matching values in both tables .
Select * From students 
Inner Join course
ON students.std_id = course.std_id;

-- Alias :used for Alternative name for tables
-- Select * From students as s
-- Inner Join course as c
-- ON s.std_id = c.std_id;

-- 2.Left join : returns all records from the left table (table1), and the matched records from the right table (table2).
--   The result is NULL from the right side, if there is no match.

SELECT * FROM students as s
LEFT JOIN course as c
ON s.std_id = c.std_id;

-- 3.Right join : returns all records from the right table (table1), and the matched records from the left table (table2).
--   The result is NULL from the left side, if there is no match.

SELECT * FROM students as s
RIGHT JOIN course as c
ON s.std_id = c.std_id;

-- 4.Full Outer join : returns all records from table 1 even if there is no match in table 2 and vice versa.
-- syntax : LEFTJOIN
--          UNION
--          RIGHTJOIN

SELECT * FROM students as s
LEFT JOIN course as c
ON s.std_id = c.std_id
UNION
SELECT * FROM students as s
RIGHT JOIN course as c
ON s.std_id = c.std_id;

-- LEFT EXCLUSIVE JOINS : 
SELECT * FROM students as s
LEFT JOIN course as c
ON s.std_id = c.std_id
Where c.std_id IS NULL;

-- RIGHT EXCLUSIVE JOINS : 
SELECT * FROM students as s
RIGHT JOIN course as c
ON s.std_id = c.std_id
Where s.std_id IS NULL;


-- SELF JOIN: is a regular join(inner join), but the table is joined with itself.Joining a table to itself is called self join.
 CREATE TABLE Employee(
 id INT PRIMARY KEY,
 emp_name VARCHAR(20),
 manager_id INT 
 );
 
INSERT INTO Employee(id, emp_name, manager_id)
VALUES 
(101,'John',103),
(102,'Alice',104),
(103,'Smith',null),
(104,'Donald',103);

SELECT * FROM Employee;
