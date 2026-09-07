-- 1) Display the details of all employees
SELECT * FROM EMPLOYEE;

-- 2) Display the depart information from department table
SELECT * FROM DEPARTMENT;

-- 3) Display the name and job for all the employees
SELECT NAME, JOB FROM EMPLOYEES;

-- 4) Display the name and salary for all the employees
SELECT NAME, SALARY FROM EMPLOYEES;

-- 5) Display the employee no and totalsalary for all the employees
SELECT EMPNO, SAL + NVL(COMM,0) AS TOTALSALARY FROM EMP;

-- 6) Display the employee name and annual salary for all employees
SELECT ENAME, SAL*12 AS ANNUAL_SALARY FROM EMP;

-- 7) Display the names of all the employees who are working in depart number 10
SELECT ENAME FROM EMP WHERE DEPTNO = 10;

-- 8) Display the names of all the employees who are working as clerks and drawing a salary more than 3000
SELECT ENAME FROM EMP WHERE JOB = 'CLERK' AND SAL > 3000;

-- 9) Display the employee number and name who are earning comman salary
SELECT EMPNO, ENAME FROM EMP WHERE COMM IS NOT NULL;

-- 10) Display the employee number and name who do not earn any common salary
SELECT EMPNO, ENAME FROM EMP WHERE COMM IS NULL;

-- 11) Display the names of employees who are working as clerks, salesman or analyst and drawing a salary more than 3000
SELECT ENAME FROM EMP WHERE JOB IN ('CLERK','SALESMAN','ANALYST') AND SAL > 3000;

-- 12) Display the names of the employees who are working in the company for the past 5 years
SELECT ENAME FROM EMP WHERE HIREDATE <= ADD_MONTHS(CURRENT_DATE, -60);

-- 13) Display the list of employees who have joined the company before 30-JUN-90 or after 31-DEC-90
SELECT ENAME FROM EMP WHERE HIREDATE < '1990-06-30' OR HIREDATE > '1990-12-31';

-- 14) Display current Date
SELECT CURRENT_DATE();

-- 15) Display the list of all users in your database
SHOW USERS;

-- 16) Display the names of all tables from current user
SHOW TABLES;

-- 17) Display the name of the current user
SELECT CURRENT_USER();

-- 18) Display the names of employees working in depart number 10 or 20 or 40 or employees working as CLERKS,SALESMAN or ANALYST
SELECT ENAME FROM EMP WHERE DEPTNO IN (10,20,40) OR JOB IN ('CLERK','SALESMAN','ANALYST');

-- 19) Display the names of employees whose name starts with alphabet S
SELECT ENAME FROM EMP WHERE ENAME LIKE 'S%';

-- 20) Display the Employee names for employees whose name ends with alphabet S
SELECT ENAME FROM EMP WHERE ENAME LIKE '%S';

-- 21) Display the names of employees whose names have second alphabet A in their names
SELECT ENAME FROM EMP WHERE ENAME LIKE '_A%';

-- 22) select the names of the employee whose names is exactly five characters in length
SELECT ENAME FROM EMP WHERE LENGTH(ENAME) = 5;

-- 23) Display the names of the employee who are not working as MANAGERS
SELECT ENAME FROM EMP WHERE JOB != 'MANAGER';

-- 24) Display the names of the employee who are not working as SALESMAN OR CLERK OR ANALYST
SELECT ENAME FROM EMP WHERE JOB NOT IN ('SALESMAN','CLERK','ANALYST');

-- 25) Display all rows from emp table. The system should wait after every screen full of information
SELECT * FROM EMP;

-- 26) Display the total number of employee working in the company
SELECT COUNT(*) FROM EMP;

-- 27) Display the total salary being paid to all employees
SELECT SUM(SAL) FROM EMP;

-- 28) Display the maximum salary from emp table
SELECT MAX(SAL) FROM EMP;

-- 29) Display the minimum salary from emp table
SELECT MIN(SAL) FROM EMP;

-- 30) Display the average salary from emp table
SELECT AVG(SAL) FROM EMP;

-- 31) Display the maximum salary being paid to CLERK
SELECT MAX(SAL) FROM EMP WHERE JOB = 'CLERK';

-- 32) Display the maximum salary being paid to depart number 20
SELECT MAX(SAL) FROM EMP WHERE DEPTNO = 20;

-- 33) Display the minimum salary being paid to any SALESMAN
SELECT MIN(SAL) FROM EMP WHERE JOB = 'SALESMAN';

-- 34) Display the average salary drawn by MANAGERS
SELECT AVG(SAL) FROM EMP WHERE JOB = 'MANAGER';

-- 35) Display the total salary drawn by ANALYST working in depart number 40
SELECT SUM(SAL) FROM EMP WHERE JOB = 'ANALYST' AND DEPTNO = 40;

-- 36) Display the names of the employee in order of salary
SELECT ENAME FROM EMP ORDER BY SAL ASC;

-- 37) Display the names of the employee in descending order of salary
SELECT ENAME FROM EMP ORDER BY SAL DESC;

-- 38) Display the names of the employee in order of employee name
SELECT ENAME FROM EMP ORDER BY ENAME ASC;

-- 39) Display empno,ename,deptno,sal sort the output first base on name and within name by deptno and with in deptno by sal
SELECT EMPNO, ENAME, DEPTNO, SAL FROM EMP ORDER BY ENAME, DEPTNO, SAL;

-- 40) Display name of the employee along with their annual salary(sal*12). Highest annual salary should appear first
SELECT ENAME, SAL*12 AS ANNUAL_SAL FROM EMP ORDER BY ANNUAL_SAL DESC;

-- 41) Display name,salary,hra,pf,da,total salary
SELECT ENAME, SAL, SAL*0.15 AS HRA, SAL*0.10 AS DA, SAL*0.05 AS PF, (SAL+SAL*0.15+SAL*0.10)-SAL*0.05 AS TOTAL FROM EMP;

-- 42) Display depart numbers and total number of employees working in each department
SELECT DEPTNO, COUNT(*) FROM EMP GROUP BY DEPTNO;

-- 43) Display the various jobs and total number of employees within each job group
SELECT JOB, COUNT(*) FROM EMP GROUP BY JOB;

-- 44) Display the depart numbers and total salary for each department
SELECT DEPTNO, SUM(SAL) FROM EMP GROUP BY DEPTNO;

-- 45) Display the depart numbers and max salary for each department
SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO;

-- 46) Display the various jobs and total salary for each job
SELECT JOB, SUM(SAL) FROM EMP GROUP BY JOB;

-- 48) Display the depart numbers with more than three employees in each dept
SELECT DEPTNO FROM EMP GROUP BY DEPTNO HAVING COUNT(*) > 3;

-- 49) Display the various jobs along with total salary for each of the jobs Where total salary is greater than 40000
SELECT JOB, SUM(SAL) FROM EMP GROUP BY JOB HAVING SUM(SAL) > 40000;

-- 50) Display the various jobs along with total number of employees in each job. The output should contain only those jobs with more than three employees
SELECT JOB, COUNT(*) FROM EMP GROUP BY JOB HAVING COUNT(*) > 3;

-- 51) Display the name of the employee who earns highest salary
SELECT ENAME FROM EMP WHERE SAL = (SELECT MAX(SAL) FROM EMP);

-- 52) Display the employee number and name for employee working as clerk and earning highest salary among clerks
SELECT EMPNO, ENAME FROM EMP WHERE JOB='CLERK' AND SAL = (SELECT MAX(SAL) FROM EMP WHERE JOB='CLERK');

-- 53) Display the names of salesman who earns a salary more than the highest salary of any clerk
SELECT ENAME FROM EMP WHERE JOB='SALESMAN' AND SAL > (SELECT MAX(SAL) FROM EMP WHERE JOB='CLERK');

-- 54) Display the names of clerks who earn a salary more than the lowest Salary of any salesman
SELECT ENAME FROM EMP WHERE JOB='CLERK' AND SAL > (SELECT MIN(SAL) FROM EMP WHERE JOB='SALESMAN');

-- 55) Display the names of the employees who earn highest salary in their respective departments
SELECT ENAME FROM EMP E WHERE SAL = (SELECT MAX(SAL) FROM EMP WHERE DEPTNO = E.DEPTNO);

-- 56) Display the names of the employees who earn highest salaries in their respective job groups
SELECT ENAME FROM EMP E WHERE SAL = (SELECT MAX(SAL) FROM EMP WHERE JOB = E.JOB);

-- 57) Display the employee names who are working in accounting department
SELECT ENAME FROM EMP WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME='ACCOUNTING');

-- 58) Display the employee names who are working in Chicago
SELECT ENAME FROM EMP WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC='CHICAGO');

-- 59) Display the Job groups having total salary greater than the maximum salary for managers
SELECT JOB FROM EMP GROUP BY JOB HAVING SUM(SAL) > (SELECT MAX(SAL) FROM EMP WHERE JOB='MANAGER');

-- 60) Display the names of employees from department number 10 with salary greater than that of any employee working in other department
SELECT ENAME FROM EMP WHERE DEPTNO=10 AND SAL > ANY (SELECT SAL FROM EMP WHERE DEPTNO != 10);

-- 61) Display the names of the employees from department number 10 with salary greater than that of all employee working in other departments
SELECT ENAME FROM EMP WHERE DEPTNO=10 AND SAL > ALL (SELECT SAL FROM EMP WHERE DEPTNO != 10);

-- 62) Display the names of the employees in Uppercase
SELECT UPPER(ENAME) FROM EMP;

-- 63) Display the names of the employees in Lowercase
SELECT LOWER(ENAME) FROM EMP;

-- 64) Display the names of the employees in Propercase
SELECT INITCAP(ENAME) FROM EMP;

-- 65) Display the length of Your name using appropriate function
SELECT LENGTH('CHANDANA') AS MY_NAME_LEN;

-- 66) Display the length of all the employee names
SELECT ENAME, LENGTH(ENAME) FROM EMP;

-- 67) select name of the employee concatenate with employee number
SELECT ENAME || '-' || EMPNO FROM EMP;

-- 68) extract 3 characters starting from 2 characters from the following string 'Oracle'
SELECT SUBSTR('Oracle',2,3);

-- 69) Find the First occurrence of character 'a' from the following string
SELECT POSITION('a' IN 'Computer Maintenance Corporation');

-- 70) Replace every occurrence of alphabet A with B in the string Allens
SELECT TRANSLATE('Allens','A','B');

-- 71) Display the information from emp table. Where job manager is found it should be displayed as boss
SELECT REPLACE(JOB,'MANAGER','BOSS') FROM EMP;

-- 72) Display empno,ename,deptno from emp table. Instead of display department numbers display the related department name
SELECT EMPNO, ENAME, DECODE(DEPTNO,10,'ACCOUNTING',20,'RESEARCH',30,'SALES',40,'OPERATIONS') AS DNAME FROM EMP;

-- 73) Display your age in days
SELECT DATEDIFF(DAY, '2003-01-01', CURRENT_DATE());

-- 74) Display your age in months
SELECT DATEDIFF(MONTH, '2003-01-01', CURRENT_DATE());

-- 75) Display the current date as 15th August Friday Nineteen Ninety Seven
SELECT TO_CHAR(CURRENT_DATE, 'DDth Month Day YYYY');

-- 76) Display output for each row from emp table: scott has joined the company on wednesday 13th August
SELECT ENAME || ' has joined the company on ' || TO_CHAR(HIREDATE, 'Day DDth Month YYYY') FROM EMP;

-- 77) Find the date for nearest saturday after current date
SELECT NEXT_DAY(CURRENT_DATE, 'SATURDAY');

-- 78) Display current time
SELECT CURRENT_TIME();

-- 79) Display the date three months Before the current date
SELECT ADD_MONTHS(CURRENT_DATE, -3);

-- 80) Display the common jobs from department number 10 and 20
SELECT JOB FROM EMP WHERE DEPTNO=10 INTERSECT SELECT JOB FROM EMP WHERE DEPTNO=20;

-- 81) Display the jobs found in department 10 and 20 Eliminate duplicate jobs
SELECT DISTINCT JOB FROM EMP WHERE DEPTNO IN (10,20);

-- 82) Display the jobs which are unique to department 10
SELECT JOB FROM EMP WHERE DEPTNO=10 MINUS SELECT JOB FROM EMP WHERE DEPTNO=20;

-- 84) Display the details of those employees who are in sales department and grade is 3
SELECT E.* FROM EMP E, SALGRADE S, DEPT D WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL AND E.DEPTNO=D.DEPTNO AND D.DNAME='SALES' AND S.GRADE=3;

-- 85) i)display the managers names ii)display the who are not managers
SELECT ENAME FROM EMP WHERE EMPNO IN (SELECT MGR FROM EMP);
SELECT ENAME FROM EMP WHERE EMPNO NOT IN (SELECT MGR FROM EMP WHERE MGR IS NOT NULL);

-- 86) Display those employee whose name contains not less than 4 characters
SELECT ENAME FROM EMP WHERE LENGTH(ENAME) >= 4;

-- 87) Display those department whose name start with "S" while the location name ends with "K"
SELECT DNAME FROM DEPT WHERE DNAME LIKE 'S%' AND LOC LIKE '%K';

-- 88) Display those employees whose manager name is JONES
SELECT E.ENAME FROM EMP E JOIN EMP M ON E.MGR = M.EMPNO WHERE M.ENAME='JONES';

-- 89) Display those employees whose salary is more than 3000 after giving 20% increment
SELECT ENAME FROM EMP WHERE SAL*1.2 > 3000;

-- 90) Display all employees while their dept names
SELECT E.ENAME, D.DNAME FROM EMP E JOIN DEPT D ON E.DEPTNO = D.DEPTNO;

-- 91) Display ename who are working in sales dept
SELECT ENAME FROM EMP WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME='SALES');

-- 92) Display employee name,deptname,salary and comm for those sal in between 2000 to 5000 while location is chicago
SELECT E.ENAME, D.DNAME, E.SAL, E.COMM FROM EMP E JOIN DEPT D ON E.DEPTNO=D.DEPTNO WHERE E.SAL BETWEEN 2000 AND 5000 AND D.LOC='CHICAGO';

-- 93) Display those employees whose salary greater than his manager salary
SELECT E.ENAME FROM EMP E, EMP M WHERE E.MGR=M.EMPNO AND E.SAL > M.SAL;

-- 94) Display those employees who are working in the same dept where his manager is work
SELECT E.ENAME FROM EMP E, EMP M WHERE E.MGR=M.EMPNO AND E.DEPTNO=M.DEPTNO;

-- 95) Display those employees who are not working under any manager
SELECT ENAME FROM EMP WHERE MGR IS NULL;

-- 96) Display grade and employees name for the dept no 10 or 30 but grade is not 4 while joined the company before 31-dec-82
SELECT S.GRADE, E.ENAME FROM EMP E, SALGRADE S WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL AND E.DEPTNO IN (10,30) AND S.GRADE != 4 AND E.HIREDATE < '1982-12-31';

-- 97) Update the salary of each employee by 10% increment who are not eligible for commission
UPDATE EMP SET SAL = SAL*1.10 WHERE COMM IS NULL;

-- 98) SELECT those employee who joined the company before 31-dec-82 while their dept location is newyork or Chicago
SELECT E.ENAME FROM EMP E JOIN DEPT D ON E.DEPTNO=D.DEPTNO WHERE E.HIREDATE < '1982-12-31' AND D.LOC IN ('NEW YORK','CHICAGO');

-- 99) DISPLAY EMPLOYEE NAME,JOB,DEPARTMENT,LOCATION FOR ALL WHO ARE WORKING AS MANAGER
SELECT E.ENAME, E.JOB, D.DNAME, D.LOC FROM EMP E JOIN DEPT D ON E.DEPTNO=D.DEPTNO WHERE E.JOB='MANAGER';

-- 100) DISPLAY THOSE EMPLOYEES WHOSE MANAGER NAME IS JONES AND ALSO DISPLAY THEIR MANAGER NAME
SELECT E.ENAME AS EMP_NAME, M.ENAME AS MANAGER_NAME FROM EMP E JOIN EMP M ON E.MGR=M.EMPNO WHERE M.ENAME='JONES';
