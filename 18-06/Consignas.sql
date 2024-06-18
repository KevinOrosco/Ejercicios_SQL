--1) Agregar dos regiones: África, Middle east-->

INSERT INTO regions(region_name)
VALUES("África"), ("Middle east")

--2) Modificar / pasar los países a las nuevas regiones-->

UPDATE countries
SET region_id = 5
WHERE region_id = 4;

UPDATE countries
SET region_id = 6
WHERE country_id = "KW" OR country_id = "IL";

--3) Una vez que la región “Middle east and africa” este vacía borrar la región.-->

DELETE FROM regions WHERE region_id = 4

--4) Agregar dos países más a cada una de las nuevas regiones.-->

INSERT INTO countries(country_id, country_name, region_id)
VALUES("SN", "Senegal", "5"), ("AS", "Arabia Saudita", "6")

--5)Volver a crear la región “Middle east and africa” --

INSERT INTO regions(region_name, region_id)
VALUES("Middle east and africa", 4)

--6)Utilizando IN y subquery pasar los países que se encuentran en la región Africa y Middle East (5 y 6) a la nueva región -->

UPDATE countries
SET region_id = 4
WHERE region_id IN (SELECT region_id FROM regions WHERE region_name = "África" OR region_name = "Middle east")

--7) -->