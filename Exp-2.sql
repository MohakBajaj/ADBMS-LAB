-- 1. Creation of database and tables
-- create database exp-2
CREATE DATABASE IF NOT EXISTS exp_2;
USE exp_2;
-- Create the tables described below:
-- Client Master 1
CREATE TABLE IF NOT EXISTS CLIENT_MASTER_1 (
    CLIENTNO VARCHAR(6) CHECK (CLIENTNO LIKE 'C%'),
    NAME VARCHAR(20) NOT NULL,
    ADDRESS_1 VARCHAR(30) NOT NULL,
    ADDRESS_2 VARCHAR(30) NOT NULL,
    CITY VARCHAR(15) NOT NULL,
    PINCODE INT NOT NULL,
    STATE VARCHAR(15) NOT NULL,
    BALDUE DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (CLIENTNO)
);
-- Product Master 1
CREATE TABLE IF NOT EXISTS PRODUCT_MASTER_1 (
    PRODUCTNO VARCHAR(6) CHECK (PRODUCTNO LIKE 'P%'),
    DESCRIPTION VARCHAR(15) NOT NULL,
    PROFITPERCENT DECIMAL(4, 2) NOT NULL,
    UNIT_MEASURE VARCHAR(10) NOT NULL,
    QTYONHAND INT NOT NULL,
    REORDERL_VL INT NOT NULL,
    SELLPRICE DECIMAL(8, 2) NOT NULL,
    COSTPRICE DECIMAL(8, 2) NOT NULL,
    PRIMARY KEY (PRODUCTNO)
);
-- Salesman Master 1
CREATE TABLE IF NOT EXISTS SALESMAN_MASTER_1 (
    SALESMANNO VARCHAR(6) CHECK (SALESMANNO LIKE 'S%'),
    SALESMANNAME VARCHAR(20) NOT NULL,
    ADDRESS_1 VARCHAR(30) NOT NULL,
    ADDRESS_2 VARCHAR(30),
    CITY VARCHAR(20),
    PINCODE INT,
    STATE VARCHAR(20),
    SALAMT REAL NOT NULL CHECK (SALAMT > 0),
    TGTTOGET DECIMAL NOT NULL CHECK (TGTTOGET > 0),
    YTDSALES DOUBLE(6, 2) NOT NULL,
    REMARKS VARCHAR(60),
    PRIMARY KEY (SALESMANNO)
);
-- Misc Author Record - Mohak Bajaj
CREATE TABLE IF NOT EXISTS CREATOR (NAME VARCHAR(20), SAPID INT(9));
INSERT INTO CREATOR
VALUES ('Mohak Bajaj', 500093079);
SELECT *
FROM CREATOR;
-- 2. populate the tables with data with random data
-- Client Master 1
INSERT INTO CLIENT_MASTER_1
VALUES (
        'C00001',
        'Mohak Bajaj',
        'Bangalore',
        '560001',
        'Karnataka',
        560001,
        'Karnataka',
        25000
    ),
    (
        'C00002',
        'Mohak Bajaj',
        'Bangalore',
        '560001',
        'Karnataka',
        560001,
        'Karnataka',
        25000
    ),
    (
        'C00003',
        'Mohak Bajaj',
        'Bangalore',
        '560001',
        'Karnataka',
        560001,
        'Karnataka',
        25000
    ),
    (
        'C00004',
        'Mohak Bajaj',
        'Bangalore',
        '560001',
        'Karnataka',
        560001,
        'Karnataka',
        25000
    ),
    (
        'C00005',
        'Mohak Bajaj',
        'Bangalore',
        '560001',
        'Karnataka',
        560001,
        'Karnataka',
        25000
    ),
    (
        'C00006',
        'Mohak Bajaj',
        'Bangalore',
        '560001',
        'Karnataka',
        560001,
        'Karnataka',
        25000
    );
-- Product Master 1
INSERT INTO PRODUCT_MASTER_1
VALUES (
        'P00001',
        'Laptop',
        10,
        'Pcs',
        100,
        10,
        10000,
        9000
    ),
    (
        'P00002',
        'Mobile',
        10,
        'Pcs',
        100,
        10,
        10000,
        9000
    ),
    (
        'P00003',
        'Tablet',
        10,
        'Pcs',
        100,
        10,
        10000,
        9000
    ),
    (
        'P00004',
        'Laptop',
        10,
        'Pcs',
        100,
        10,
        10000,
        9000
    ),
    (
        'P00005',
        'Laptop',
        10,
        'Pcs',
        100,
        10,
        10000,
        9000
    ),
    (
        'P00006',
        'Laptop',
        10,
        'Pcs',
        100,
        10,
        10000,
        9000
    );
-- Salesman Master 1
INSERT INTO SALESMAN_MASTER_1
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
-- 3. Display the content of each table
SELECT *
FROM CLIENT_MASTER_1;
SELECT *
FROM PRODUCT_MASTER_1;
SELECT *
FROM SALESMAN_MASTER_1;
-- 4.Create table AUTHOR 
CREATE TABLE IF NOT EXISTS AUTHOR (
    AUTHOR_ID VARCHAR(5),
    LASTNAME VARCHAR(15) NOT NULL,
    FIRSTNAME VARCHAR(15) NOT NULL,
    EMAIL VARCHAR(40),
    CITY VARCHAR(15),
    COUNTRY VARCHAR(15),
    PRIMARY KEY (AUTHOR_ID)
);
-- 5. Create Table BOOK
CREATE TABLE IF NOT EXISTS BOOK (
    BOOK_ID VARCHAR(5) CHECK (BOOK_ID like 'B%'),
    BOOK_TITLE VARCHAR(15) NOT NULL,
    COPIES INT CHECK (COPIES > 2),
    PRIMARY KEY (BOOK_ID)
);
-- 6. Create table AUTHOR_LIST
CREATE TABLE IF NOT EXISTS AUTHOR_LIST (
    AUTHOR_ID VARCHAR(5),
    BOOK_ID VARCHAR(5),
    ROLE VARCHAR(15),
    PRIMARY KEY (AUTHOR_ID, BOOK_ID),
    FOREIGN KEY (AUTHOR_ID) REFERENCES AUTHOR(AUTHOR_ID),
    FOREIGN KEY (BOOK_ID) REFERENCES BOOK(BOOK_ID)
);
-- 7. Add four records in each tables AUTHOR, BOOK, AUTHOR_LIST.
INSERT INTO AUTHOR
VALUES (
        'A001',
        'Bajaj',
        'Mohak',
        'mb@gmail.com',
        'delhi',
        'india'
    ),
    (
        'A002',
        'Bajaj',
        'Mohak',
        'xyz@gmail.com',
        'delhi',
        'india'
    ),
    (
        'A003',
        'Bajaj',
        'Mohak',
        'abc@gmail.com',
        'delhi',
        'india'
    ),
    (
        'A004',
        'Bajaj',
        'Mohak',
        'qqq@gmauil.com',
        'delhi',
        'india'
    );
INSERT INTO BOOK
VALUES ('B001', 'Book1', 10),
    ('B002', 'Book2', 10),
    ('B003', 'Book3', 10),
    ('B004', 'Book4', 10);
INSERT INTO AUTHOR_LIST
VALUES ('A001', 'B002', 'author'),
    ('A002', 'B003', 'co-author'),
    ('A003', 'B004', 'author'),
    ('A004', 'B001', 'author');
SELECT *
FROM AUTHOR;
SELECT *
FROM BOOK;
SELECT *
FROM AUTHOR_LIST;
-- 8. Alter  structure  of  table  AUTHOR_LIST  add  the  field  Publisher  data  type  of  30 Character.
ALTER TABLE AUTHOR_LIST
ADD PUBLISHER VARCHAR(30);