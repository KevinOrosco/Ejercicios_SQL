<--1) Mostrar los nombres de todas las películas en orden alfabético -->

SELECT title FROM film
ORDER BY title ASC;

<-- 2) Mostrar los nombre de todos los ratings de película posibles, en orden alfabético (cuidando de no poner repetidos) -->

SELECT DISTINCT(rating) FROM film
ORDER BY rating ASC;

<-- 3) Mostrar los nombres y precio de alquiler de todas las películas con rating "PG-13" o "PG", ordenando primero por precio (de mayor a menor) y luego por orden alfabético del nombre de la película. -->

SELECT title, rental_rate, rating FROM film WHERE rating = "PG-13" OR rating = "PG"
ORDER BY rental_rate DESC 

<-- 4) Mostrar los nombres de todas las ciudades con su país correspondiente. Pensar como ordenar para que las ciudades de un mismo país queden juntas -->

SELECT p.country, c.city FROM city c
JOIN country p ON c.country_id = p.country_id
ORDER BY p.country

<-- 5) Mostrar la lista de todos los países, con la cantidad de ciudades de cada uno, ordenando de manera que los países con más ciudades queden primero. -->

SELECT p.country, COUNT(c.city) AS Cantidad_de_Ciudades FROM country p
JOIN city c ON p.country_id = c.country_id
GROUP BY p.country_id
ORDER BY COUNT(c.city) DESC

<-- 6) Mostrar la lista de todos los países que tienen más de dos ciudades. -->

SELECT p.country, COUNT(c.city) AS Cantidad_de_Ciudades FROM country p
JOIN city c ON p.country_id = c.country_id
GROUP BY p.country_id
HAVING COUNT(c.city) > 2
ORDER BY COUNT(c.city) DESC

<-- 7) Mostrar la fecha más vieja y la más actual de los alquileres que fueron devueltos (PISTA: las fechas se pueden comparar, la más vieja sería la menor y la más actual la mayor) -->

SELECT MIN(rental_date) AS Fecha_Mas_Antigua, MAX(rental_date) AS Fecha_Mas_Nueva FROM rental WHERE return_date IS NOT NULL

<-- 8)Mostrar los nombres de las diez películas con menos actores -->

SELECT f.title, COUNT(a.actor_id) AS cantidad_de_actores FROM film f
JOIN film_actor a ON f.film_id = a.film_id
GROUP BY f.film_id
ORDER BY COUNT(a.actor_id) ASC
LIMIT 10;

<-- 9) Mostrar cuál es la tercer película más alquilada. -->


SELECT f.title, i.inventory_id, COUNT(i.film_id) AS cantidad_de_copias FROM inventory i
JOIN film f ON f.film_id = i.film_id
JOIN rental r ON r.inventory_id = i.inventory_id
GROUP BY i.film_id
ORDER BY COUNT(i.film_id) DESC
LIMIT 1 OFFSET 2

-- 10) Mostrar la cantidad promedio y cantidad máxima de actores de las películas que tienen entre un hora y media y dos horas. -->