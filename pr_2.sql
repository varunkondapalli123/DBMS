
SELECT * FROM emp;
SELECT * FROM dept;

CREATE TABLE emp AS SELECT * FROM kotroczo.emp;
CREATE TABLE dept AS SELECT * FROM kotroczo.dept;

-- 1.  List the employees whose salary is greater than 2800.
SELECT * FROM emp WHERE sal >= 2800;

-- 2.  List the employees working on department 10 or 20.
SELECT ename FROM emp WHERE deptno IN (10, 20);
SELECT ename FROM emp WHERE deptno = 10 OR deptno = 20;

-- 3.  List the employees whose commission is greater than 600.
SELECT * FROM emp WHERE comm >= 600;

-- 4.  List the employees whose commission is NOT greater than 600.
SELECT * FROM emp WHERE comm <= 600 OR comm IS NULL;

-- 5.  List the employees whose commission is not known (that is NULL).
SELECT * FROM emp WHERE comm IS NULL;

-- 6.  List the jobs of the employees (with/without duplication).
SELECT DISTINCt job FROM emp;
SELECT job FROM emp;

-- 7.  Give the name and double salary of employees working on department 10.
SELECT ename, sal*2 "double sallary" FROM emp WHERE deptno = 10;

-- 8.  List the employees whose hiredate is greater than 1982.01.01.
SELECT * FROM emp WHERE hiredate > TO_DATE('1982.01.01', 'YYYY.MM.DD');

-- 9.  List the employees who doesn't have a manager.
SELECT * FROM emp WHERE mgr IS NULL;

-- 10. List the employees whose name contains a letter 'A'.
SELECT * FROM emp WHERE ename LIKE '%A%';

-- 11. List the employees whose name contains two letters 'L'.
SELECT * FROM emp WHERE ename LIKE '%L%L%';

-- 13. List the name and salary of employees ordered by salary.
SELECT ename, sal FROM emp ORDER BY sal;
SELECT ename, sal FROM emp ORDER BY 2;

-- 14. List the name and salary of employees ordered by salary in descending order and 
--  within that order, ordered by name in ascending order.
SELECT ename, sal FROM emp ORDER BY sal DESC, ename ASC;

-- 15. List the employees whose manager is KING. (reading empno of KING from monitor)
SELECT empno FROM emp WHERE ename = 'KING';
SELECT ename FROM emp WHERE mgr = 7839;

-- 16. List the employees whose manager is KING. (without reading from monitor)
SELECT ename FROM emp WHERE mgr = (SELECT empno FROM emp WHERE ename = 'KING');

-- 17. Give the names of employees who are managers of someone, but whose job is not 'MANAGER'.
SELECT DISTINCT boss.ename
FROM emp boss, emp sub
WHERE boss.empno = sub.mgr AND boss.job != 'MANAGER';

-- 18. List the names of employees who has greater salary than his manager.
SELECT sub.ename
FROM emp boss, emp sub
WHERE boss.empno = sub.mgr and sub.sal > boss.sal;

-- 19. List the employees whose manager's manager is KING.
SELECT sub.ename
FROM emp sboss, emp boss, emp sub
WHERE sboss.empno = boss.mgr AND boss.empno = sub.mgr AND sboss.ename = 'KING';

-- 20. List the employees whose department's location is DALLAS or CHICAGO?
SELECT *
FROM emp, dept
WHERE emp.deptno = dept.deptno AND LOC IN ('DALLAS', 'CHICAGO');
