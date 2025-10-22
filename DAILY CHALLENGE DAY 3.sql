-- DAY 3 - CLAUSES AND OPERATORS --

CREATE DATABASE university;
USE university;

CREATE TABLE departments(
department_id INT PRIMARY KEY,
department_name VARCHAR(100)
);

CREATE TABLE students(
student_id INT PRIMARY KEY,
student_name VARCHAR(100),
age INT,
dateofbirth DATE,
email VARCHAR(50),
course VARCHAR(20),
GPA DECIMAL(10,2),
department_id INT,
FOREIGN KEY(department_id) REFERENCES departments(department_id)
);

INSERT INTO departments VALUES
(1,"COMMERCE"),
(2,"COMPUTER SCIENCE"),
(3,"ZOOLOGY"),
(4,"MATHEMATICS"),
(5,"PHYSICS"),
(6,"COMMERCE");

SELECT * FROM departments;
 
INSERT INTO students (student_id,student_name,age,dateofbirth ,email,course,GPA,department_id) VALUES
(101, "Ganesh" , 18 , "2012-12-01" , "ganesh123@gmail.com" , "Mathematics" , 91.20 , 1),
(102, "Harish" , 16 , "2010-04-16" , "harishhhh@gmail.com" , "Zoology" , 67.80 , 4),
(103, "Sneha" , 17 , "2010-06-28" , "sneha@gmail.com" , "Biology" , 86.50 , 3),
(104, "Diya" , 19 , "2011-10-31" , "diya199@gmail.com" , "Computer Science" ,97.80 , 4),
(105, "Ravi" , 20 , "2009-05-22" , "ravi45677@gmail.com" , "Commerce" , 82.60, 1)
;

INSERT INTO students (student_id,student_name,age,dateofbirth ,email,course,GPA,department_id) VALUES
(106, "Rakesh" , 18 , "2008-11-01" , NULL , "Mathematics" , 94.60 , 1);

SELECT * FROM students;

-- Write a SQL query to return distinct department names --

SELECT DISTINCT department_name FROM departments;

-- Write queries to find students with NULL and NOT NULL emails --
SELECT * FROM students WHERE email IS NULL;
SELECT * FROM students WHERE email IS NOT NULL;

-- Write queries using IN, BETWEEN, and NOT BETWEEN operators --
SELECT student_id,student_name,course,GPA FROM students WHERE course IN ("Mathematics","Zoology","Biology");

SELECT student_id,student_name,course,GPA FROM students WHERE GPA BETWEEN 80 AND 90;

SELECT student_id,student_name,course,GPA FROM students WHERE GPA NOT BETWEEN 80 AND 90;
