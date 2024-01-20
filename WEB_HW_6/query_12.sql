SELECT gr.group_name, s.student_name, sub.subject_name, g.grade, g.date_obtained AS last_lesson_date
FROM students s
JOIN grades g ON s.id = g.student_id
JOIN subjects sub ON g.subject_id = sub.id
JOIN teachers t ON sub.teacher_id = t.id
JOIN groups gr ON s.group_id = gr.id
WHERE gr.id = (SELECT id FROM groups ORDER BY RANDOM() LIMIT 1)
  AND t.id = (SELECT id FROM teachers ORDER BY RANDOM() LIMIT 1)
  AND sub.id = (SELECT id FROM subjects WHERE teacher_id = t.id ORDER BY RANDOM() LIMIT 1)
ORDER BY g.date_obtained DESC
LIMIT 1
