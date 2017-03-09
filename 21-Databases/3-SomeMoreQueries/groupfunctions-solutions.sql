-- 1. 
SELECT MIN(last_name)
FROM employees 
-- 2.  
SELECT MAX(last_name)
FROM employees 
-- 3.  
SELECT COUNT(*) FROM employees 
-- 4. 
SELECT COUNT(commission_pct) FROM employees 
-- 5. 
SELECT COUNT(*) - COUNT(commission_pct) FROM employees
-- 6. 
SELECT MIN(salary) , MAX(salary) , AVG(salary)
FROM employees 
-- 7.  
-- a 
SELECT department_id , AVG(salary)
FROM employees 
GROUP BY department_id 
-- b 
SELECT department_id , AVG(salary)
FROM employees 
WHERE department_id IN (50, 80)
GROUP BY department_id
-- 8.  
-- a 
SELECT job_id , COUNT(*)
FROM employees 
GROUP BY job_id 
-- b 
SELECT job_id , COUNT(*)
FROM employees 
WHERE salary > 10000
GROUP BY job_id 
-- c 
SELECT job_id , COUNT(*)
FROM employees 
WHERE salary > 10000
GROUP BY job_id 
HAVING count(*) > 2 
-- 9.  
SELECT AVG(salary) , department_id , job_id 
FROM employees 
GROUP BY department_id , job_id 
-- 10.
-- b 
SELECT MAX(salary) , manager_id 
FROM employees
GROUP BY manager_id 
-- b 
SELECT MAX(salary) , manager_id 
FROM employees 
GROUP BY manager_id 
HAVING MAX(salary) > 10000
-- 11. 
SELECT MIN(salary) , job_id 
FROM employees 
GROUP BY job_id
HAVING MIN(salary) > 7000   
-- 12.
SELECT AVG(salary) , department_id 
FROM employees 
WHERE department_id BETWEEN 20 AND 80 
GROUP BY department_id 
HAVING AVG(salary) > 9000