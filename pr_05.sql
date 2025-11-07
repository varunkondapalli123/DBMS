
SELECT * FROM sal_cat;

-- 13. List the employees whose salary category is an even number. (mod function)
SELECT  *
FROM emp, sal_cat
WHERE sal BETWEEN lowest_sal AND highest_sal AND MOD(category, 2) = 0;

-- 14. Give the number of days between the hiredate of KING and the hiredate of JONES.
SELECT k.hiredate - j.hiredate
FROM emp k, emp j
WHERE k.ename = 'KING' AND j.ename = 'JONES';

-- 15. Give the name of the day (e.g. Monday) which was the last day of the month in 
-- which KING's hiredate was. (last_day function)
SELECT to_char(last_day(hiredate), 'DAY')
FROM emp
WHERE ename = 'KING';

-- 17. Give the names of employees 
-- whose department name contains a letter 'C' and whose salary category is >= 4.
SELECT ename
FROM emp e, dept d, sal_cat sc
WHERE e.deptno = d.deptno AND sal BETWEEN sc.lowest_sal AND sc.highest_sal
    AND d.dname LIKE '%C%' AND sc.category >= 4;
    
-- 1.  Give the maximal salary. [max_sal]
SELECT MAX(sal) max_sal FROM emp;

-- 2.  Give the sum of all salaries. [sum_sal]
SELECT SUM(sal) sum_sal FROM emp;

-- 3.  Give the summarized salary and average salary on department 20. [sum_sal, avg_sal]
SELECT SUM(sal), AVG(sal) FROM emp WHERE deptno = 20;

-- 4.  How many different jobs do we have in the emp table? [num_jobs]
SELECT COUNT(DISTINCT job) FROM emp;

-- 5.  Give the number of employees whose salary is greater than 2000. [num_emps]
SELECT COUNT(*) num_emps
FROM emp
WHERE sal > 2000;

-- 6.  Give the average salary by departments. [deptno, avg_sal]
SELECT deptno, AVG(sal) avg_sal
FROM emp
GROUP BY deptno;

-- 7.  Give the location and average salary by departments. [deptno, loc, avg_sal]
SELECT d.deptno, d.loc, AVG(e.sal) avg_sal
FROM emp e, dept d
WHERE e.deptno = d.deptno
GROUP BY d.deptno, d.loc;

SELECT d.deptno, d.loc, avg_sal
FROM (SELECT deptno, AVG(sal) avg_sal
    FROM emp e
    GROUP BY deptno) r, dept d
WHERE r.deptno = d.deptno;

-- 8.  Give the number of employees by departments. [deptno, num_emps]
SELECT deptno, COUNT(*) num_emps
FROM emp
GROUP BY deptno;

-- 9.  Give the average salary by departments 
-- where this average is greater than 2000. [deptno, avg_sal]
SELECT deptno, AVG(sal) avg_sal
FROM emp
GROUP BY deptno
HAVING  AVG(sal) > 2000;

-- 10. Give the average salary by departments 
-- where the department has at least 4 employees. [deptno, avg_sal]
SELECT deptno, AVG(sal) avg_sal
FROM emp
GROUP BY deptno
HAVING COUNT(*) >= 4;

-- 11. Give the average salary and location by departments 
-- where the department has at least 4 employees. [deptno, loc, avg_sal]
SELECT d.deptno, d.loc, AVG(e.sal) avg_sal
FROM emp e, dept d
WHERE e.deptno = d.deptno
GROUP BY d.deptno, d.loc
HAVING COUNT(*) >= 4;
