CREATE TABLE customer (
  customer_id INT,
  name        VARCHAR(30),
  city        VARCHAR(15)
)
PARTITION BY RANGE (customer_id) (
  PARTITION p1 VALUES LESS THAN (103),
  PARTITION p2 VALUES LESS THAN (105),
  PARTITION p3 VALUES LESS THAN MAXVALUE
);

INSERT INTO customer VALUES (101, 'Rahul', 'Mumbai');
INSERT INTO customer VALUES (102, 'Anita', 'Delhi');
INSERT INTO customer VALUES (103, 'Vikas', 'Pune');
INSERT INTO customer VALUES (104, 'Sana',  'Mumbai');
INSERT INTO customer VALUES (105, 'Rohit', 'Chennai');
INSERT INTO customer VALUES (106, 'Meena', 'Delhi');
COMMIT;

UPDATE customer SET city = 'Pune' WHERE customer_id = 105;  -- not the key, so no movement
DELETE FROM customer WHERE customer_id = 104;
COMMIT;

SELECT * FROM customer PARTITION (p1);
SELECT * FROM customer PARTITION (p2);
SELECT * FROM customer PARTITION (p3);





-- Create table
CREATE TABLE customer_h (
    customer_id INT,
    name VARCHAR(30),
    city VARCHAR(20),
    amount INT
)
PARTITION BY LIST COLUMNS (city) (
    PARTITION p_mum VALUES IN ('Mumbai'),
    PARTITION p_del VALUES IN ('Delhi'),
    PARTITION p_oth VALUES IN ('Pune', 'Chennai')
);

-- Insert records
INSERT INTO customer_h VALUES
(101, 'Amit', 'Mumbai', 5000),
(102, 'Neha', 'Delhi', 7000),
(103, 'Rahul', 'Pune', 4500),
(104, 'Priya', 'Chennai', 6000),
(105, 'Karan', 'Mumbai', 8000),
(106, 'Sneha', 'Delhi', 9000),
(107, 'Rohan', 'Pune', 5500),
(108, 'Meera', 'Chennai', 7500);

COMMIT;

-- Update record
UPDATE customer_h
SET city = 'Delhi'
WHERE customer_id = 103;

-- Delete record
DELETE FROM customer_h
WHERE customer_id = 104;

COMMIT;

-- Display all records
SELECT * FROM customer_h;

-- Display individual partitions
SELECT * FROM customer_h PARTITION (p_mum);

SELECT * FROM customer_h PARTITION (p_del);

SELECT * FROM customer_h PARTITION (p_oth);


USE ADBMS;

-- Create table
CREATE TABLE customer_hash (
    customer_id INT,
    name VARCHAR(30),
    city VARCHAR(20),
    amount INT
)
PARTITION BY HASH (customer_id)
PARTITIONS 4;

-- Insert records
INSERT INTO customer_hash VALUES
(101, 'Amit', 'Mumbai', 5000),
(102, 'Neha', 'Delhi', 7000),
(103, 'Rahul', 'Pune', 4500),
(104, 'Priya', 'Chennai', 6000),
(105, 'Karan', 'Mumbai', 8000),
(106, 'Sneha', 'Delhi', 9000),
(107, 'Rohan', 'Pune', 5500),
(108, 'Meera', 'Chennai', 7500);

COMMIT;

-- Update record
UPDATE customer_hash
SET amount = 10000
WHERE customer_id = 101;

-- Delete record
DELETE FROM customer_hash
WHERE customer_id = 104;

COMMIT;

-- Display all records
SELECT * FROM customer_hash;

-- Display individual partitions
SELECT * FROM customer_hash PARTITION (p0);

SELECT * FROM customer_hash PARTITION (p1);

SELECT * FROM customer_hash PARTITION (p2);

SELECT * FROM customer_hash PARTITION (p3);
