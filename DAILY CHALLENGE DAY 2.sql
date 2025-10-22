-- DAILY CHALLENGE DAY 2-Constraints --
/* SQL Question 1: PRIMARY KEY & FOREIGN KEY
Scenario:
 You are creating a database for an online bookstore.
Task:
 Define a primary key for Books(BookID) and a foreign key in Orders(BookID) referencing Books.
Expected Output:
 Constraints are applied successfully */
 
 CREATE DATABASE onlinebookstore;
 USE onlinebookstore;
 
 CREATE TABLE Books(
BookID INT PRIMARY KEY,
Title VARCHAR(100) UNIQUE NOT NULL,
Author VARCHAR(50)
);
 
 CREATE TABLE Orders (
 OrderID INT PRIMARY KEY,
 BookID INT,
 FOREIGN KEY (BookID) REFERENCES Books(BookID)
 );
 
/* SQL Question 2: UNIQUE Constraint
Scenario:
 Each book must have a unique ISBN.
Task:
 Add a UNIQUE constraint to the ISBN column in Books.
Expected Output:
 ISBN values are enforced as unique */
 
 ALTER TABLE Books
 ADD COLUMN ISBN VARCHAR(20) UNIQUE;
 
/* SQL Question 3: DELETE vs TRUNCATE
Scenario:
 The store wants to clear test orders but sometimes preserve structure.
Task:
 Demonstrate DELETE with WHERE clause and TRUNCATE for Orders table.
Expected Output:
 DELETE removes selected rows; TRUNCATE clears all rows quickly */
 
 DELETE FROM Orders
 WHERE OrderID=1;
 
 TRUNCATE TABLE Orders;