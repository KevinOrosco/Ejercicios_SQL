SELECT membership_status FROM get_fit_now_member
GROUP BY membership_status
ORDER BY count(id) DESC