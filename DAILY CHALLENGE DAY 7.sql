CREATE DATABASE employeedatabase;

use employeedatabase;

CREATE TABLE departments(
dept_id INT PRIMARY KEY,
dept_name VARCHAR(50)
);
CREATE TABLE employee(
employee_id INT PRIMARY KEY,
employee_name VARCHAR(100),
dept_id INT,
FOREIGN KEY(dept_id) REFERENCES departments(dept_id)
);
CREATE TABLE salary(
employee_id INT,
salary DECIMAL(10,2),
FOREIGN KEY(employee_id) REFERENCES employee(employee_id)
);

INSERT INTO departments VALUES
(1,"Sales"),
(2,"Finance"),
(3,"HR"),
(4,"Administration"),
(5,"Research");
INSERT INTO employee VALUES
(1001,"Ram",2),
(1002,"Meena",4),
(1003,"Rajesh",1),
(1004,"Priya",3),
(1005,"Santhosh",5),
(1006,"Abi",1);
INSERT INTO salary VALUES
(1001,45000),
(1002,50000),
(1003,30000),
(1004,25000),
(1005,28000);

/* SQL Question 1: Stored Procedure
Scenario:
 HR wants a quick way to fetch employee details by ID.
Task:
 Create a stored procedure accepting EmployeeID as input.
Expected Output:
 Employee details are returned when procedure is executed */

DELIMITER $$
CREATE PROCEDURE getEmpDetails(IN emp_id INT)
BEGIN
	SELECT * FROM employee WHERE employee_id=emp_id;
END $$
DELIMITER ;

CALL getEmpDetails(1001);

/* SQL Question 2: Simple View
Scenario:
 Management wants a view for employee name and department.
Task:
 Write a CREATE VIEW statement.
Expected Output:
 A new view is created successfully */
 
CREATE VIEW empNameandDept AS
SELECT e.employee_id,e.employee_name,d.dept_name 
FROM employee AS e
JOIN departments AS d
ON e.dept_id=d.dept_id;

SELECT * FROM empNameandDept;

/* SQL Question 3: Complex View
Scenario:
 Create a view joining Employees, Departments, and Salaries.
Task:
 Write SQL to define a complex view with multiple joins.
Expected Output:
 The view returns combined data from all three tables */
CREATE VIEW empDetails AS
SELECT e.employee_id,e.employee_name,d.dept_id,d.dept_name,s.salary
FROM employee AS e
JOIN departments AS d
ON e.dept_id=d.dept_id
JOIN salary AS s
ON e.employee_id=s.employee_id;

SELECT * FROM empDetails;
 
 