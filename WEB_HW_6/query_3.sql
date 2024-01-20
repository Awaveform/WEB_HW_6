SELECT gr.group_name, AVG(g.grade) AS average_grade, subj.subject_name AS selected_subject
FROM groups gr
JOIN students s ON s.id = gr.id
JOIN grades g ON s.id = g.student_id
JOIN subjects subj ON g.subject_id = subj.id
WHERE g.subject_id = (SELECT id FROM subjects ORDER BY RANDOM() LIMIT 1)
GROUP BY gr.id;