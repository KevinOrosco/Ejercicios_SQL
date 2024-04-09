<--1)Mostrar nombre y apellido y sueldo de todos los empleados y empleadas que ganen menos de 6.000 (seis mil) dólares.-->

SELECT first_name, last_name, salary FROM employees WHERE salary > "6000"

<--2)Mostrar nombre, apellido, departamento, ciudad y estado/provincia de cada empleado/a.--> 

SELECT first_name, last_name, d.department_name, p.city, p.state_province FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations p ON d.location_id = p.location_id

<--3)Mostrar el nombre de todos los empleados junto con el nombre de su jefe (manager), ordenados por el nombre del jefe.-->

SELECT e.first_name, e.last_name, j.first_name AS manager FROM employees e
JOIN employees j ON j.employee_id = e.manager_id
ORDER BY manager

<--4)Mostrar el nombre y apellido de los empleados, junto al nombre de sus hijos, ordenados alfabéticamente.-->

SELECT e.first_name, e.last_name, h.first_name AS name_child, h.last_name AS last_name_child FROM employees e
JOIN dependents h ON e.employee_id = h.employee_id
ORDER BY h.first_name

<--5)Mostrar el nombre del empleado con su puesto de trabajo y su salario máximo, ordenado por salario de mayor a menor.-->

SELECT e.first_name, t.job_title, t.max_salary FROM employees e
JOIN jobs t ON e.job_id = t.job_id

<--6)Mostrar el nombre del empleado completo con su departamento y su salario, ordenados por nombre y departamento.-->

SELECT e.first_name, e.last_name, d.department_name, salary FROM employees e
JOIN jobs
JOIN departments d ON e.department_id = d.department_id
ORDER BY e.first_name AND d.department_name

<--7)Mostrar el nombre del empleado y su estado, ordenados alfabéticamente.-->

SELECT first_name, state_province FROM employees e
JOIN departments t ON e.department_id = t.department_id
JOIN locations l ON t.location_id = l.location_id
ORDER BY first_name

<--8)Mostrar nombre empleado completo, junto con su pais y region, ordenado a su elección.-->

SELECT e.first_name, e.last_name, p.country_name, r.region_name FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
JOIN countries p ON l.country_id = p.country_id
JOIN regions r ON p.region_id = r.region_id
ORDER BY e.first_name

<--9)Mostrar el país junto a su región, orden descendente.-->

SELECT p.country_name, r.region_name FROM countries p
JOIN regions r ON p.region_id = r.region_id
ORDER BY p.country_name DESC

<--10)Mostrar nombre del empleado, nombre del trabajo y su salario minimo, ordenado por salario a su eleccion.-->

SELECT e.first_name, t.job_title, t.min_salary FROM employees e
JOIN jobs t ON t.job_id = e.job_id
ORDER BY e.first_name DESC