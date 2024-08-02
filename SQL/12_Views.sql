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