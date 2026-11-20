CREATE TABLE employee (
  emp_id INT,
  name   VARCHAR(30),
  dept   VARCHAR(15),
  salary INT
)
PARTITION BY RANGE (salary) (
  PARTITION p_low  VALUES LESS THAN (30000),
  PARTITION p_mid  VALUES LESS THAN (60000),
  PARTITION p_high VALUES LESS THAN MAXVALUE
);

INSERT INTO employee VALUES (101, 'Arun',   'HR',      25000);
INSERT INTO employee VALUES (102, 'Bina',   'IT',      45000);
INSERT INTO employee VALUES (103, 'Chetan', 'IT',      72000);
INSERT INTO employee VALUES (104, 'Deepa',  'Sales',   28000);
INSERT INTO employee VALUES (105, 'Esha',   'Finance', 58000);
INSERT INTO employee VALUES (106, 'Farhan', 'IT',      95000);
COMMIT;

UPDATE employee SET salary = 65000 WHERE emp_id = 105;  -- row moves from p_mid to p_high
DELETE FROM employee WHERE emp_id = 104;
COMMIT;

SELECT * FROM employee PARTITION (p_low);
SELECT * FROM employee PARTITION (p_mid);
SELECT * FROM employee PARTITION (p_high);
