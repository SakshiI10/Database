-- SQL Sub queries: A Subquery or Inner query or a Nested query is a query within another SQL query.
-- It involves 2 select statements.
-- Syntax
-- SELECT column(s)
-- FROM table_name
-- WHERE col_name operator
-- ( subquery );

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
SELECT * FROM student;

-- Eg.1
SELECT name, marks FROM student WHERE marks > (SELECT AVG(marks) FROM student);

--  Eg.2
SELECT name, rollno FROM student WHERE rollno IN (SELECT rollno FROM student WHERE rollno %2=0);

-- Eg.3
SELECT MAX(marks)
FROM (SELECT * FROM student WHERE city = "Mumbai") AS temp;