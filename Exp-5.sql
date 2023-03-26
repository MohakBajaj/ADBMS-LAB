-- Experiment - 5
-- Objective: To understand the use of group by and having clause and execute the SQL commands using JOIN
CREATE DATABASE IF NOT EXISTS exp_5;
USE exp_5;
-- Create the table
CREATE TABLE IF NOT EXISTS dept(
    deptno INT NOT NULL,
    dname VARCHAR(50) NOT NULL,
    loc VARCHAR(50) NOT NULL,
    PRIMARY KEY(deptno)
);
CREATE TABLE IF NOT EXISTS emp(
    empno INT NOT NULL,
    ename VARCHAR(50) NOT NULL,
    job VARCHAR(50) NOT NULL,
    mgr INT,
    hiredate DATE NOT NULL,
    sal INT NOT NULL,
    comm INT,
    deptno INT NOT NULL,
    PRIMARY KEY(empno),
    FOREIGN KEY(deptno) REFERENCES dept(deptno)
);
-- Insert the data
INSERT INTO dept
VALUES (10, 'ACCOUNTING', 'NEW YORK'),
    (20, 'RESEARCH', 'DALLAS'),
    (30, 'SALES', 'CHICAGO'),
    (40, 'OPERATIONS', 'BOSTON');
INSERT INTO emp
VALUES (
        7369,
        'SMITH',
        'CLERK',
        7902,
        '1980-12-17',
        500,
        800,
        20
    ),
    (
        7499,
        'ALLEN',
        'SALESMAN',
        7698,
        '1981-02-20',
        1600,
        300,
        30
    ),
    (
        7521,
        'WARD',
        'SALESMAN',
        7698,
        '1981-02-22',
        1250,
        500,
        30
    ),
    (
        7566,
        'JONES',
        'MANAGER',
        7839,
        '1981-04-02',
        2975,
        NULL,
        20
    ),
    (
        7654,
        'MARTIN',
        'SALESMAN',
        7698,
        '1981-09-28',
        1250,
        1400,
        30
    ),
    (
        7698,
        'BLAKE',
        'MANAGER',
        7839,
        '1981-05-01',
        2850,
        NULL,
        30
    ),
    (
        7782,
        'CLARK',
        'MANAGER',
        7839,
        '1981-06-09',
        2450,
        NULL,
        10
    ),
    (
        7788,
        'SCOTT',
        'ANALYST',
        7566,
        '1982-12-09',
        3000,
        NULL,
        20
    ),
    (
        7839,
        'KING',
        'PRESIDENT',
        NULL,
        '1981-11-17',
        5000,
        NULL,
        10
    ),
    (
        7844,
        'TURNER',
        'SALESMAN',
        7698,
        '1981-09-08',
        1500,
        0,
        30
    ),
    (
        7876,
        'ADAMS',
        'CLERK',
        7788,
        '1983-01-12',
        1100,
        NULL,
        20
    ),
    (
        7900,
        'JAMES',
        'CLERK',
        7698,
        '1981-12-03',
        950,
        NULL,
        30
    ),
    (
        7902,
        'FORD',
        'ANALYST',
        7566,
        '1981-12-03',
        3000,
        NULL,
        20
    ),
    (
        7934,
        'MILLER',
        'CLERK',
        7782,
        '1982-01-23',
        1300,
        NULL,
        10
    );
-- 1. Write the SQL Queries for the following queries (use emp_table and dept_table of
-- Experiment 4).
-- 1. List the Deptno where there are no emps.
SELECT deptno
FROM dept
WHERE deptno NOT IN (
        SELECT deptno
        FROM emp
    );
-- 2. List the No.of emp’s and Avg salary within each department for each job.
SELECT deptno,
    job,
    COUNT(empno),
    AVG(sal)
FROM emp
GROUP BY deptno,
    job;
-- 3. Find the maximum average salary drawn for each job except for ‘President’.
SELECT MAX(sal)
FROM emp
WHERE sal IN (
        SELECT AVG(sal)
        FROM emp
        WHERE job <> 'PRESIDENT'
        GROUP BY job
    );
-- 4. List the department details where at least two emps are working.
SELECT *
FROM dept
WHERE deptno IN (
        SELECT deptno
        FROM emp
        GROUP BY deptno
        HAVING COUNT(empno) >= 2
    );
-- 5. List the no. of emps in each department where the no. is more than 3.
SELECT deptno,
    COUNT(*) AS No_of_emp
FROM emp
GROUP BY deptno
HAVING COUNT(*) > 3;
-- 6. List the names of the emps who are getting the highest sal dept wise.
SELECT deptno,
    ename,
    sal
FROM emp e
WHERE sal IN (
        SELECT MAX(sal)
        FROM emp
        GROUP BY deptno
    );
-- 7. List the Deptno and their average salaries for dept with the average salary less than the averages for all departments.
SELECT deptno,
    AVG(sal)
FROM emp
GROUP BY deptno
HAVING AVG(sal) < (
        SELECT AVG(sal)
        FROM emp
    );
-- 2. Execute the experiment 4 using sql join.
-- 1. List the details of the emps whose Salaries more than the employee BLAKE.
SELECT *
FROM emp
    RIGHT JOIN dept ON emp.deptno = dept.deptno
WHERE sal > (
        SELECT sal
        FROM emp
        WHERE ename = 'BLAKE'
    );
-- 2. List the emps whose Jobs are same as ALLEN.
SELECT *
FROM emp
    RIGHT JOIN dept ON emp.deptno = dept.deptno
WHERE job = (
        SELECT job
        FROM emp
        WHERE ename = 'ALLEN'
    );
-- 3. List the Emps whose Sal is same as FORD or SMITH in desc order of Names.
SELECT *
FROM emp
    RIGHT JOIN dept ON emp.deptno = dept.deptno
WHERE sal = (
        SELECT sal
        FROM emp
        WHERE ename = 'FORD'
    )
    OR sal = (
        SELECT sal
        FROM emp
        WHERE ename = 'SMITH'
    )
ORDER BY ename DESC;
-- 4. List the emps Whose Jobs are same as MILLER or Sal is more than ALLEN.
SELECT *
FROM emp
    RIGHT JOIN dept ON emp.deptno = dept.deptno
WHERE job = (
        SELECT job
        FROM emp
        WHERE ename = 'MILLER'
    )
    OR sal > (
        SELECT sal
        FROM emp
        WHERE ename = 'ALLEN'
    );
-- 5. Find the highest paid employee of sales department.
SELECT *
FROM emp
    RIGHT JOIN dept ON emp.deptno = dept.deptno
WHERE dept.dname = 'SALES'
    AND sal = (
        SELECT MAX(sal)
        FROM emp
            RIGHT JOIN dept ON emp.deptno = dept.deptno
        WHERE dept.dname = 'SALES'
    );
-- 6. List the employees who are senior to most recently hired employee working under king.
SELECT *
FROM emp
    RIGHT JOIN dept ON emp.deptno = dept.deptno
WHERE hiredate < (
        SELECT MAX(hiredate)
        FROM emp
            RIGHT JOIN dept ON emp.deptno = dept.deptno
        WHERE mgr = (
                SELECT empno
                FROM emp
                    RIGHT JOIN dept ON emp.deptno = dept.deptno
                WHERE ename = 'KING'
            )
    );
-- 7. List the names of the emps who are getting the highest sal dept wise.
SELECT *
FROM emp
    RIGHT JOIN dept ON emp.deptno = dept.deptno
WHERE sal IN (
        SELECT MAX(sal)
        FROM emp
        GROUP BY deptno
    );
-- 8. List the emps whose sal is equal to the average of max and minimum
SELECT *
FROM emp
    RIGHT Join dept ON emp.deptno = dept.deptno
WHERE sal = (
        SELECT (MAX(sal) + MIN(sal)) / 2
        FROM emp
    );
-- 9. List the emps who joined in the company on the same date.
SELECT *
FROM emp
    RIGHT JOIN dept ON emp.deptno = dept.deptno
WHERE hiredate IN (
        SELECT hiredate
        FROM emp
        GROUP BY hiredate
        HAVING COUNT(hiredate) > 1
    );
-- 10. Find out the emps who joined in the company before their Managers
SELECT *
FROM emp e
    RIGHT JOIN dept ON e.deptno = dept.deptno
WHERE hiredate < (
        SELECT hiredate
        FROM emp
        WHERE empno = e.mgr
    );