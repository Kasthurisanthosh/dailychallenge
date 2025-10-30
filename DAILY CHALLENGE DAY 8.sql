CREATE DATABASE salesdb;
USE salesdb;

CREATE TABLE orders(
order_id INT PRIMARY KEY,
customer_name VARCHAR(50),
order_date DATE,
amount DECIMAL(10,2)
);
INSERT INTO orders VALUES
(1,"Mahesh","2023-09-24",453.59),
(2,"Mary","2023-04-18",898.23),
(3,"Kiran","2023-06-13",748.90),
(4,"Sindhu","2023-05-04",345.78),
(5,"Lara","2023-12-02",298.34);

CREATE TABLE order_history(
order_id INT,
customer_name VARCHAR(50),
order_date DATE,
amount DECIMAL(10,2),
deleted_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

/* SQL Question 1: Trigger
Scenario:
 Log every deletion in the Orders table.
Task:
 Write a trigger to insert deleted rows into Order_History.
Expected Output:
 Deleted records are logged automatically */
 
DELIMITER $$
CREATE TRIGGER deleted_orders
AFTER DELETE ON orders
FOR EACH ROW
BEGIN
	INSERT INTO order_history (order_id, customer_name, order_date, amount)
    VALUES (OLD.order_id, OLD.customer_name, OLD.order_date, OLD.amount);
END$$
DELIMITER ;

SELECT * FROM order_history;
DELETE FROM orders WHERE order_id=1;
SELECT * FROM order_history;

/* SQL Question 2: DCL Commands
Scenario:
 Grant reporting access to junior analysts.
Task:
 Write SQL using GRANT and REVOKE commands.
Expected Output:
 User privileges are updated accordingly */

CREATE USER 'junior_analyst'@'localhost' IDENTIFIED BY '12345';

GRANT SELECT ON salesdb.* TO 'junior_analyst'@'localhost';

REVOKE SELECT ON salesdb.* FROM 'junior_analyst'@'localhost';
  
/* SQL Question 3: TCL Commands
Scenario:
 During a bank transfer, ensure atomicity.
Task:
 Write SQL using COMMIT, ROLLBACK, SAVEPOINT.
Expected Output:
 Transaction integrity is maintained */
 
CREATE TABLE bank_accounts
(account_no INT PRIMARY KEY,
account_holder_name VARCHAR(50),
account_balance DECIMAL(10,2)
);

INSERT INTO bank_accounts VALUES
(2472001,"Arun",450000),
(2472002,"Banu",300000),
(2472003,"Charles",200000),
(2472004,"Nancy",158000),
(2472006,"Aarya",348900);
SELECT * FROM bank_accounts;

START TRANSACTION;
UPDATE bank_accounts
SET account_balance = account_balance - 5000
WHERE account_no = 2472001;

SAVEPOINT after_debit;

UPDATE bank_accounts
SET account_balance = account_balance + 15000
WHERE account_no = 2472002;
SAVEPOINT after_credit;

COMMIT;

ROLLBACK;
    