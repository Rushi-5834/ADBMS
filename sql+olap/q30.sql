CREATE TABLE student1 (
  roll_no      INT PRIMARY KEY,
  student_name VARCHAR(20),
  department   VARCHAR(10),
  city         VARCHAR(15),
  marks        INT
);
INSERT INTO student1 VALUES (1, 'Amit',  'CSE', 'Pune',   78);
INSERT INTO student1 VALUES (2, 'Neha',  'IT',  'Mumbai', 55);
INSERT INTO student1 VALUES (3, 'Ravi',  'CSE', 'Delhi',  82);
INSERT INTO student1 VALUES (4, 'Pooja', 'ECE', 'Pune',   68);
INSERT INTO student1 VALUES (5, 'Karan', 'IT',  'Mumbai', 91);
INSERT INTO student1 VALUES (6, 'Sneha', 'CSE', 'Pune',   28);
COMMIT;

-- (a)
SELECT * FROM student1;
-- (b)
SELECT MAX(marks) AS max_marks FROM student1;
-- (c)
SELECT department, AVG(marks) AS avg_marks FROM student1 GROUP BY department;

