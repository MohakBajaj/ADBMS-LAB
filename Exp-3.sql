-- Experiment - 3 
-- Objective: To understand the use of sql subquery.
-- 1. Create the following table.
--    Supplier-(scode,sname,scity,turnover)
--    Part-(pcode,weigh,color,cost,sellingprice)
--    Supplier_Part-(scode,pcode,qty)
-- 2. Populate the table
-- 3. Write appropriate SQL Statement for the following:
--     1. Get the supplier number and part number in ascending order of supplier number.
--     2. Get the details of supplier who operate from Bombay with turnover 50.
--     3. Get the total number of supplier.
--     4. Get the part number weighing between 25 and 35.
--     5. Get the supplier number whose turnover is null.
--     6. Get the part number that cost 20, 30 or 40 rupees.
--     7. Get the total quantity of part 2 that is supplied.
--     8. Get the name of supplier who supply part 2.
--     9. Get the part number whose cost is greater than the average cost.
--     10. Get the supplier number and turnover in descending order of turnover.
-- Initialize the Datbase
CREATE DATABASE IF NOT EXISTS exp_3;
USE exp_3;
-- Create the table
CREATE TABLE IF NOT EXISTS supplier(
    scode INT NOT NULL,
    sname VARCHAR(50) NOT NULL,
    scity VARCHAR(50) NOT NULL,
    turnover INT NOT NULL,
    PRIMARY KEY(scode)
);
CREATE TABLE IF NOT EXISTS part(
    pcode INT NOT NULL,
    weigh INT NOT NULL,
    color VARCHAR(50) NOT NULL,
    cost INT NOT NULL,
    sellingprice INT NOT NULL,
    PRIMARY KEY(pcode)
);
CREATE TABLE IF NOT EXISTS supplier_part(
    scode INT NOT NULL,
    pcode INT NOT NULL,
    qty INT NOT NULL,
    PRIMARY KEY(scode, pcode),
    FOREIGN KEY(scode) REFERENCES supplier(scode),
    FOREIGN KEY(pcode) REFERENCES part(pcode)
);
-- Populate the table with fake data
INSERT INTO supplier(scode, sname, scity, turnover)
VALUES (1, 'Supplier 1', 'Mumbai', 100),
    (2, 'Supplier 2', 'Delhi', 200),
    (3, 'Supplier 3', 'Mumbai', 300),
    (4, 'Supplier 4', 'Mumbai', 400),
    (5, 'Supplier 5', 'Delhi', 500),
    (6, 'Supplier 6', 'Mumbai', 600),
    (7, 'Supplier 7', 'Delhi', 700),
    (8, 'Supplier 8', 'Mumbai', 800),
    (9, 'Supplier 9', 'Delhi', 900),
    (10, 'Supplier 10', 'Mumbai', 1000);
INSERT INTO part(pcode, weigh, color, cost, sellingprice)
VALUES (1, 10, 'Red', 10, 20),
    (2, 20, 'Blue', 20, 30),
    (3, 30, 'Green', 30, 40),
    (4, 40, 'Yellow', 40, 50),
    (5, 50, 'Black', 50, 60),
    (6, 60, 'White', 60, 70),
    (7, 70, 'Pink', 70, 80),
    (8, 80, 'Orange', 80, 90),
    (9, 90, 'Purple', 90, 100),
    (10, 100, 'Brown', 100, 110);
INSERT INTO supplier_part(scode, pcode, qty)
VALUES (1, 10, 24),
    (1, 2, 23),
    (2, 3, 35),
    (2, 1, 32),
    (3, 4, 45),
    (3, 5, 43),
    (4, 6, 56),
    (4, 7, 54),
    (5, 8, 67),
    (5, 9, 65),
    (6, 10, 78),
    (6, 1, 76),
    (7, 2, 89),
    (7, 3, 87),
    (8, 4, 90),
    (8, 5, 98),
    (9, 6, 109),
    (9, 7, 107),
    (10, 8, 120),
    (10, 9, 118);
-- 1. Get the supplier number and part number in ascending order of supplier number.
SELECT scode,
    pcode
FROM supplier_part
ORDER BY scode ASC;
-- 2. Get the details of supplier who operate from Bombay with turnover 50.
SELECT *
FROM supplier
WHERE scity = 'Mumbai'
    AND turnover = 50;
-- 3. Get the total number of supplier.
SELECT COUNT(*)
FROM supplier;
-- 4. Get the part number weighing between 25 and 35.
SELECT pcode
FROM part
WHERE weigh BETWEEN 25 AND 35;
-- 5. Get the supplier number whose turnover is null.
SELECT scode
FROM supplier
WHERE turnover IS NULL;
-- 6. Get the part number that cost 20, 30 or 40 rupees.
SELECT pcode
FROM part
WHERE cost IN (20, 30, 40);
-- 7. Get the total quantity of part 2 that is supplied.
SELECT SUM(qty)
FROM supplier_part
WHERE pcode = 2;
-- 8. Get the name of supplier who supply part 2.
SELECT sname
FROM supplier
WHERE scode IN (
        SELECT scode
        FROM supplier_part
        WHERE pcode = 2
    );
-- 9. Get the part number whose cost is greater than the average cost.
SELECT pcode
FROM part
WHERE cost > (
        SELECT AVG(cost)
        FROM part
    );
-- 10. Get the supplier number and turnover in descending order of turnover.
SELECT scode,
    turnover
FROM supplier
ORDER BY turnover DESC;