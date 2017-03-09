-- 1. 
-- a with join 
SELECT emp.first_name , emp.last_name , 
       emp.department_id ,    dep.department_name 
FROM employees emp JOIN departments dep 
ON emp.department_id = dep.department_id;
-- b without join
SELECT emp.first_name , emp.last_name , 
       emp.department_id, dep.department_name 
FROM employees emp, departments dep 
WHERE emp.department_id = dep.department_id;
-- 2. 
SELECT emp.first_name , emp.last_name , 
       emp.department_id ,  dep.department_name 
FROM employees emp JOIN departments dep 
ON emp.department_id = dep.department_id;
AND
      emp.department_id IN (50 , 90)
ORDER BY emp.last_name;
-- 3.
SELECT dep.department_name , loc.city , loc.state_province
FROM   departments dep JOIN locations loc 
ON  dep.location_id = loc.location_id;
 -- 4. 
SELECT concat(emp.last_name, ' ', emp.first_name) AS 'FULL_NAME', 
       dep.department_name , loc.city , loc.state_province
FROM   employees emp JOIN departments dep  
ON         emp.department_id = dep.department_id  
       JOIN locations loc
ON     dep.location_id = loc.location_id;
-- 5 
SELECT concat(emp.last_name, ' ', emp.first_name) AS 'FULL_NAME', 
       dep.department_name , loc.city , loc.state_province
FROM   employees emp JOIN departments dep  
ON         emp.department_id = dep.department_id 
        JOIN locations loc 
ON      dep.location_id = loc.location_id 
WHERE   emp.last_name LIKE  '%a%';
-- 6 
SELECT emp.last_name , emp.salary , job.job_title 
FROM employees emp 
JOIN jobs job ON  emp.salary 
BETWEEN job.min_salary AND job.max_salary;
-- 7.
SELECT emp.first_name , emp.last_name , emp.department_id ,  dep.department_name 
FROM employees emp LEFT OUTER JOIN departments dep 
ON emp.department_id = dep.department_id;
-- 8
SELECT emp.first_name , emp.last_name , emp.department_id ,  dep.department_name 
FROM employees emp RIGHT OUTER JOIN departments dep 
ON emp.department_id = dep.department_id;
-- 9 
SELECT emp.last_name AS 'EMPLOYEE_NAME', 
       mng.last_name AS 'MANAGER_NAME'
FROM   employees emp JOIN employees mng
ON  emp.manager_id = mng.employee_id;
-- 10 
SELECT emp.last_name AS 'EMPLOYEE_NAME', mng.last_name AS 'MANAGER_NAME'
FROM   employees emp LEFT OUTER JOIN employees mng
ON  emp.manager_id = mng.employee_id;
-- 11
SELECT emp.last_name , emp.first_name , emp.department_id 
FROM   employees emp JOIN employees specific_employee
ON  emp.department_id = specific_employee.department_id
AND    specific_employee.last_name = 'King';
-- AND emp.last_name <> ‘King’
-- 12
SELECT emp.last_name , emp.salary 
FROM   employees emp JOIN employees specific_emp
ON  emp.salary < specific_emp.salary 
AND  specific_emp.employee_id = 103;