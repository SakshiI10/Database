-- USING CASCADE

USE college;

CREATE TABLE dept(
	id INT PRIMARY KEY,
    name VARCHAR(50)
);
INSERT INTO dept VALUES
(101, "ENGLISH"),
(102, "IT");
UPDATE dept SET id=103 WHERE id=102;
SELECT * FROM dept;

CREATE TABLE teacher(
	id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES dept(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);
INSERT INTO teacher VALUES
(101, "ADAM",101),
(102, "EVE", 102);
SELECT * FROM dept;

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

DROP TABLE student;
DROP TABLE teacher;
DROP TABLE dept;
