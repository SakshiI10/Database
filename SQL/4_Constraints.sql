-- Constraints
-- SQL Constraints are used to specify rules for data in a table.

USE college;

-- 1. NOT NULL: Columns can't have a null value.
CREATE TABLE temp(
id INT NOT NULL
);
SELECT * FROM temp;

-- 2. UNIQUE: 
CREATE TABLE temp1 (
id INT UNIQUE
);

INSERT INTO temp1 values(1);
INSERT INTO temp1 values(2);
INSERT INTO temp1 values(3);
INSERT INTO temp1 values(3);

SELECT * FROM temp1;

-- 3. Primary Key: makes a column unique and not null but used only for one.
DROP TABLE IF EXISTS temp2;

CREATE TABLE temp2(
    id INT NOT NULL,
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    city VARCHAR(20),
    PRIMARY KEY (id, name)
);

INSERT INTO temp2 (id, name, age, city) VALUES
(1, 'Alice', 30, 'New York'),
(2, 'Bob', 25, 'Los Angeles'),
(3, 'Charlie', 35, 'Chicago');

SELECT * FROM temp2;

-- 4. Foreign Key: prevent actions that would destroy links between tables
DROP TABLE IF EXISTS temp3;

CREATE TABLE temp3(
    cust_id INT NOT NULL,
    FOREIGN KEY (cust_id) references temp2(id)
);

INSERT INTO temp3 (cust_id) VALUES
(1),
(2),
(3);

SELECT * FROM temp3;

-- 5. Default: sets the default value of a column
CREATE TABLE emp(
	id INT NOT NULL,
    salary INT DEFAULT 15000
);

INSERT INTO emp(id) VALUES(101);
SELECT * FROM emp;

-- 6. Check: it can limit the values allowed in a column
CREATE TABLE city(
	id INT PRIMARY KEY,
    city VARCHAR(50),
    age INT,
    CONSTRAINT age_check CHECK (age >= 18 AND city="DELHI")
);
