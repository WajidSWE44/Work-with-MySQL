CREATE DATABASE views;
use views;
CREATE TABLE student(
id INT,
name VARCHAR(50),
age INT,
city VARCHAR(20),
PRIMARY KEY(id,name)
);
INSERT INTO student (id,name,city)
VALUES
(01,"Ali","karachi"),
(02,"Ahmed","Hyderabad"),
(03,"Asad","Quetta");  
 
 
CREATE VIEW student_view AS
SELECT id, name, city
FROM student
WHERE city = "karachi";

SELECT * FROM student_view;

DROP VIEW student_view;



CREATE TABLE Employee(
emp_no INT,
emp_name VARCHAR(50),
dept_no INT
);
INSERT INTO Employee(emp_no,emp_name,dept_no)
VALUES 
(1,"kaleem",101),
(2,"Wajid",202),
(3,"Adeel",303);

CREATE VIEW employee_vu AS
SELECT emp_no, emp_name,dept_no 
FROM Employee
WHERE emp_name="Wajid";

SELECT * FROM employee_vu;



