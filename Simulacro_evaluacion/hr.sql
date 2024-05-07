--1) Mostrar los nombres de todos los departamentos de la empresa en orden alfabético.-->

SELECT department_name FROM departments
ORDER BY department_name

--2) Mostrar todos los posibles salarios ordenados de mayor a menor y sin repetir. -->

SELECT salary FROM employees
GROUP BY salary
ORDER BY salary DESC

--3) Mostrar los puestos laborales de manager (que incluya la palabra manager) junto con sus salarios minimos y maximos, ordenado de mayor a menor -->

SELECT job_title, max_salary, min_salary FROM jobs WHERE job_title like "%anager%"
ORDER BY max_salary DESC

--4)Mostrar los nombres de todos los países con su región correspondiente. Pensar cómo ordenar para que los países de una misma región queden juntos.-->

SELECT p.country_name, r.region_name FROM countries p
JOIN regions r ON p.region_id = r.region_id
ORDER BY r.region_name

--5) Mostrar nombre, apellido, departamento y salario de los empleados/as que cobren entre 9000 y 17000, ordenado por el criterio que quieran. -->

SELECT e.first_name, e.last_name, d.department_name, e.salary FROM employees e
JOIN departments d ON d.department_id = e.department_id 
WHERE e.salary >= "9000" AND e.salary <= "17000"

ORDER BY e.salary DESC

--6) Mostrar la cantidad total de países que hay por región, descartando los que tengan 5 o menos. -->

SELECT r.region_name, count(p.country_id) FROM countries p
JOIN regions r ON r.region_id = p.region_id
GROUP BY r.region_name
HAVING count(p.country_id) > 5

--7) Mostrar la fecha más vieja y la más actual de los ingresos de los empleados (Pista: las fechas se pueden comparar, la más vieja sería  la menor y la más actual la mayor). -->

SELECT MIN(hire_date) AS fecha_Mas_Antigua, MAX(hire_date) AS fecha_Mas_Nueva FROM employees

--8) Mostrar nombre y apellido y cantidad de hijos de los 5 empleados/as que tengan mayor cantidad.-->

SELECT r.first_name, r.last_name, count(p.dependent_id) AS Cantidad_De_Hijos FROM dependents p
JOIN employees r ON r.employee_id = p.employee_id
GROUP BY r.employee_id
ORDER BY count(p.dependent_id) DESC
LIMIT 5

--9) Mostrar cual es el empleado con el tercer mejor sueldo. -->

SELECT first_name, last_name, salary FROM employees
ORDER BY salary DESC 
LIMIT 1 OFFSET 2

--10) Mostrar la cantidad promedio y la cantidad máxima de hijos por empleado. -->

