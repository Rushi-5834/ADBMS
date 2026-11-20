CREATE TABLE student_result (
  student_id   INT,
  student_name VARCHAR(20),
  subject      VARCHAR(20),
  marks        INT,
  semester     INT
);
INSERT INTO student_result VALUES (1, 'Amit', 'DBMS',  78, 3);
INSERT INTO student_result VALUES (1, 'Amit', 'Maths', 65, 3);
INSERT INTO student_result VALUES (2, 'Neha', 'DBMS',  85, 3);
INSERT INTO student_result VALUES (2, 'Neha', 'Maths', 72, 3);
INSERT INTO student_result VALUES (3, 'Ravi', 'DBMS',  60, 3);
INSERT INTO student_result VALUES (3, 'Ravi', 'Maths', 90, 3);
COMMIT;

-- (a)
SELECT * FROM student_result;
-- (b)
SELECT AVG(marks) AS average_marks FROM student_result;
-- (c)
SELECT subject, AVG(marks) AS avg_marks FROM student_result GROUP BY subject;
