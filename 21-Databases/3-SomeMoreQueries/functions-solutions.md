-- 1. LOWER / UPPER
SELECT LOWER(first_name) , UPPER(last_name) 
FROM employees 
WHERE employee_id BETWEEN 80 AND 150 
-- 2. LOWER / UPPER
SELECT first_name , last_name 
FROM employees 
WHERE UPPER(last_name) = 'KING'
-- or 
SELECT first_name , last_name 
FROM employees 
WHERE LOWER(last_name) = 'king'
-- 3. CONCAT
-- a
SELECT CONCAT (first_name , last_name)
FROM employees 
-- b 
SELECT CONCAT(first_name , CONCAT(last_name , hire_date))
FROM employees 
-- 4. SUBSTR / LENGTH
-- a 
SELECT first_name , last_name , 
    concat(SUBSTR(first_name , 1 , 1), SUBSTR(last_name , 1 , 3), '@oracle.com')
FROM employees 
-- b 
SELECT first_name , last_name , 
       concat(SUBSTR(first_name , 1 , 1), SUBSTR(last_name , LENGTH(last_name)-2 , 3), '@oracle.com')
FROM employees 
-- 5. LENGTH
SELECT last_name 
FROM employees 
WHERE LENGTH(last_name) > 8 
-- 6. REPLACE
-- a 
SELECT first_name , last_name , REPLACE(phone_number , '515', '815')
FROM employees 
-- b 
SELECT first_name , last_name , concat(REPLACE(SUBSTR(phone_number , 1 ,3) , '515', '815'), SUBSTR(phone_number , 4))
FROM employees 
-- 7. ROUND / TRUNC 
SELECT first_name , salary , salary * 1.1234 , ROUND(salary * 1.1234 , 0) , floor(salary * 1.1234 ) 
FROM employees 
-- 8. ADD_MONTHS
SELECT first_name , hire_date , DATE_ADD(hire_date, interval -10 day) , DATE_ADD(hire_date, interval 10 day), datediff(hire_date, now()) 
FROM employees 
-- 9. MONTHS YEARS BETWEEN
SELECT first_name , last_name , hire_Date , 
datediff(now() , hire_date ) / 12 , 
datediff(now() , hire_date ) / 365 
FROM employees
-- 10. ADD_MONTHS
SELECT first_name , hire_date ,  DATE_ADD(hire_date, interval 12 month)
FROM employees 
-- 11. DATES
SELECT first_name , hire_date ,  year(hire_date), month(hire_date)
FROM employees 
-- 12. DATES
SELECT first_name , hire_date ,  day(hire_date), year(hire_date)
FROM employees
-- 13. FORMATTING
SELECT UPPER(last_name) , concat('$', FORMAT(salary, 0)),        date_FORMAT(hire_date, '%d %m %y' ) FROM employees  WHERE SUBSTRING(last_name , 1 , 1) IN ('D' , 'K');
-- 14. NVL / TO_CHAR
-- a 
SELECT first_name , last_name , salary , commission_pct , 
       ifnull(commission_pct , 0)
FROM employees
-- b 
SELECT first_name , last_name , salary , commission_pct , if(commission_pct = 0, 'No Commission', commission_pct)
FROM employees 
-- 15. CASE
SELECT first_name , last_name , salary , 
       CASE WHEN salary BETWEEN 0 AND 5000 THEN 'A'
            WHEN salary BETWEEN 5001 AND 15000 THEN 'B'
            WHEN salary BETWEEN 15001 AND 20000 THEN 'C'
            ELSE 'D'
       END AS "SAL_RANKS"
FROM employees 