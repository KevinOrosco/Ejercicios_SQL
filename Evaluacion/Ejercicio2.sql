SELECT p.name, a.car_make, a.car_model, a.plate_number FROM person p
JOIN drivers_license a ON p.license_id = a.id
WHERE a.age > "70"
ORDER BY a.age DESC