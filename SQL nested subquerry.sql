CREATE DATABASE student_management;
USE student_management;
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    department VARCHAR(50),
    marks INT,
    city VARCHAR(50)
);
INSERT INTO students (name, age, department, marks, city) VALUES
('Arun', 20, 'CSE', 85, 'Chennai'),
('Selva', 21, 'ECE', 78, 'Bangalore'),
('Cheeka', 19, 'CSE', 92, 'Chennai'),
('Deva', 22, 'EEE', 70, 'Mumbai'),
('Feancis', 20, 'ECE', 88, 'Chennai'),
('jaya', 21, 'AD', 60, 'Delhi'),
('Ghambir', 23, 'EEE', 75, 'Bangalore');
SELECT * From students;
SELECT name, marks
FROM students
WHERE marks = (
    SELECT MAX(marks)
    FROM students
);
SELECT name, marks
FROM students
WHERE marks = (
    SELECT MIN(marks)
    FROM students
);
SELECT name, marks
FROM students
WHERE marks > (
    SELECT AVG(marks)
    FROM students
);
SELECT name
FROM students
WHERE department IN (
    SELECT department
    FROM students
    WHERE marks = (
        SELECT MAX(marks)
        FROM students
    )
);
SELECT name
FROM students
WHERE department IN (
    SELECT department
    FROM students
    WHERE name = 'Arun'
);
SELECT name
FROM students
WHERE department = (
    SELECT department
    FROM students
    WHERE marks = (
        SELECT MAX(marks)
        FROM students
    )
);
SELECT s.name, s.marks, s.department
FROM students s
WHERE s.marks > (
    SELECT AVG(s2.marks)
    FROM students s2
    WHERE s.department = s2.department
);
SELECT name AS student_name,
       marks AS score
FROM students;
SELECT s.name, s.marks
FROM students s;
SELECT s1.name, s2.name
FROM students s1
JOIN students s2
ON s1.department = s2.department
WHERE s1.student_id <> s2.student_id;
SELECT dept_avg.department,
       dept_avg.avg_marks
FROM (
    SELECT department,
           AVG(marks) AS avg_marks
    FROM students
    GROUP BY department
) AS dept_avg;