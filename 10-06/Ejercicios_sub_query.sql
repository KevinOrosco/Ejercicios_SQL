--3)Imagine que en la tabla de empleados por error se cargaron los números de teléfono en la columna de número de fax y a la inversa.  Escriba una consulta de modificación que corrija este error.-->

UPDATE employees
SET Fax = Phone, Phone = Fax

--4)Borrar todos los géneros que tengan menos de 50 canciones (borrar todo lo necesario para poder borrar estos géneros)-->

UPDATE tracks
SET GenreId = NULL
WHERE GenreId IN (SELECT g.GenreId FROM genres g LEFT JOIN tracks t ON g.GenreId = t.GenreId
GROUP BY g.name
HAVING count(TrackId) < 50);

DELETE FROM genres
WHERE GenreId IN (SELECT g.GenreId FROM genres g LEFT JOIN tracks t ON g.GenreId = t.GenreId
GROUP BY g.name
HAVING count(TrackId) < 50);

--5)En la tabla de empleados, el jefe principal tiene NULL en el campo de reportsTo.  Modificar la tabla para que tenga su propio id de empleado en ese campo.-->

UPDATE employees
SET ReportsTo = EmployeeId
WHERE Title = "General Manager"

--6) Borrar todos los clientes que no tengan facturas (invoices)-->

DELETE FROM invoice_items
WHERE InvoiceId IN (SELECT InvoiceId FROM invoices WHERE BillingState IS NULL);

DELETE FROM invoices
WHERE BillingState IS NULL

--7)Agregar a todos los empleados como clientes del sistema.  Poner todos los datos y poner a sus jefes como como agente de soporte (SupportRepId)-->

INSERT INTO customers(FirstName, LastName, Address, City, State, Country, PostalCode, Phone, Fax, Email, SupportRepId)
SELECT FirstName, LastName, Address, City, State, Country, PostalCode, Phone, Fax, Email, ReportsTo
FROM employees;

