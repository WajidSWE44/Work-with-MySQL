-- SubQueries 

CREATE DATABASE subquery;
use subquery;
CREATE TABLE student(
rollno INT PRIMARY KEY,
name VARCHAR(50),
marks INT NOT NULL,
grade VARCHAR(2),
city VARCHAR(20)
);

INSERT INTO student(rollno, name, marks, grade, city)
VALUES
(101,"ahmed",90,"A","Nawabshah"),
(102,"sarah",88,"A","Hyderabad"),
(103,"asad",98,"A+","Hyderabad"),
(104,"ali",78,"B","Karachi"),
(105,"hussan",18,"F","Karachi"),
(106,"farah",72,"B","Karachi");

-- Select Statement 
Select * From student;

-- 1. Write a Query to get names of all students who scored more than class average
-- step:1
SELECT AVG(marks) 
FROM student;
-- step:2
Select name,marks 
From student
Where marks> 74.00; 

Select name,marks From student
Where marks>
(Select AVG(marks) From student);


-- Qno2
-- step:1
SELECT rollno From student
Where rollno % 2 = 0;
-- step:2
SELECT name,rollno From student
Where rollno IN(102,104,106);

SELECT name,rollno From student
Where rollno IN
(SELECT rollno From student Where rollno % 2 = 0);

-- Qno3




