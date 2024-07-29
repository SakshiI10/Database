use college;

CREATE TABLE student (
	id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT NOT NULL
);

INSERT INTO student VALUES(1, "Sakshi", 22);
INSERT INTO student VALUES(2, "Sejal", 22);

SELECT * FROM student;