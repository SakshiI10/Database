-- VIEWS: A view is a virtual table based on the result-set of an SQL statement.

USE college;
DROP TABLE IF EXISTS student;

CREATE TABLE student(
    rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(20)
);
INSERT INTO student (rollno, name, marks, grade, city) 
VALUES
(101, 'ABC', 78, 'C', 'Pune'),
(102, 'DEF', 93, 'A', 'Mumbai'),
(103, 'GHI', 85, 'B', 'Mumbai'),
(104, 'JKL', 96, 'A', 'Delhi'),
(105, 'MNO', 12, 'F', 'Delhi'),
(106, 'PQR', 82, 'B', 'Delhi');

DROP VIEW IF EXISTS view1;

CREATE VIEW view1 AS
SELECT rollno, name, marks FROM student;

SELECT * FROM view1;



CREATE TABLE student2 (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE course2 (
    id INT PRIMARY KEY,
    course VARCHAR(50)
);

INSERT INTO student2 (id, name) VALUES
(101, 'Adam'),
(102, 'Bob'),
(103, 'Casey');

INSERT INTO course2 (id, course) VALUES
(102, 'English'),
(105, 'Math'),
(103, 'Science'),
(107, 'Computer Science');

CREATE VIEW student_course_view AS
SELECT s.id, s.name, c.course
FROM student2 s
JOIN course2 c 
ON s.id = c.id;

SELECT * FROM student_course_view;
