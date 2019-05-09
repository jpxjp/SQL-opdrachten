/*Vraag 1*/
 SELECT CURRENT_DATE() AS datum ;
 /*Vraag 2*/
 SELECT concat(last_name, job_id) AS 'Employee and Title'
 FROM employees;
 /*Vraag 3*/
 SELECT employee_id, last_name, salary, round(salary * 1.155,0) AS 'New salary'
 FROM employees;
 /*Vraag 4*/
 SELECT employee_id, last_name, salary, round(salary * 1.155,0) AS 'New salary', round(salary * 1.155,0)-salary AS increase
 FROM employees;
 /*Vraag 5*/
 SELECT upper(last_name), length(last_name) AS length
 FROM employees
 WHERE SUBSTR(last_name,1,1) IN ('J','A','M');
 /*Vraag 6*/
 SELECT first_name,last_name,(length(first_name)+length(last_name))AS length
 FROM employees;
  SELECT first_name,last_name,length(concat(first_name,' ',last_name)) AS fullname
 FROM employees;
 /*Vraag 7*/
 SELECT last_name, round(salary*12,0)AS 'Annual Salary'
 FROM employees;
 /*Vraag 8*/
 SELECT first_name,last_name,job_id
 FROM employees
 WHERE length(last_name)>8;
 /*Vraag 9*/
 SELECT last_name,salary, IF(commission_pct IS NOT NULL,salary*1.2,salary) AS new_salary
 FROM employees
 ORDER BY last_name ASC;
 /*Vraag 10*/
 SELECT last_name, SUBSTR(job_id,1,2) AS 'Job Prefix'
 FROM employees
 WHERE job_id LIKE '%MGR%';
 /*Opgave 2*/
 /*Vraag 1*/
 SELECT round(AVG(salary),0) AS Average,
       round(MAX(salary),0) AS Maximum,
       round(MIN(salary),0) AS Minimum,
       round(SUM(salary),0) AS 'Sum'
FROM employees;
/*Vraag 2*/
 SELECT job_id,
		round(AVG(salary),0) AS Average,
       round(MAX(salary),0) AS Maximum,
       round(MIN(salary),0) AS Minimum,
       round(SUM(salary),0) AS 'Sum'
FROM employees
GROUP BY job_id; 
 /*Vraag 3*/
SELECT job_id, COUNT(*)
 FROM employees
 GROUP BY job_id;
 /*Vraag 4*/
 SELECT COUNT(DISTINCT manager_id) AS 'Number of Managers'
 FROM employees;
 /*Vraag 5*/
 SELECT MAX(salary) - MIN(salary) AS 'Difference'
 from employees;
 /*Vraag 6*/
 SELECT manager_id, MIN(salary) AS 'Minimum Salary'
 FROM employees
 WHERE manager_id IS NOT NULL
 GROUP BY manager_id
 HAVING MIN(salary) > 6000
 ORDER BY MIN(salary) DESC;
 /*Vraag 7*/
 SELECT department_id
 FROM employees
 GROUP BY department_id
 HAVING COUNT(department_id) > 10;
 /*Vraag 8*/
 SELECT ROUND(AVG(salary), 2) AS 'Average Salary', COUNT(*)
 FROM employees
 WHERE department_id = 90;
 /*Vraag 9*/
 SELECT department_id, SUM(salary) AS 'Total Salary'
 FROM employees
 WHERE department_id IS NOT NULL
 GROUP BY department_id;
 /*Vraag 10*/
 SELECT manager_id AS 'Employee ID', ROUND(AVG(salary), 2) AS 'Average Salary'
 FROM employees
 GROUP BY manager_id
 HAVING COUNT(manager_id) > 5;
 /*Vraag 11*/
SELECT job_id, COUNT(*)
 FROM employees
 GROUP BY job_id
 HAVING AVG(salary) > 8000;