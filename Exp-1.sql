-- 1 Creation of database and tables
-- create database exp-1
CREATE DATABASE IF NOT EXISTS exp_1;
USE exp_1;
-- create table CLIENT_MASTER
CREATE TABLE IF NOT EXISTS CLIENT_MASTER (
    CLIENTNO VARCHAR(6),
    NAME VARCHAR(20),
    CITY VARCHAR(15),
    PINCODE INT,
    STATE VARCHAR(15),
    BALDUE DECIMAL(10, 2)
);
-- create table PRODUCT_MASTER
CREATE TABLE IF NOT EXISTS PRODUCT_MASTER (
    PRODUCTNO VARCHAR(6),
    DESCRIPTION VARCHAR(15),
    PROFITPERCENT DECIMAL(4, 2),
    UNIT_MEASURE VARCHAR(10),
    QTYONHAND INT,
    REORDERL_VL INT,
    SELLPRICE DECIMAL(8, 2),
    COSTPRICE DECIMAL(8, 2)
);
-- create table SALESMAN_MASTER
CREATE TABLE IF NOT EXISTS SALESMAN_MASTER (
    SALESMANNO VARCHAR(6),
    SALESMANNAME VARCHAR(20),
    ADDRESS_1 VARCHAR(30),
    ADDRESS_2 VARCHAR(30),
    CITY VARCHAR(20),
    PINCODE INT,
    STATE VARCHAR(20),
    SALAMT REAL,
    TGTTOGET DECIMAL,
    YTDSALES DOUBLE(6, 2),
    REMARKS VARCHAR(60)
);
-- 2 Inserting Data into tables
-- insert data into CLIENT_MASTER
INSERT INTO CLIENT_MASTER
VALUES (
        'C00001',
        'Ivan bayross',
        'Mumbai',
        '400054',
        'Maharashtra',
        15000
    ),
    (
        'C00002',
        'Mamta muzumdar',
        'Madras',
        '780001',
        'Tamil nadu',
        0
    ),
    (
        'C00003',
        'Chhaya bankar',
        'Mumbai',
        '400057',
        'Maharashtra',
        5000
    ),
    (
        'C00004',
        'Ashwini joshi',
        'Bangalore',
        '560001',
        'Karnataka',
        0
    ),
    (
        'C00005',
        'Hansel colaco',
        'Mumbai',
        '400060',
        'Maharashtra',
        2000
    ),
    (
        'C00006',
        'Deepak sharma',
        'Mangalore',
        '560050',
        'Karnataka',
        0
    );
-- insert data into PRODUCT_MASTER
INSERT INTO PRODUCT_MASTER
VALUES (
        'P00001',
        'T-Shirt',
        5,
        'Piece',
        200,
        50,
        350,
        250
    ),
    ('P0345', 'Shirts', 6, 'Piece', 150, 50, 500, 350),
    (
        'P06734',
        'Cotton jeans',
        5,
        'Piece',
        100,
        20,
        600,
        450
    ),
    ('P07865', 'Jeans', 5, 'Piece', 100, 20, 750, 500),
    (
        'P07868',
        'Trousers',
        2,
        'Piece',
        150,
        50,
        850,
        550
    ),
    (
        'P07885',
        'Pull Overs',
        2.5,
        'Piece',
        80,
        30,
        700,
        450
    ),
    (
        'P07965',
        'Denim jeans',
        4,
        'Piece',
        100,
        40,
        350,
        250
    ),
    (
        'P07975',
        'Lycra tops',
        5,
        'Piece',
        70,
        30,
        300,
        175
    ),
    (
        'P08865',
        'Skirts',
        5,
        'Piece',
        100,
        30,
        450,
        300
    );
-- insert data into SALESMAN_MASTER
INSERT INTO SALESMAN_MASTER
VALUES (
        'S00001',
        'Aman',
        'A/14',
        'Worli',
        'Mumbai',
        400002,
        'Maharashtra',
        3000,
        50000,
        0,
        'Good'
    ),
    (
        'S00002',
        'Omkar',
        '65',
        'Nariman',
        'Mumbai',
        400001,
        'Maharashtra',
        3500,
        50000,
        0,
        'Good'
    ),
    (
        'S00003',
        'Raj',
        'P-7',
        'Bandra',
        'Mumbai',
        400032,
        'Maharashtra',
        3000,
        50000,
        0,
        'Good'
    ),
    (
        'S00004',
        'Ashish',
        'A/5',
        'Juhu',
        'Mumbai',
        400044,
        'Maharashtra',
        3500,
        50000,
        0,
        'Good'
    );
-- 3 Data Retrival
-- a. Find out the names of all the clients.
SELECT NAME
FROM CLIENT_MASTER;
-- b. Retrieve the entire contents of the Client_Master table.
SELECT *
FROM CLIENT_MASTER;
-- c. Retrieve the list of names, city and the state of all the clients.
SELECT NAME,
    CITY,
    STATE
FROM CLIENT_MASTER;
-- d. List the various products available from the Product_Master table.
SELECT DESCRIPTION
FROM PRODUCT_MASTER;
-- e. List all the clients who are located in Mumbai.
SELECT *
FROM CLIENT_MASTER
WHERE CITY = 'Mumbai';
-- f. Find the names of salesman who have a salary equal to Rs.3000.
SELECT SALESMANNAME
FROM SALESMAN_MASTER
WHERE SALAMT = 3000;
-- 4 Data Updatation
-- a. Change the city of ClientNo ‘C00005’ to ‘Bangalore’.
UPDATE CLIENT_MASTER
SET CITY = 'Bangalore'
WHERE CLIENTNO = 'C00005';
-- b. Change the BalDue of ClientNo ‘C00001’ to Rs.1000.
UPDATE CLIENT_MASTER
SET BALDUE = 1000
WHERE CLIENTNO = 'C00001';
-- c. Change the cost price of ‘Trousers’ to rs.950.00.
UPDATE PRODUCT_MASTER
SET COSTPRICE = 950
WHERE DESCRIPTION = 'Trousers';
-- d. Change the city of the salesman to Pune.
UPDATE SALESMAN_MASTER
SET CITY = 'Pune';
-- 5 Data Deletion
-- a. Delete all salesman from the Salesman_Master whose salaries are equal to Rs.3500.
DELETE FROM SALESMAN_MASTER
WHERE SALAMT = 3500;
-- b. Delete all products from Product_Master where the quantity on hand is equal to 100.
DELETE FROM PRODUCT_MASTER
WHERE QTYONHAND = 100;
-- c. Delete from Client_Master where the column state holds the value ‘Tamil Nadu’.
DELETE FROM CLIENT_MASTER
WHERE STATE = 'Tamil Nadu';
-- 6 Data Alteration
-- a. Add a column called ‘Telephone’ of data type integer to the Client_Master table.
ALTER TABLE CLIENT_MASTER
ADD TELEPHONE INT;
-- b. Change the size off SellPrice column in Product _Master to 10, 2.
ALTER TABLE PRODUCT_MASTER
MODIFY SELLPRICE DECIMAL(10, 2);
-- 7 Deletion on Table Structure with its Data
-- a. Destroy the table Client_Master along with its data.
DROP TABLE CLIENT_MASTER;
-- 8 Rename Table
-- a. Change the name of the Salesman_Master to sman_mast.
RENAME TABLE SALESMAN_MASTER TO sman_mast;