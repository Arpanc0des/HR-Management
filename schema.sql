-- Database setup for the HR Management app.
-- Run this once before starting the app:
--   mysql -u root -p < schema.sql

CREATE DATABASE IF NOT EXISTS hr_management_db;
USE hr_management_db;

CREATE TABLE IF NOT EXISTS employee_tbl (
    employee_id    INT PRIMARY KEY,
    employee_name  VARCHAR(100) NOT NULL,
    employee_email VARCHAR(100) NOT NULL,
    employee_title VARCHAR(50)  NOT NULL DEFAULT 'employee'
);

CREATE TABLE IF NOT EXISTS salary_tbl (
    sid           INT PRIMARY KEY,
    uid           INT NOT NULL,
    salary_amount DOUBLE NOT NULL,
    FOREIGN KEY (uid) REFERENCES employee_tbl(employee_id)
);

-- A couple of rows to try the table view with.
INSERT IGNORE INTO employee_tbl VALUES
    (1, 'Ada Lovelace', 'ada@example.com', 'employee'),
    (2, 'Grace Hopper', 'grace@example.com', 'employee');

INSERT IGNORE INTO salary_tbl VALUES
    (1, 1, 55000),
    (2, 2, 62000);
