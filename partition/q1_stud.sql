create database ADBMS;

use ADBMS;

CREATE TABLE student (
 roll_no INT,
 name VARCHAR(50),
 department VARCHAR(50),
 marks INT
) 
PARTITION BY RANGE (marks) (
PARTITION p_fail VALUES LESS THAN (40),
PARTITION p_avg VALUES LESS THAN (70),
PARTITION p_top VALUES LESS THAN MAXVALUE
);

INSERT INTO student VALUES (1,'Amit','CSE',35);
INSERT INTO student VALUES (2, 'Neha',  'IT',  55);
INSERT INTO student VALUES (3, 'Ravi',  'CSE', 82);
INSERT INTO student VALUES (4, 'Pooja', 'ECE', 68);
INSERT INTO student VALUES (5, 'Karan', 'IT',  91);
INSERT INTO student VALUES (6, 'Sneha', 'CSE', 28);
COMMIT;

UPDATE student SET marks=45 WHERE roll_NO=1;

DELETE FROM student WHERE roll_no=4;

SELECT * FROM student PARTITION (p_fail);
SELECT * FROM student PARTITION (p_avg);
SELECT * FROM student PARTITION (p_top);

CREATE TABLE student_h (roll_no INT, name VARCHAR(30), department VARCHAR(10), marks INT)
PARTITION BY HASH (roll_no) PARTITIONS 3;


INSERT INTO student_h VALUES
(7, 'Rahul', 'CSE', 78),
(8, 'Priya', 'IT', 92),
(9, 'Sahil', 'ECE', 66),
(10, 'Anjali', 'CSE', 88),
(11, 'Vikas', 'IT', 73),
(12, 'Sneha', 'ECE', 95),
(13, 'Arjun', 'CSE', 81),
(14, 'Meera', 'IT', 69),
(15, 'Rohan', 'ECE', 84);

SELECT * FROM student_h;

SELECT * FROM student_h PARTITION (p0);

SELECT * FROM student_h PARTITION (p1);

SELECT * FROM student_h PARTITION (p2);