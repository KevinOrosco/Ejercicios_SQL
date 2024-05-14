SELECT p.name, a.car_model FROM person p
LEFT JOIN drivers_license a ON p.license_id = a.id
WHERE a.car_model IS NULL
ORDER BY name DESC