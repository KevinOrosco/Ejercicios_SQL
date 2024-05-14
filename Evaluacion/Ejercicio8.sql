SELECT a.car_make, a.car_model, g.annual_income, count(car_model) FROM drivers_license a
LEFT JOIN person p ON p.license_id = a.id
LEFT JOIN income g ON p.ssn = g.ssn 
WHERE g.annual_income < "35000"
GROUP BY a.car_model
ORDER BY count(a.car_make) DESC