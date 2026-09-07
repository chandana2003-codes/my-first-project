sql-- =================================
-- CLASS 3 - PRACTICE QUERIES
-- =================================

-- 1. WHERE + LOGICAL OPERATORS
SELECT * FROM employees WHERE salary > 10000;
SELECT * FROM employees WHERE department_id = 9;
SELECT * FROM employees WHERE salary > 5000 AND department_id = 6;
SELECT * FROM employees WHERE department_id = 9 OR department_id = 10;
SELECT * FROM employees WHERE salary BETWEEN 5000 AND 10000;
SELECT * FROM employees WHERE department_id IN (6, 9, 10);
SELECT * FROM employees WHERE first_name NOT IN ('Steven', 'Neena');

-- 2. ORDER BY
SELECT * FROM employees ORDER BY salary ASC;
SELECT * FROM employees ORDER BY salary DESC;
SELECT * FROM employees ORDER BY hire_date DESC;
SELECT * FROM employees ORDER BY department_id ASC, salary DESC;

-- 3. LIMIT / TOP
SELECT * FROM employees LIMIT 10;
SELECT TOP 5 * FROM employees;
SELECT * FROM employees ORDER BY salary DESC LIMIT 3; -- Top 3 highest paid
SELECT * FROM employees ORDER BY salary ASC LIMIT 3; -- Top 3 lowest paid

-- 4. AGGREGATE FUNCTIONS
SELECT COUNT(*) AS total_employees FROM employees;
SELECT SUM(salary) AS total_salary FROM employees;
SELECT AVG(salary) AS avg_salary FROM employees;
SELECT MAX(salary) AS max_salary, MIN(salary) AS min_salary FROM employees;
SELECT COUNT(DISTINCT department_id) AS total_departments FROM employees;

-- 5. GROUP BY
SELECT department_id, COUNT(*) AS emp_count FROM employees GROUP BY department_id;
SELECT department_id, AVG(salary) AS avg_sal FROM employees GROUP BY department_id;
SELECT department_id, SUM(salary) AS total_sal FROM employees GROUP BY department_id;
SELECT job_id, COUNT(*) FROM employees GROUP BY job_id;

-- 6. GROUP BY + HAVING
SELECT department_id, COUNT(*) AS emp_count 
FROM employees GROUP BY department_id HAVING COUNT(*) > 5;

SELECT department_id, AVG(salary) AS avg_sal
FROM employees GROUP BY department_id HAVING AVG(salary) > 8000;

SELECT department_id, SUM(salary) 
FROM employees GROUP BY department_id HAVING SUM(salary) > 50000;

-- 7. LIKE Operator
SELECT * FROM employees WHERE first_name LIKE 'J%'; -- J tho start
SELECT * FROM employees WHERE first_name LIKE '%a'; -- a tho end
SELECT * FROM employees WHERE first_name LIKE '%a%'; -- a unna anni
SELECT * FROM employees WHERE email LIKE '%king%';
SELECT * FROM employees WHERE phone_number LIKE '515%';

-- 8. COMBINED EXAMPLES
SELECT department_id, COUNT(*) 
FROM employees 
WHERE salary > 5000 
GROUP BY department_id 
HAVING COUNT(*) > 2 
ORDER BY COUNT(*) DESC 
LIMIT 5;

-- 9. TASK PREPARATION - STRING, NUMBER, DATE FUNCTIONS (EACH 10)
-- STRING FUNCTIONS
SELECT UPPER(first_name), LOWER(last_name), LENGTH(first_name) FROM employees LIMIT 5;
SELECT first_name || ' ' || last_name AS full_name FROM employees LIMIT 5; -- Concatenation
-- Will practice 10: UPPER, LOWER, LENGTH, TRIM, SUBSTR, REPLACE, CONCAT, INITCAP, REVERSE, LEFT/RIGHT

-- NUMBER FUNCTIONS  
SELECT salary, ROUND(salary), CEIL(salary), FLOOR(salary) FROM employees LIMIT 5;
-- Will practice 10: ROUND, CEIL, FLOOR, ABS, MOD, TRUNC, POWER, SQRT, GREATEST, LEAST

-- DATE FUNCTIONS
SELECT hire_date, YEAR(hire_date), MONTH(hire_date), DAY(hire_date) FROM employees LIMIT 5;
-- Will practice 10: CURRENT_DATE, YEAR, MONTH, DAY, DATEADD, DATEDIFF, MONTHS_BETWEEN, DAYNAME, LAST_DAY, NEXT_DAY