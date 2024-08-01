-- TABLE RELATED Queries-2
USE college;

--  UPDATE
UPDATE student SET grade = 'O' WHERE grade = 'A';

-- DELETE
DELETE FROM student WHERE marks<33;
