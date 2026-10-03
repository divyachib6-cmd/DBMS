CREATE DATABASE BankDB;
USE BankDB;

CREATE TABLE Customer(
    customer_id INT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    email VARCHAR(50) UNIQUE,
    age INT CHECK (age >= 18)
);

CREATE TABLE Account(
    account_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    balance INT DEFAULT 0,
    account_type VARCHAR(20) DEFAULT 'Savings',
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    CHECK (balance >= 0)
);

INSERT INTO Customer VALUES
(101, 'Rahul', 'rahul@gmail.com', 21),
(102, 'Priya', 'priya@gmail.com', 22),
(103, 'Aman', 'aman@gmail.com', 20),
(104, 'Neha', 'neha@gmail.com', 23),
(105, 'Riya', 'riya@gmail.com', 21);

INSERT INTO Account VALUES
(201, 101, 50000, 'Savings'),
(202, 102, 75000, 'Current'),
(203, 103, 30000, 'Savings'),
(204, 104, 90000, 'Savings'),
(205, 105, 45000, 'Current');

SELECT *
FROM Account
WHERE balance > 50000;

SELECT *
FROM Account
ORDER BY balance DESC;

SELECT SUM(balance) AS Total_Balance
FROM Account;

SELECT MAX(balance) AS Maximum_Balance,
       MIN(balance) AS Minimum_Balance
FROM Account;

SET SQL_SAFE_UPDATES = 0;

UPDATE Account
SET balance = 60000
WHERE account_id = 201;

DELETE FROM Account
WHERE balance < 35000;

SELECT * FROM Account;