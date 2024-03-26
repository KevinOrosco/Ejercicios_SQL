--1)Mostrar nombres de las canciones, compositores y milisegundos--

SELECT name, Composer, Milliseconds FROM tracks

--2)Nombre, apellido, dirección y ciudad.--

SELECT FirstName, LastName, Address, City FROM customers

--3)Nombre y milisegundos donde el compositor es vacío y los milisegundos mayores a 2900000.--

SELECT name, Milliseconds FROM tracks WHERE Composer IS NULL AND Milliseconds > "2900000"

--4)Apellido, nombre y compañía, donde la misma no esté vacía.--

SELECT LastName, FirstName, Company FROM customers WHERE Company NOT NULL

--5)Mostrar una Ciudad de facturación (BillingCity) sin que se repita la misma, donde el estado de cuenta (BillingState) no es vacío, ordenar la ciudad de facturación de forma descendente.--

SELECT DISTINCT BillingCity FROM invoices WHERE BillingState NOT NULL 
ORDER BY BillingCity DESC 

--6)Mostrar el título del álbum que contenga la palabra OF, ordenarlo de manera ascendente.--

SELECT Title FROM albums WHERE Title like "%of%" 
ORDER BY Title ASC

--7)Mostrar nombre y género de las canciones.--

SELECT i.name, t.name FROM tracks i 
JOIN genres t ON t.GenreId = i.GenreId

--8)Mostrar nombre y título de las canciones, ordenar el título de forma descendente.--

SELECT name, Title FROM tracks t
JOIN albums a ON t.AlbumId = a.AlbumId 
ORDER BY Title DESC