### 1. Retrieve the course name and teacher for each enrollment.
```sql
SELECT c.CourseName, c.Teacher
FROM Enrollments e
JOIN Courses c ON e.CourseID = c.CourseID;
```
Explanation: This query joins the `Enrollments` and `Courses` tables on `CourseID` to fetch the `CourseName` and `Teacher` for each `Enrollment`.

### 2. Get a list of all students and their enrollments if available.
```sql
SELECT s.StudentID, s.FirstName, s.LastName, e.CourseID
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID;
```
Explanation: This query uses a LEFT JOIN to include all students, even those who haven't enrolled in any courses.

### 3. List all courses and their teachers, including courses without any enrolled students.
```sql
SELECT c.CourseID, c.CourseName, c.Teacher
FROM Courses c
LEFT JOIN Enrollments e ON c.CourseID = e.CourseID;
```
Explanation: A LEFT JOIN ensures that even courses with no enrollments are included in the result.

### 4. Display a list of all students and their enrollments along with all courses and their teachers.
```sql
SELECT  s.StudentID, s.FirstName, s.LastName, c.CourseID, c.CourseName, c.Teacher 
FROM Students s 
LEFT JOIN Enrollments e on s.StudentID = e.studentID
LEFT JOIN Courses c on e.CourseID = c.CourseID;
```
Explanation: This query uses a CROSS JOIN to combine each student with every course and then uses a LEFT JOIN to bring in enrollment information.

### 5. Find students who share the same age.
```sql
SELECT s1.StudentID, s1.FirstName, s1.Age
FROM Students s1
JOIN Students s2 ON s1.Age = s2.Age AND s1.StudentID != s2.StudentID;
```
Explanation: Joins the Students table with itself to find students with the same age.

### 6. Retrieve the names of students who are enrolled in a specific course.
```sql
SELECT s.FirstName, s.LastName
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
LEFT JOIN Courses c on e.CourseID = c.CourseID
WHERE c.CourseName = "Physics";
```
Explanation: This query joins `Students` and `Enrollments` to find students enrolled in a specific course.

### 7. List courses that have no enrolled students.
```sql
SELECT c.CourseID, c.CourseName
FROM Courses c
LEFT JOIN Enrollments e ON c.CourseID = e.CourseID
WHERE e.EnrollmentID IS NULL;
```
Explanation: A LEFT JOIN with a WHERE clause to filter out courses that have no corresponding enrollments.

### 8. Display students who haven't enrolled in any courses.
```sql
SELECT s.StudentID, s.FirstName
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
WHERE e.EnrollmentID IS NULL;
```
Explanation: Similar to question 7 but for students who have not enrolled in any course.

### 9. Count the number of students in each course.
```sql
SELECT e.CourseID, COUNT(e.StudentID) as StudentCount
FROM Enrollments e
GROUP BY e.CourseID;
```
Explanation: A simple GROUP BY query to count students in each course.

### 10. Retrieve a list of courses along with the count of students enrolled in each course.
```sql
SELECT c.CourseID, c.CourseName, COUNT(e.StudentID) as StudentCount
FROM Courses c
LEFT JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.CourseID;
```
Explanation: Joins `Courses` and `Enrollments` and groups them by `CourseID` to count the number of students.

### 11. Show a list of teachers and the courses they are teaching.
```sql
SELECT c.Teacher, c.CourseName
FROM Courses c;
```
Explanation: Simply selects all the teachers and the courses they teach from the `Courses` table.

### 12. List all students, all courses, and the count of students enrolled in each course.
```sql
SELECT s.StudentID, s.FirstName, c.CourseID, c.CourseName, COUNT(e.StudentID) as StudentCount
FROM Students s
CROSS JOIN Courses c
LEFT JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.CourseID, s.StudentID;
```
Explanation: Uses a CROSS JOIN to list all combinations of students and courses, then counts the enrollments for each course.

### 13. Retrieve the names of students who are enrolled in a specific course and are above a certain age.
```sql
SELECT s.FirstName, s.LastName
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
WHERE e.CourseID = YOUR_SPECIFIC_COURSE_ID AND s.Age > YOUR_SPECIFIC_AGE;
```
Explanation: Joins `Students` and `Enrollments` to find students meeting both the course and age criteria.

### 14. List courses with enrollments and display teacher details.
```sql
SELECT c.CourseID, c.CourseName, c.Teacher, COUNT(e.StudentID) as StudentCount
FROM Courses c
LEFT JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.CourseID;
```
Explanation: Similar to question 10, but focuses on showing teacher details.

### 15. Display students who haven't enrolled in
```sql


```

###16. Find the names of students who are enrolled in a specific course.
```sql
SELECT s.FirstName, s.LastName FROM Students s WHERE s.StudentID in (select e.StudentID FROM Enrollments e WHERE e.CourseID = "1")
```

### 17. List courses that have the same teacher as a specified course