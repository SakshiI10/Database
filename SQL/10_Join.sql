--  JOIN

USE college;
-- 1. Inner join:

CREATE TABLE student(
	id INT PRIMARY KEY,
    name VARCHAR(50)
);
INSERT INTO student (id, name) VALUES
(101, "Adam"),
(102, "Bob"),
(103, "Casey");

CREATE TABLE course(
	id INT PRIMARY KEY,
    course VARCHAR(50)
);
INSERT INTO course (id, course) VALUES
(102, "English"),
(105, "Math"),
(103, "Science"),
(107, "Computer Science");

--  1. Inner Join: Returns records that have matching values in both tables
SELECT * FROM student INNER JOIN course 
ON student.id = course.id;

--  2. Left Join: Returns all records from the left table, and the matched records from the right table
SELECT * FROM student LEFT JOIN course 
ON student.id = course.id;

-- 3. Right Join: Returns all records from the right table, and the matched records from the left table
SELECT * FROM student RIGHT JOIN course 
ON student.id = course.id;

--  4. Full Join: Returns all records when there is a match in either left or right table
SELECT * FROM student LEFT JOIN course 
ON student.id = course.id
UNION
SELECT * FROM student RIGHT JOIN course 
ON student.id = course.id;

--  5. Self Join: It is a regular join but the table is joined with itself
CREATE TABLE employee(
	id 	INT PRIMARY KEY,
    name VARCHAR(50),
    manager_id INT
);
INSERT INTO employee (id, name, manager_id)
VALUES
(101, "Adam", 103),
(102, "Bob", 104),
(103, "Carry", NULL),
(104, "Donald", 103);

SELECT * FROM employee as a JOIN employee as b
ON a.id = b.manager_id;

SELECT a.name as manager_name, b.name
FROM employee as a
JOIN employee as b
ON a.id = b.manager_id;

SELECT * FROM student;
SELECT * FROM course;