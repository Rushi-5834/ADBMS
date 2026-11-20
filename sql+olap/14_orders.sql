CREATE TABLE orders (
  order_id      INT PRIMARY KEY,
  product_name  VARCHAR(20),
  customer_name VARCHAR(20),
  quantity      INT,
  total_amount  INT
);
INSERT INTO orders VALUES (1, 'Mouse',    'Amit',  2, 1000);
INSERT INTO orders VALUES (2, 'Keyboard', 'Neha',  1, 1500);
INSERT INTO orders VALUES (3, 'Mouse',    'Ravi',  1, 500);
INSERT INTO orders VALUES (4, 'Monitor',  'Amit',  1, 9000);
INSERT INTO orders VALUES (5, 'Keyboard', 'Pooja', 2, 3000);
COMMIT;

-- (a)
SELECT * FROM orders;
-- (b)
SELECT SUM(total_amount) AS total_order_amount FROM orders;
-- (c)
SELECT product_name, SUM(total_amount) AS total_amount FROM orders GROUP BY product_name;
CREATE TABLE orders (
  order_id      INT PRIMARY KEY,
  product_name  VARCHAR(20),
  customer_name VARCHAR(20),
  quantity      INT,
  total_amount  INT
);
INSERT INTO orders VALUES (1, 'Mouse',    'Amit',  2, 1000);
INSERT INTO orders VALUES (2, 'Keyboard', 'Neha',  1, 1500);
INSERT INTO orders VALUES (3, 'Mouse',    'Ravi',  1, 500);
INSERT INTO orders VALUES (4, 'Monitor',  'Amit',  1, 9000);
INSERT INTO orders VALUES (5, 'Keyboard', 'Pooja', 2, 3000);
COMMIT;

-- (a)
SELECT * FROM orders;
-- (b)
SELECT SUM(total_amount) AS total_order_amount FROM orders;
-- (c)
SELECT product_name, SUM(total_amount) AS total_amount FROM orders GROUP BY product_name;
