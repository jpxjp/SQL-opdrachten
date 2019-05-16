use hr;

/*Vraag 1*/
SELECT l.location_id, l.street_address, l.city, l.state_province, c.country_name
FROM locations l JOIN countries c
ON l.country_id = c.country_id;
/*Vraag 2*/
SELECT e.last_name, e.department_id, d.department_name
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id;
/*Vraag 3*/
SELECT e.last_name, e.job_id, e.department_id, d.department_name
FROM employees e JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
ON d.location_id = l.location_id
WHERE city = 'Toronto';
/*Vraag 4*/
SELECT w.last_name AS 'Employee', w.employee_id AS 'Emp#', m.last_name AS 'Manager', m.employee_id AS 'Mgr#'
FROM employees w JOIN employees m
ON w.manager_id = m.employee_id;
/*Vraag 5*/
SELECT w.last_name AS 'Employee', w.employee_id AS 'Emp#', m.last_name AS 'Manager', m.employee_id AS 'Mgr#'
FROM employees w LEFT JOIN employees m
ON w.manager_id = m.employee_id
ORDER BY w.employee_id;
/*Vraag 6*/
SELECT e.last_name AS 'name', e.department_id AS 'department', e.last_name AS 'colleague'
FROM employees e JOIN employees c
ON c.department_id = e.department_id
WHERE e.employee_id != c.employee_id;
/*Vraag 7*/
SELECT e.last_name, e.job_id, e.department_id, e.salary, j.grade_level AS 'grades'
FROM employees e JOIN job_grades j
ON salary BETWEEN lowest_sal AND highest_sal
WHERE department_id IS NOT NULL;
/*Vraag 8*/
SELECT last_name, hire_date
FROM employees
WHERE hire_date > (SELECT hire_date FROM employees WHERE last_name = 'Davies');
/*Vraag 9*/
SELECT w.last_name, w.hire_date, m.last_name, m.hire_date
FROM employees w JOIN employees m
ON w.manager_id = m.employee_id AND w.hire_date < m.hire_date;
/*Vraag 10*/
SELECT d.department_name, count(*)
FROM employees e JOIN departments d
ON e.department_id = d.department_id
GROUP BY department_name;
/*Vraag 11*/
SELECT j.job_title, ROUND(AVG(e.salary), 0) AS 'Average Salary'
FROM employees e JOIN jobs j
ON e.job_id = j.job_id
GROUP BY j.job_title
ORDER BY j.job_title;
/*Vraag 12*/
SELECT e.last_name, (e.salary - j.min_salary) AS 'Difference'
FROM employees e JOIN jobs j
ON e.job_id = j.job_id;
/*Vraag 13*/
SELECT e.last_name, city, country_name
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id
LEFT JOIN locations l
ON d.location_id = l.location_id
LEFT JOIN countries c
ON l.country_id = c.country_id
ORDER BY city, last_name;
/*Vraag 14*/
SELECT e.last_name, e.salary
FROM employees e JOIN jobs j
ON e.job_id = j.job_id
WHERE e.salary = j.min_salary;
/*Vraag 15*/
SELECT e.last_name
FROM employees e JOIN employees m
ON e.manager_id = m.employee_id
WHERE e.department_id != m.department_id;

/*Opgave 2*/
/*Vraag 1*/
SELECT last_name, hire_date
FROM employees
WHERE department_id = (
SELECT department_id 
FROM employees 
WHERE last_name = 'Zlotkey');
/*Vraag 2*/
SELECT employee_id, last_name, salary
FROM employees
WHERE salary > (
SELECT AVG(salary) 
FROM employees)
ORDER BY salary ASC;
/*Vraag 3*/
SELECT employee_id, last_name
FROM employees
WHERE department_id IN (
SELECT department_id 
FROM employees 
WHERE last_name LIKE '%u%');
/*Vraag 4*/
SELECT last_name, department_id, job_id
FROM employees
WHERE department_id IN (SELECT e.department_id
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id
WHERE d.location_id = 1700)
ORDER BY department_id;
/*Vraag 5*/
SELECT last_name, salary
FROM employees
WHERE manager_id IN (
SELECT employee_id 
FROM employees 
WHERE last_name = 'King');
/*Vraag 6*/
SELECT department_id, last_name, job_id
FROM employees
WHERE department_id IN (
SELECT e.department_id 
FROM employees e JOIN departments d 
ON e.department_id = d.department_id 
WHERE d.department_name = 'Executive');
/*Vraag 7*/
SELECT last_name
FROM employees
WHERE salary > (
SELECT MAX(salary)
FROM employees
WHERE department_id = 60);
/*Vraag 8*/
SELECT employee_id, last_name
FROM employees
WHERE department_id IN (
SELECT department_id 
FROM employees 
WHERE last_name LIKE '%u%') AND salary > (
SELECT AVG(salary)
FROM employees);
/*Vraag 9*/
SELECT first_name, last_name, salary
FROM employees
WHERE salary = (
SELECT MIN(salary)
FROM employees);
/*Vraag 10*/
SELECT first_name, last_name
FROM employees
WHERE hire_date < (
SELECT hire_date
FROM employees
WHERE last_name = 'Bell')
ORDER BY first_name ASC;
/*Vraag 11*/
SELECT *
FROM locations
WHERE LENGTH(street_address) = (
SELECT MIN(LENGTH(street_address))
FROM locations);
/*Vraag 12*/
SELECT department_name
FROM departments
WHERE department_id IN (
SELECT department_id
FROM employees
WHERE salary = (
SELECT AVG(salary)
FROM employees);

/*Vraag 15*/
SELECT job_title
FROM jobs
WHERE LENGTH(job_title) < (
SELECT AVG(LENGTH(job_title))
FROM jobs);