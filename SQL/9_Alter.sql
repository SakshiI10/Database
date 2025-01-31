-- Alter: To change the schema

USE college;
DROP TABLE student;

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

ALTER TABLE student ADD COLUMN age INT NOT NULL DEFAULT 22;

ALTER TABLE student MODIFY COLUMN age VARCHAR(2);
INSERT INTO student (rollno, name, marks, age) 
VALUES
(107, 'STU', 60, 100);

ALTER TABLE student CHANGE age student_age INT;
INSERT INTO student (rollno, name, marks, student_age) 
VALUES
(107, 'STU', 60, 100);

ALTER TABLE student DROP COLUMN student_age;

-- ALTER TABLE student RENAME TO stu;

-- Truncate (to delete table's data)
TRUNCATE TABLE student ;
-- After this you can reinsert the data

SELECT * FROM student;