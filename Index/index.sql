

SHOW DATABASES;



USE indexs;


SHOW TABLES;

DESCRIBE product;



SELECT * 
FROM product
ORDER BY price ;


-- Create a primary key index



CREATE INDEX index_price ON product(price DESC);

DROP INDEX index_price ON product;

SHOW INDEX FROM PRODUCT;



EXPLAIN SELECT * FROM product WHERE price =100000;

SHOW INDEX FROM product WHERE Key_name = 'PRIMARY';


ALTER TABLE product
MODIFY id INT COMMENT 'this is unique id';

ALTER TABLE product
ALTER INDEX PRIMARY KEY COMMENT 'this is primanry key index';


ALTER TABLE product
DROP PRIMARY KEY;

ALTER TABLE product
MODIFY PRIMARY KEY (id) COMMENT 'This is the primary key index2';
-- SELECT column_name, column_comment
-- FROM information_schema.COLUMNS
-- WHERE table_schema = 'indexs' -- Replace with your database name
--   AND table_name = 'product';






-- ALTER TABLE product
-- DROP INDEX index_price,
-- ADD INDEX index_price (price) COMMENT 'This is the price index';


ALTER TABLE product
DROP PRIMARY KEY;

SELECT * FROM product;

ALTER TABLE product ADD INDEX hash_product USING HASH (aboutcompany);












show TABLEs;

SELECT * FROM cities;



CREATE UNIQUE INDEX idx_uniqe ON cities (name);
DROP INDEX idx_uniqe on cities;

SHOW INDEX FROM cities;

EXPLAIN 
SELECT * 
FROM cities
WHERE name="Phoenix";


EXPLAIN INSERT INTO cities (name,location) VALUES("Phoenix2",POINT(-73.935242, 40.730610));



-- ALTER TABLE example_table ADD FULLTEXT INDEX idx_column3 (column3);

CREATE FULLTEXT INDEX idx_fulltext ON product (Discription
);
DROP INDEX idx_fulltext;


EXPLAIN SELECT * FROM product
WHERE MATCH(Discription) AGAINST('apple');



-- SELECT * FROM INFORMATION_SCHEMA.STATISTICS
-- WHERE TABLE_SCHEMA = 'indexs'
--   AND TABLE_NAME = 'product'
--   AND INDEX_NAME = 'hash_product';




-- ALTER TABLE example_table ADD SPATIAL INDEX idx_column6 (column6);
CREATE SPATIAL INDEX  idx_spt ON product(locations);

drop INDEX idx_spt ON product;

SHOW INDEX FROM product;



-- EXPLAIN SELECT *
-- FROM product
-- WHERE ST_WITHIN(locations, POINT(-84.388, 33.749)) <= 1000;