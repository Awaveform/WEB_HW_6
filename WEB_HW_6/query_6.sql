SELECT s.student_name, g.group_name
FROM students s
JOIN groups g ON s.group_id = g.id
WHERE s.group_id = (SELECT id FROM groups ORDER BY RANDOM() LIMIT 1)
