SELECT e.event_name, count(e.person_id)FROM facebook_event_checkin e
JOIN person p ON p.id = e.person_id
JOIN income s ON p.ssn = s.ssn
WHERE annual_income > "35000"
GROUP BY event_id
ORDER BY COUNT(person_id) DESC
LIMIT 5