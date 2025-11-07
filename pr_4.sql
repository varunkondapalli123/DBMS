-- 1.  List the employees whose salary is divisible by 15. (use mod function)
SELECT * FROM emp WHERE MOD(sal, 15) = 0;

-- 2.  List the employees, whose hiredate is greater than 1982.01.01. (use to_date function)
SELECT * FROM emp WHERE TO_DATE('1982.01.01', 'YYYY.MM.DD') < hiredate;

-- 3.  List the employees where the second character of his name is 'A'. (use substr function)
SELECT * FROM emp WHERE SUBSTR(ename, 2, 1) = 'A';

-- 4.  List the employees whose name contains two 'L'-s. (use instr function)
SELECT * 
FROM emp 
WHERE INSTR(ename, 'L') <> 0 AND INSTR(SUBSTR(ename, INSTR(ename, 'L') + 1), 'L') <> 0;

-- 5.  List the last 3 characters of the employees' names. (use substr function)
SELECT SUBSTR(ename, LENGTH(ename) - 2, 3) FROM emp;

-- 7.  List the square root of the salaries rounded to 2 decimals 
-- and the integer part of it. (sqrt, round, trunc function)
SELECT ROUND(SQRT(sal), 2), TRUNC(ROUND(SQRT(sal))) FROM emp;

-- 8.  In which month was the hiredate of ADAMS? (give the name of the month) (date functions)
SELECT TO_CHAR(hiredate, 'MONTH') FROM emp WHERE ename = 'ADAMS';

-- 9.  Give the number of days since ADAMS's hiredate. (date arithmetic)
SELECT TO_NUMBER(TO_DATE(SYSDATE, 'YY.MM.DD') - hiredate) days FROM emp WHERE ename = 'ADAMS';
SELECT (TRUNC(SYSDATE) - hiredate) days FROM emp WHERE ename = 'ADAMS';

-- 12. List the employees whose salary is in category 1. (see Sal_cat table)
SELECT * FROM sal_cat;
CREATE TABLE sal_cat AS SELECT * FROM sal_cat;
SELECT * FROM emp, sal_cat WHERE sal BETWEEN lowest_sal AND highest_sal AND category = 1;
