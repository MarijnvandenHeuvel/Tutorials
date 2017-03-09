-- 1. 
SELECT last_name , salary 
FROM employees 
WHERE salary > (SELECT salary 
                FROM employees 
                WHERE employee_id = 103)
-- 2.
SELECT department_id , department_name 
FROM departments 
WHERE location_id = (SELECT location_id 
                     FROM  departments  
                     WHERE department_id = 90)                     
-- 3. 
SELECT last_name , hire_date 
FROM employees 
WHERE hire_date > (SELECT hire_date 
                   FROM employees 
                   WHERE employee_id = 101)
-- 4.  
SELECT first_name , last_name , department_id 
FROM employees 
WHERE department_id = (SELECT department_id 
                       FROM departments 
                       WHERE department_name = 'Sales')
-- 5.  
SELECT department_id , department_name 
FROM departments 
WHERE location_id = (SELECT location_id 
                     FROM locations 
                     WHERE city = 'Toronto')
-- 6.  
SELECT first_name , last_name , salary , department_id 
FROM employees 
WHERE department_id = (SELECT department_id 
                       FROM employees 
                       WHERE employee_id = 124)
AND employee_id <> 124
-- 7. 
SELECT first_name , last_name , salary , department_id 
FROM employees 
WHERE salary > (SELECT AVG(salary)
                FROM employees )
-- 8.  
SELECT first_name , last_name , salary , department_id 
FROM employees
WHERE salary IN (SELECT salary 
                 FROM employees 
                 WHERE department_id = 20)
-- 9.  
SELECT first_name , last_name , salary , department_id 
FROM employees
WHERE salary > ALL (SELECT salary 
                 FROM employees 
                 WHERE department_id = 50)
-- 10.  
SELECT first_name , last_name , salary , department_id 
FROM employees
WHERE salary > ANY (SELECT salary 
                    FROM employees 
                    WHERE department_id = 60)
-- 11. 
SELECT first_name , last_name , salary , department_id 
FROM employees
WHERE salary < ALL (SELECT salary 
                    FROM employees 
                    WHERE department_id = 90)
-- 12.
SELECT first_name , last_name , salary , department_id 
FROM employees
WHERE department_id IN (SELECT department_id 
                       FROM departments 
                       WHERE location_id = (SELECT location_id 
                                            FROM locations 
                                            WHERE city = 'Seattle'))
-- 13. 
SELECT first_name , last_name , salary , department_id 
FROM employees
WHERE        salary < (SELECT AVG(salary) 
                       FROM employees )
AND   department_id = (SELECT department_id 
                       FROM employees 
                       WHERE first_name = 'Kevin')