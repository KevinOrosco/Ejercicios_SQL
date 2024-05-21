SELECT name, address_number, address_street_name, ssn FROM person
WHERE address_street_name = "Franklin Ave"
ORDER BY address_number ASC
LIMIT 1 OFFSET 2
