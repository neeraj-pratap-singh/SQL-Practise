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


-- 2. Question: List the names of students who scored lower in Math than their average Science score.
-- Query:- 
SELECT 
    s.student_name
FROM 
    Students s
JOIN (
    SELECT 
        student_id, 
        AVG(score) AS avg_science_score
    FROM 
        Scores
    WHERE 
        subject = 'Science'
    GROUP BY 
        student_id
) AS avg_scores ON s.student_id = avg_scores.student_id
JOIN (
    SELECT 
        student_id, 
        score AS math_score
    FROM 
        Scores
    WHERE 
        subject = 'Math'
) AS math_scores ON s.student_id = math_scores.student_id
WHERE 
    math_scores.math_score < avg_scores.avg_science_score;


-- 3. Question: Display the class names with the highest number of students who scored above 80 in any subject.
-- Query:- 
SELECT 
    c.class_name, 
    COUNT(DISTINCT s.student_id) AS num_students
FROM 
    Classes c
JOIN 
    Students s ON c.class_id = s.class_id
JOIN 
    Scores sc ON s.student_id = sc.student_id
WHERE 
    sc.score > 80
GROUP BY 
    c.class_id, c.class_name
ORDER BY 
    num_students DESC
LIMIT 1;


-- 4. Question: Find the students who scored the highest in each subject.
-- Query:- 
SELECT 
    sc1.subject, 
    s.student_name, 
    sc1.score AS highest_score
FROM 
    Scores sc1
JOIN Students s ON sc1.student_id = s.student_id
WHERE 
    (sc1.score, sc1.subject) IN (
        SELECT 
            MAX(sc2.score), 
            sc2.subject
        FROM 
            Scores sc2
        GROUP BY 
            sc2.subject
    );


-- 5. Question: List the names of students who scored higher than the average of any student's score in their own class.
-- Query:- 
SELECT 
    s1.student_name, 
    s1.class_id, 
    sc1.subject, 
    sc1.score
FROM 
    Students s1
JOIN 
    Scores sc1 ON s1.student_id = sc1.student_id
WHERE 
    sc1.score > (
        SELECT 
            AVG(sc2.score) 
        FROM 
            Students s2
        JOIN 
            Scores sc2 ON s2.student_id = sc2.student_id
        WHERE 
            s2.class_id = s1.class_id
    );


