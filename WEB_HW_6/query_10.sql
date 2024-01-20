SELECT DISTINCT sub.subject_name, s.student_name, t.teacher_name
FROM subjects sub
JOIN grades g ON sub.id = g.subject_id
JOIN students s ON g.student_id = s.id
JOIN teachers t ON sub.teacher_id = t.id
WHERE s.id = (SELECT id FROM students ORDER BY RANDOM() LIMIT 1)
  AND t.id = (SELECT id FROM teachers ORDER BY RANDOM() LIMIT 1)
