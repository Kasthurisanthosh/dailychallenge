-- Day 6: Functions --
CREATE DATABASE employeeDB;
USE employeeDB;
CREATE TABLE employees(
employee_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
joined_date DATE
);
INSERT INTO employees VALUES
(1,"Raghu","ram","2012-03-21"),
(2,"Priya","dharsini","2013-04-09"),
(3,"Ramesh","kumar","2012-08-27"),
(4,"Hari","krishna","2011-05-24"),
(5,"Lakshmi","prabha","2014-08-04");

-- Write queries using UPPER, LOWER, SUBSTRING, CONCAT --
SELECT first_name,last_name,LOWER(first_name),UPPER(last_name) FROM employees;
SELECT first_name, SUBSTRING(first_name,1,3) AS sub_string FROM employees;
SELECT first_name,last_name, CONCAT(first_name," ",last_name) AS full_name FROM employees;

 -- Calculate employee tenure in years
 -- Use DATE functions like YEAR(), DATEDIFF(), NOW()
 
 SELECT first_name,last_name,joined_date, YEAR(NOW())-YEAR(joined_date) AS Tenure_Years FROM employees;
 
 SELECT employee_id, DATEDIFF(NOW(),joined_date) AS Tenure_days FROM employees;
 
 CREATE TABLE students(
 student_id INT PRIMARY KEY,
 first_name VARCHAR(50),
 last_name VARCHAR(50)
 );
 INSERT INTO students VALUES
 (1,"Raghu","ram"),
(2,"Priya","dharsini"),
(3,"Ramesh","kumar"),
(4,"Hari","krishna"),
(5,"Lakshmi","prabha");
 
-- User-defined Function
-- Create a reusable function to return full name of a student
-- Write and test a UDF combining FirstName + LastName

DELIMITER // 
CREATE FUNCTION GetFullName(first_name VARCHAR(50), last_name VARCHAR(50))
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
	RETURN CONCAT(first_name," ",last_name);
END //

SELECT GetFullName(first_name,last_name) from students;
 