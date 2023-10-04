-- 1. Question: For each class, find the student(s) who scored the highest in Science.
-- Query:- 
SELECT 
    c.class_id, 
    c.class_name, 
    s2.student_id, 
    s2.student_name,
    MAX_score AS highest_score_in_science
FROM (
    SELECT 
        s.class_id,
        MAX(sc.score) AS MAX_score
    FROM 
        Scores sc
    JOIN 
        Students s ON sc.student_id = s.student_id
    WHERE 
        sc.subject = 'Science'
    GROUP BY 
        s.class_id
) AS subquery
JOIN 
    Classes c ON c.class_id = subquery.class_id
JOIN 
    Students s2 ON s2.class_id = c.class_id
JOIN 
    Scores sc2 ON s2.student_id = sc2.student_id
WHERE 
    sc2.score = MAX_score AND sc2.subject = 'Science';


