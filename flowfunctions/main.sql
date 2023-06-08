

DELIMITER //

CREATE PROCEDURE fun1()
BEGIN
    DECLARE a_ INT DEFAULT 1;
    if exists (select 1 from "numbers" where table_name = 'numbers') THEN
         
    IF SELECT 1 FROM numberss LIMIT 1 THEN
     CREATE TABLE numbers (id INT);
    WHILE a_ <= 10 DO
        INSERT INTO numbers (id) VALUES (a_);
        SET a_ = a_ + 1;
    END WHILE;
    
    SELECT * FROM numbers;
    
    -- Drop the table after use
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE  fun3()
BEGIN
    DECLARE a_ INT DEFAULT 1;
    IF NOT(EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name ="numbers")) THEN
        CREATE TABLE numbers (id INT);
    ELSE  
        WHILE a_ <= 10 DO
        INSERT INTO numbers (id) VALUES (a_);
        SET a_ = a_ + 1;
        END WHILE;
    END IF;
END //
DELIMITER ;


DROP TABLE numbers;
DROP FUNCTION fun3;

SELECT fun3("bookss");
CALL fun3();

DROP PROCEDURE fun3;

SELECT * FROM numbers;

CALL fun3();


SELECT IF(MOD(ID, 2) = 0, 'true', "false") AS result FROM numbers;


SELECT *
FROM payment 
cross JOIN staff ;





DELIMITER //



SELECT * FROM numbers;
SELECT EXIT(USE numbers);
TRUNCATE numbers;


SHOW TABLES;


SELECT * FROM payment;
SELECT * FROM rental;
SELECT * FROM staff;




DECLARE counter INT DEFAULT 1;


DELIMITER //
CREATE PROCEDURE see()
BEGIN
    DECLARE counter INT DEFAULT 1;
    CREATE TABLE IF NOT EXISTS counters(number INT);
    my_loop: LOOP
        SET counter = counter + 1;
        
        IF counter > 5 THEN
            LEAVE my_loop;
        END IF;
        INSERT INTO counters(counter)
    END LOOP my_loop;
    
END //
DELIMITER ;

DROP PROCEDURE see;

CALL see();


SELECT * FROM country
WHERE country_id BETWEEN 70 AND 80
ORDER BY country_id DESC
LIMIT 3

