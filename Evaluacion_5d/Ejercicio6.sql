SELECT car_make, COUNT(car_model) FROM drivers_license
GROUP BY car_make
ORDER BY COUNT(car_model) DESC