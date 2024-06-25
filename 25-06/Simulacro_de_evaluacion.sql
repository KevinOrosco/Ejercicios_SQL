/*1)Listar el nombre de todos los empleados junto al nombre de departamento que pertenece, el estado o provincia, su sueldo 
y el nombre de su manager, ordenarlo por sueldo*/

SELECT p.first_name, p.last_name, d.department_name, l.state_province, c.country_name, p.salary, jefe.first_name  FROM employees p
LEFT JOIN employees jefe ON p.manager_id = jefe.employee_id
LEFT JOIN departments d ON p.department_id = d.department_id
LEFT JOIN locations l ON l.location_id = d.location_id
LEFT JOIN countries c ON c.country_id = l.country_id

/*reducir el salario mínimo y máximo de cada trabajo un 25%.*/
UPDATE jobs 
SET min_salary = min_salary*0.75, max_salary = max_salary*0.75

/*Eliminar aquellos trabajadores que cobren sobre el salario máximo de su tipo de trabajo.*/

DELETE FROM employees WHERE salary IN 
(SELECT e.salary FROM employees e JOIN jobs j  ON e.job_id = j.job_id WHERE salary > max_salary)

