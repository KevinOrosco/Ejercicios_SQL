SELECT name, address_number, address_street_name, ssn FROM person
WHERE address_street_name = "Franklin Ave"
ORDER BY address_number DESC
LIMIT 1 OFFSET 1 