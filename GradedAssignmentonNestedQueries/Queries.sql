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


-- 6. Question: Find the class(es) where the students average age is above the average age of all students.
-- Query:- 
SELECT 
    c.class_id, 
    c.class_name, 
    AVG(s.age) AS average_age_in_class
FROM 
    Classes c
JOIN 
    Students s ON c.class_id = s.class_id
GROUP BY 
    c.class_id, c.class_name
HAVING 
    AVG(s.age) > (
        SELECT 
            AVG(s_all.age) 
        FROM 
            Students s_all
    );


-- 7. Question: Display the student names and their total scores, ordered by the total score in descending order.
-- Query:- 
SELECT 
    s.student_id, 
    s.student_name, 
    SUM(sc.score) AS total_score
FROM 
    Students s
JOIN 
    Scores sc ON s.student_id = sc.student_id
GROUP BY 
    s.student_id, s.student_name
ORDER BY 
    total_score DESC;


-- 8. Question: Find the student(s) who scored the highest in the class with the lowest average score.
-- Query:- 
SELECT 
    s.student_id,
    s.student_name,
    c.class_id,
    c.class_name,
    MAX(sc.score) AS highest_score
FROM
    Students s
JOIN
    Classes c ON s.class_id = c.class_id
JOIN
    Scores sc ON s.student_id = sc.student_id
WHERE
    c.class_id = (
        SELECT 
            class_id
        FROM
            Students s
        JOIN
            Scores sc ON s.student_id = sc.student_id
        GROUP BY
            s.class_id
        ORDER BY
            AVG(sc.score)
        LIMIT 1
    )
GROUP BY
    s.student_id, s.student_name, c.class_id, c.class_name
ORDER BY
    highest_score DESC;


-- 9. Question: List the names of students who scored the same as Alice in at least one subject.
-- Query:- 
SELECT DISTINCT s2.student_name
FROM Scores sc1
JOIN Students s1 ON sc1.student_id = s1.student_id
JOIN Scores sc2 ON sc1.score = sc2.score AND sc1.subject = sc2.subject
JOIN Students s2 ON sc2.student_id = s2.student_id
WHERE s1.student_name = 'Alice' AND s2.student_name != 'Alice';


-- 10. Question: Display the class names along with the number of students who scored below the average score in their class.
-- Query:- 
SELECT c.class_name, COUNT(DISTINCT s.student_id) AS below_avg_count
FROM Classes c
JOIN Students s ON c.class_id = s.class_id
JOIN Scores sc ON s.student_id = sc.student_id
WHERE (s.class_id, sc.subject) IN (
    SELECT class_id, subject
    FROM Scores
    JOIN Students ON Scores.student_id = Students.student_id
    GROUP BY class_id, subject
    HAVING AVG(score)
)
AND sc.score < (
    SELECT AVG(score)
    FROM Scores
    JOIN Students ON Scores.student_id = Students.student_id
    WHERE Students.class_id = c.class_id AND Scores.subject = sc.subject
)
GROUP BY c.class_name;
