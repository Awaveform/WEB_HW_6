SELECT s.student_name, g.grade, gr.group_name, sub.subject_name
FROM students s
JOIN groups gr ON s.group_id = gr.id
JOIN grades g ON s.id = g.student_id
JOIN subjects sub ON g.subject_id = sub.id
WHERE s.group_id = (SELECT id FROM groups ORDER BY RANDOM() LIMIT 1)
  AND g.subject_id = (SELECT id FROM subjects ORDER BY RANDOM() LIMIT 1)
