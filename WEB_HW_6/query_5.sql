SELECT DISTINCT t.teacher_name, sub.subject_name
FROM teachers t
JOIN subjects sub ON t.id = sub.teacher_id
WHERE t.id = (SELECT id FROM teachers ORDER BY RANDOM() LIMIT 1);