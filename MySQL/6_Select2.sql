-- SELECT IN DETAIL-2

USE college;

-- Aggregate Functions: Aggregare functions perform a calculation on a set of values, and return a single value.
-- COUNT( )
-- MAX( )
-- MIN( )
-- SUM( )
-- AVG( )
SELECT COUNT(marks) FROM student;
SELECT MAX(marks) FROM student;
SELECT MIN(marks) FROM student;
SELECT SUM(marks) FROM student;
SELECT AVG(marks) FROM student;

-- GROUP BY clause: 
-- Groups rows that have the same values into summary rows.
-- It collects data from multiple records and groups the result by one or more column.
-- *Generally we use group by with some aggregation function.
SELECT city, count(name) FROM student GROUP BY city;

-- HAVING Clause:
-- Similar to Where i.e. applies some condition on rows.
-- Used when we want to apply any condition after grouping.
-- Count number of students in each city where max marks cross 90.
SELECT city, count(name) FROM student GROUP BY city HAVING MAX(marks) > 90;

-- General Order
-- SELECT column(s)
-- FROM table_name
-- WHERE condition
-- GROUP BY column(s)
-- HAVING condition
-- ORDER BY column(s) ASC;
