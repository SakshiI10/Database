-- Table related queries-1

use college;

CREATE TABLE student (
	id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT NOT NULL
);

-- Select and View all (*) columns
SELECT * FROM student;

-- Insert 
INSERT INTO student VALUES(1, "Sakshi", 22);
INSERT INTO student VALUES(2, "Sejal", 22);
