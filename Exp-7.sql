-- Title: 7. To understand the concepts of Index.
-- Objective: Students will be able to implement the concept ofindex.
-- Setup Database
CREATE DATABASE exp_7;
USE exp_7;
-- Table 
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
-- 1. Execute the following index related queries:
-- 1)Create  an  index  of  name  employee_idx  on  EMPLOYEES  with  column  Last_Name, Department_id  
CREATE INDEX employee_idx ON employee (last_name, department_id);
-- 2)Find the ROWID for the above table and create a unique index on employee_id column of the EMPLOYEES.
CREATE UNIQUE INDEX unique_employee_id ON employee (employee_id);
-- 3)Create a reverse index on employee_id column of the EMPLOYEES.
CREATE INDEX reverse_employee_id ON employee (employee_id DESC);
-- 4)Create a unique and composite index on employee_id and check whether there is duplicity of tuples or not.
CREATE UNIQUE INDEX unique_employee_id_composite ON employee (employee_id, last_name);
-- 5)Create  Function-based  indexes  defined  on  the  SQL  functions  
--  UPPER(column_name)  or LOWER(column_name) to facilitate case-insensitive searches(on column Last_Name).
ALTER TABLE employee
ADD COLUMN last_name_lower CHAR(30) GENERATED ALWAYS AS (LOWER(last_name)) VIRTUAL;
CREATE INDEX employee_lower_last_name ON employee (last_name_lower);
-- 6)Drop the function based index on column Last_Name
DROP INDEX employee_lower_last_name ON employee;