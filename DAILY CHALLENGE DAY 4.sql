-- Day 4: Sorting & Aggregates --

CREATE DATABASE Ecommerce;
USE Ecommerce;

CREATE TABLE products(
product_id INT PRIMARY KEY,
product_name VARCHAR(50),
price DECIMAL(10,2)
);

INSERT INTO products VALUES
(101,"Smartphone",19999.99),
(102,"Laptop",45000.50),
(103,"Headphones",599.99),
(104,"Tablet",15000.25),
(105,"Smartwatch",2580.34),
(106,"Camera",38990.98),
(107,"Fitness Tracker",1500.73),
(108,"Coffee Maker",3000.47),
(109,"Blender",999.25),
(110,"Microwave",80000.78);

SELECT * FROM products;

-- ORDER BY & LIMIT --
-- In an e-commerce system, show the top 3 highest-priced products --
 -- Write a SQL query using ORDER BY and LIMIT --
 SELECT * FROM products ORDER BY price DESC LIMIT 3;
 
 CREATE TABLE sales(
 sale_id INT PRIMARY KEY,
 customer_id INT,
 customer_name VARCHAR(50),
 product_id INT,
 sale_date DATE,
 Quantity INT,
 total_price DECIMAL(10,2)
 );
 
 INSERT INTO sales VALUES
 (121,414,"Elica",101,"2024-10-22",30,120000),
 (122,415,"Lucas",102,"2021-05-12",23,6000),
 (123,416,"Fin",103,"2004-08-01",36,15000),
 (124,417,"Ella",104,"2022-11-25",28,55000),
 (125,418,"Jonas",105,"2014-10-07",50,40000),
 (126,419,"Ida",106,"2006-09-02",10,80000),
 (127,420,"Ben",102,"2018-07-12",38,75000),
 (128,421,"Oliver",105,"2009-12-05",25,18000);
 
 SELECT * FROM sales;      

-- Aggregate Functions --
--  Management wants statistics of sales data --
-- Write queries using COUNT, SUM, AVG, MAX, MIN on Sales table --

SELECT COUNT(sale_id) FROM sales;
SELECT SUM(total_price) FROM sales;
SELECT AVG(total_price) FROM sales;
SELECT MAX(total_price) FROM sales;
SELECT MIN(total_price) FROM sales;

CREATE TABLE employees(
employee_id INT PRIMARY KEY,
employee_name VARCHAR(100),
department_id INT,
department_name VARCHAR(20),
salary DECIMAL(10,2)
);

INSERT INTO employees VALUES
(1001,"Daniel",121,"Finance",45000),
(1002,"Antony",122,"Sales",52000),
(1003,"John",123,"HR",80000),
(1004,"David",124,"Research",90000),
(1005,"Billa",125,"Administartion",91000),
(1006,"Smith",126,"Sales",52000),
(1007,"Leo",127,"Finance",48000),
(1008,"Jim",128,"Finance",92000),
(1009,"Anto",129,"Finance",83000),
(1010,"Daniel",121,"Finance",45000),
(1011,"Antony",122,"Sales",52000),
(1012,"John",123,"Finance",80000),
(1013,"David",124,"Finance",90000),
(1014,"Billa",125,"Finance",91000),
(1015,"Smith",126,"Finance",52000),
(1016,"Leo",127,"Finance",48000),
(1017,"Jim",128,"Finance",92000),
(1018,"Anto",129,"Finance",83000);

SELECT * FROM employees;

-- GROUP BY & HAVING --
-- Find departments with more than 10 employees --
-- Write a query using GROUP BY and HAVING --

SELECT department_name, COUNT(employee_id) AS Total_employees FROM employees
GROUP BY department_name
HAVING COUNT(employee_id)>10;
