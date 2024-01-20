SELECT t.teacher_name AS teacher_name, s.student_name AS student_name, AVG(g.grade) AS average_grade
FROM grades g
JOIN subjects sub ON g.subject_id = sub.id
JOIN teachers t ON sub.teacher_id = t.id
JOIN students s ON g.student_id = s.id
WHERE t.id = (SELECT id FROM teachers ORDER BY RANDOM() LIMIT 1)
  AND s.id = (SELECT id FROM students ORDER BY RANDOM() LIMIT 1)
