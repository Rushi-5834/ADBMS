CREATE TABLE sales (
  sale_id      INT PRIMARY KEY,
  product_name VARCHAR(20),
  quantity     INT,
  amount       INT
);
INSERT INTO sales VALUES (1, 'Pen',      10, 100);
INSERT INTO sales VALUES (2, 'Notebook',  5, 250);
INSERT INTO sales VALUES (3, 'Pen',      20, 200);
INSERT INTO sales VALUES (4, 'Bag',       2, 1800);
INSERT INTO sales VALUES (5, 'Notebook', 10, 500);
COMMIT;

-- (a) all records
SELECT * FROM sales;
-- (b) total sales amount
SELECT SUM(amount) AS total_sales FROM sales;
-- (c) product-wise total
SELECT product_name, SUM(amount) AS total_amount FROM sales GROUP BY product_name;
