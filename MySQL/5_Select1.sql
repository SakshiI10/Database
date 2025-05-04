-- SELECT IN DETAIL-1

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

-- Select data to verify
SELECT * FROM student;
SELECT name, marks FROM student;
SELECT city FROM student;

-- DISTINCT keyword
SELECT DISTINCT city FROM student;

-- WHERE clause
SELECT * FROM student WHERE marks>80;
SELECT * FROM student WHERE city='Mumbai';

-- WHERE clause with OPERATORS
SELECT * FROM student WHERE marks>80 AND city='Mumbai';
SELECT * FROM student WHERE marks>90 OR city='Mumbai';
SELECT * FROM student WHERE marks BETWEEN 80 AND 90;
SELECT * FROM student WHERE city IN ('Delhi', 'Mumbai');
SELECT * FROM student WHERE city NOT IN ('Delhi', 'Mumbai');

-- LIMIT clause
SELECT * FROM student LIMIT 3;
SELECT * FROM student WHERE marks > 75 LIMIT 3;

-- ORDER BY clause
SELECT * FROM student;
SELECT * FROM student ORDER BY marks ASC;
SELECT * FROM student ORDER BY marks DESC LIMIT 3;
