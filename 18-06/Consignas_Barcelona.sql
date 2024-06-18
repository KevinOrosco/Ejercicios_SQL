--Ejercicio 1--

SELECT count(NOMBRE_ESTACION) AS Cantidad_de_estaciones FROM barcelona_viajeros_por_franja_xlsx

--Ejercicio 2--

SELECT count(DISTINCT CODIGO_ESTACION) AS Cantidad_estaciones_Unicas FROM barcelona_viajeros_por_franja_xlsx

--Ejercicio 3--

SELECT NOMBRE_ESTACION, sum(VIAJEROS_SUBIDOS), sum(VIAJEROS_BAJADOS) FROM barcelona_viajeros_por_franja_xlsx
GROUP BY NOMBRE_ESTACION

--Ejercicio 4--

SELECT NOMBRE_ESTACION, sum(VIAJEROS_SUBIDOS), sum(VIAJEROS_BAJADOS), abs(sum(VIAJEROS_BAJADOS) - sum(VIAJEROS_SUBIDOS)) FROM barcelona_viajeros_por_franja_xlsx
GROUP BY NOMBRE_ESTACION

--Ejercicio 5--

SELECT NOMBRE_ESTACION, MAX(VIAJEROS_SUBIDOS), TRAMO_HORARIO FROM barcelona_viajeros_por_franja_xlsx 
GROUP BY TRAMO_HORARIO
ORDER BY TRAMO_HORARIO DESC

--Ejercicio 6--

SELECT NOMBRE_ESTACION, MAX(VIAJEROS_SUBIDOS), TRAMO_HORARIO FROM barcelona_viajeros_por_franja_xlsx 

--Ejercicio 7--

SELECT NOMBRE_ESTACION, MAX(VIAJEROS_BAJADOS), TRAMO_HORARIO FROM barcelona_viajeros_por_franja_xlsx 
GROUP BY TRAMO_HORARIO
ORDER BY TRAMO_HORARIO DESC

--Ejercicio 8--

SELECT NOMBRE_ESTACION, MAX(VIAJEROS_BAJADOS), TRAMO_HORARIO FROM barcelona_viajeros_por_franja_xlsx 

--Ejercicio 9--

SELECT NOMBRE_ESTACION, VIAJEROS_SUBIDOS, VIAJEROS_BAJADOS, abs(VIAJEROS_BAJADOS - VIAJEROS_SUBIDOS) AS diferencia, TRAMO_HORARIO FROM barcelona_viajeros_por_franja_xlsx
GROUP BY TRAMO_HORARIO
ORDER BY diferencia DESC
LIMIT 1

--Ejercicio 10--

SELECT NOMBRE_ESTACION, sum(VIAJEROS_SUBIDOS), sum(VIAJEROS_BAJADOS), abs(sum(VIAJEROS_BAJADOS) - sum(VIAJEROS_SUBIDOS)) AS diferencia FROM barcelona_viajeros_por_franja_xlsx
GROUP BY NOMBRE_ESTACION
ORDER BY diferencia DESC
LIMIT 1

--Ejercicio 11--

SELECT round(avg(VIAJEROS_SUBIDOS), 2) AS Promedio_subidos, round(avg(VIAJEROS_BAJADOS), 2) AS Promedio_Bajados, TRAMO_HORARIO FROM barcelona_viajeros_por_franja_xlsx
GROUP BY TRAMO_HORARIO
ORDER BY TRAMO_HORARIO DESC

--Ejercicio 12--

SELECT NOMBRE_ESTACION, round(avg(VIAJEROS_SUBIDOS), 2) AS Promedio_subidos, round(avg(VIAJEROS_BAJADOS), 2) AS Promedio_Bajados, TRAMO_HORARIO FROM barcelona_viajeros_por_franja_xlsx
GROUP BY TRAMO_HORARIO
ORDER BY TRAMO_HORARIO DESC
