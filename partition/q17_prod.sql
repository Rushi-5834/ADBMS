CREATE TABLE product (
  prod_id  INT,
  name     VARCHAR(30),
  category VARCHAR(15),
  price    INT
)
PARTITION BY RANGE (price) (
  PARTITION p_budget  VALUES LESS THAN (100),
  PARTITION p_mid     VALUES LESS THAN (1000),
  PARTITION p_premium VALUES LESS THAN MAXVALUE
);

INSERT INTO product VALUES (1, 'Pen',        'Stationery',  10);
INSERT INTO product VALUES (2, 'Notebook',   'Stationery',  60);
INSERT INTO product VALUES (3, 'Headphones', 'Electronics', 1500);
INSERT INTO product VALUES (4, 'Mouse',      'Electronics', 450);
INSERT INTO product VALUES (5, 'Laptop',     'Electronics', 55000);
INSERT INTO product VALUES (6, 'Bag',        'Fashion',     900);
COMMIT;

UPDATE product SET price = 1200 WHERE prod_id = 4;  -- Mouse moves from p_mid to p_premium
DELETE FROM product WHERE prod_id = 1;
COMMIT;

SELECT * FROM product PARTITION (p_budget);
SELECT * FROM product PARTITION (p_mid);
SELECT * FROM product PARTITION (p_premium);
