SELECT s.student_name, AVG(g.grade) AS average_grade, subj.subject_name AS selected_subject
FROM students s
JOIN grades g ON s.id = g.student_id
JOIN subjects subj ON g.subject_id = subj.id
WHERE g.subject_id = (SELECT id FROM subjects ORDER BY RANDOM() LIMIT 1)
GROUP BY s.id
ORDER BY average_grade DESC
LIMIT 1;