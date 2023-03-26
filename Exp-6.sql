-- Experiment - 6
-- Objective: Students will be able to implement the concept of views.
CREATE DATABASE IF NOT EXISTS exp_6;
USE exp_6;
-- 1. Create table of table name: EMPLOYEES and add 6 rows
-- Column Name Data Type Width Attributes
-- Employee_id Character 10 PK
-- First_Name Character 30 NN
-- Last_Name Character 30 NN
-- DOB Date
-- Salary Number 25 NN
-- Department_id Character 10
CREATE TABLE IF NOT EXISTS employee(
    employee_id CHAR(10) NOT NULL,
    first_name CHAR(30) NOT NULL,
    last_name CHAR(30) NOT NULL,
    dob DATE,
    salary INT NOT NULL,
    department_id CHAR(10) NOT NULL,
    PRIMARY KEY(employee_id)
);
-- add 6 rows
INSERT INTO employee
VALUES (
        'E001',
        'John',
        'Doe',
        '1990-01-01',
        10000,
        'D001'
    ),
    (
        'E002',
        'Jane',
        'Doe',
        '1991-02-02',
        20000,
        'D0020'
    ),
    (
        'E003',
        'John',
        'Doe',
        '1992-03-03',
        30000,
        'D003'
    ),
    (
        'E004',
        'John',
        'Doe',
        '1993-04-04',
        40000,
        'D0020'
    ),
    (
        'E005',
        'John',
        'Doe',
        '1994-05-05',
        50000,
        'D005'
    ),
    (
        'E006',
        'John',
        'Doe',
        '1995-06-06',
        60000,
        'D006'
    );
-- 2. Execute the following view related queries:
-- 1) Create View of name emp_view and the column would be Employee_id, Last_Name, salary
-- and department_id only.:
CREATE VIEW emp_view AS
SELECT employee_id,
    last_name,
    salary,
    department_id
FROM employee;
SELECT *
FROM emp_view;
-- 2) Insert values into view(remove the NOT NULL constraint and then insert values):
ALTER TABLE employee
Modify salary INT;
ALTER TABLE employee
Modify last_name CHAR(30);
DESC employee;
INSERT INTO employee
VALUES (
        'E007',
        'John',
        'Doe',
        '1996-07-07',
        70000,
        'D007'
    );
SELECT *
FROM emp_view;
-- 3) Modify, delete and drop operations are performed on view.:
UPDATE emp_view
SET Department_id = 'D0020'
WHERE Employee_id = 'E004';
DELETE FROM emp_view
WHERE Last_Name = 'Doe'
    AND salary = 10000;
SELECT *
FROM emp_view;
DROP VIEW emp_view;
-- 4) Creates a view named salary_view. The view shows the employees in department 20 and
-- their annual salary.
CREATE VIEW salary_view AS
SELECT employee_id,
    first_name,
    last_name,
    salary * 12 AS annual_salary
FROM employee
WHERE department_id = 'D0020';
SELECT *
FROM salary_view;