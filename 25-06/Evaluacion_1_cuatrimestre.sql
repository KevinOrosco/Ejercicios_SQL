--Ejercicio 1-->
SELECT d.department_name, count(e.employee_id), sum(e.salary) FROM employees e 
LEFT JOIN departments d ON d.department_id = e.department_id
GROUP BY d.department_id

--Ejercicio 2-->

SELECT e.first_name, e.last_name, d.department_name, c.country_name FROM employees e
LEFT JOIN departments d ON d.department_id = e.department_id
LEFT JOIN locations l ON d.location_id = l.location_id
LEFT JOIN countries c ON c.country_id = l.country_id
WHERE c.country_name = "United States of America"

--Ejercicio 3-->

--Veo aquellos que tienen su numero de telefono en NULL--
SELECT employee_id,first_name, last_name, email, phone_number, department_id FROM employees WHERE phone_number IS NULL

--Cambio sus numeros al valor 111.222.3344--
UPDATE employees
SET phone_number = "111.222.3344"
WHERE phone_number IS NULL

--Verifico si el cambio se realizo correctamente--
SELECT employee_id,first_name, last_name, email, phone_number, department_id FROM employees WHERE phone_number = "111.222.3344"

--Ejercico 4-->

UPDATE employees
SET salary = salary*1.2
WHERE salary <= 8000 AND job_id = (SELECT job_id FROM jobs WHERE job_title = "Programmer") OR job_id = (SELECT job_id FROM jobs WHERE job_title = "Purchasing Clerk")

--Ejercicio 5-->

INSERT INTO departments (department_name, location_id)
VALUES ("development", (SELECT location_id FROM locations WHERE city = "Toronto"))

INSERT INTO employees (first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id)
VALUES ("Matias", "Gonzales", "mgonzales@gmail.com", "1.231.231.122","2024-06-25", 9, 5000, 100, (SELECT department_id FROM departments WHERE department_name = "development")),
	   ("Laura", "Nievas", "lnievas@gmail.com", "1.231.231.122","2024-06-25", 9, 5000, 100, (SELECT department_id FROM departments WHERE department_name = "development")),
	   ("Federico", "Lopez", "flopez@gmail.com", "1.231.231.122","2024-06-25", 9, 5000, 100, (SELECT department_id FROM departments WHERE department_name = "development"));

--Ejercicio 6-->

DELETE FROM employees WHERE department_id = (SELECT d.department_id FROM departments d 
											 JOIN locations l ON d.location_id = l.location_id
											 JOIN countries c ON l.country_id = c.country_id
											 WHERE c.country_id = "DE")

DELETE FROM departments WHERE department_id = (SELECT d.department_id FROM departments d 
											 JOIN locations l ON d.location_id = l.location_id
											 JOIN countries c ON l.country_id = c.country_id
											 WHERE c.country_id = "DE")

DELETE FROM locations WHERE location_id = (SELECT l.location_id FROM locations l
										   JOIN countries c ON c.country_id = l.country_id
										   WHERE c.country_id = "DE")

DELETE FROM countries WHERE country_id = "DE"

--Ejercicio 7-->

DELETE FROM jobs WHERE job_id IN (SELECT j.job_id FROM jobs j 
								  LEFT JOIN employees e ON j.job_id = e.job_id
								  GROUP BY j.job_id
								  HAVING count(e.employee_id) = 0)