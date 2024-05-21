SELECT p.name FROM person p
LEFT JOIN get_fit_now_member g ON g.person_id = p.id
WHERE g.person_id IS NULL