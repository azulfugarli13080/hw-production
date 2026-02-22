CREATE TABLE STUDENTS (
    ID INT,
    FIRSTNAME VARCHAR(20),
    LASTNAME VARCHAR(20)
);

CREATE TABLE ACTIVITIES (
    STUDENT_ID INT,
    ACTIVITY VARCHAR(25),
    LEVEL VARCHAR(10)
);

INSERT INTO STUDENTS VALUES
(1, 'James', 'Reyes'),
(2, 'Tiffany', 'Wolf'),
(3, 'David', 'Palmer');

INSERT INTO ACTIVITIES VALUES
(1, 'Tennis', 'Advanced'),
(1, 'Literature', 'Beginner'),
(1, 'Tennis', 'Advanced'),
(2, 'Football', 'Beginner'),
(3, 'Music', 'Advanced'),
(3, 'Chess', 'Beginner'),
(2, 'Tennis', 'Beginner'),
(1, 'Chemistry', 'Beginner'),
(3, 'Music', 'Advanced');

BEGIN;
-- first i rename column id
ALTER TABLE STUDENTS
RENAME COLUMN ID TO STUDENT_ID;
-- then increase name column lenghts 
ALTER TABLE STUDENTS
ALTER COLUMN FIRSTNAME TYPE VARCHAR(40);

ALTER TABLE STUDENTS
ALTER COLUMN LASTNAME TYPE VARCHAR(40);

-- i create new table for the new structure
CREATE TABLE NEW_ACTIVITIES (
    STUDENT_ID INT,
    ACTIVITIES TEXT[],
    LEVELS TEXT[]
);

-- insert cleaned activities and remove duplicates , and also NULL values
INSERT INTO NEW_ACTIVITIES (STUDENT_ID, ACTIVITIES, LEVELS)
SELECT 
    s.STUDENT_ID,
    ARRAY_AGG(s.ACTIVITY),
    ARRAY_AGG(s.LEVEL)
FROM (
    SELECT DISTINCT STUDENT_ID, ACTIVITY, LEVEL
    FROM ACTIVITIES
    WHERE ACTIVITY IS NOT NULL 
      AND LEVEL IS NOT NULL
) s
GROUP BY s.STUDENT_ID;

-- insert students who don’t have any activities
INSERT INTO NEW_ACTIVITIES (STUDENT_ID, ACTIVITIES, LEVELS)
SELECT STUDENT_ID, ARRAY[]::TEXT[], ARRAY[]::TEXT[]
FROM STUDENTS
WHERE STUDENT_ID NOT IN (
    SELECT STUDENT_ID FROM NEW_ACTIVITIES
);

-- Replace old activities table with new 
DROP TABLE ACTIVITIES;

ALTER TABLE NEW_ACTIVITIES
RENAME TO ACTIVITIES; 

-- to finish our migration 
COMMIT;

-- check result 
SELECT * FROM ACTIVITIES;


