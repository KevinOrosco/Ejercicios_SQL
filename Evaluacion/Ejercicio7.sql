SELECT p.name, p.ssn, g.id, g.membership_status, d.check_in_date FROM person p
JOIN get_fit_now_member g ON p.id = g.person_id
JOIN get_fit_now_check_in d ON g.id = d.membership_id
WHERE d.check_in_date like "2018%"
ORDER BY g.membership_status AND p.ssn ASC
