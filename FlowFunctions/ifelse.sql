



SHOW DATABASES;

USE sakila;

SHOW TABLES;

SELECT 
    CASE 
        WHEN population>=25500100 THEN  CONCAT(name,"this Contry is eligible ")
        ELSE
        CONCAT(name,"this Contry is NOT eligible ")
    END  AS "RES"
FROM world;

SELECT * FROM world;
DELIMITER //

CREATE PROCEDURE shows()
BEGIN
    SELECT 
        IF(
            area = 28748, CONCAT('YES', ''), 
            IF(area = 468, CONCAT('NO', ''),
            IF(area = 1246700, CONCAT('YESNO', ''),"NOTVALID"))) AS res
    FROM world;
END //
DELIMITER ;


CALL shows();

DROP PROCEDURE shows;


DELIMITER //
CREATE PROCEDURE chekifelse(score INT)
BEGIN
    IF score > 90 THEN
        SELECT 'Excellent';
    ELSEIF score > 70 THEN
        SELECT 'Good';
    ELSE
        SELECT 'Average';
    END IF;
END //
DELIMITER ;


CALL  chekifelse(100);



DELIMITER //
CREATE PROCEDURE chekloop(score INT)
BEGIN
    DECLARE counter INT DEFAULT 1;
    CREATE TABLE IF NOT EXISTS scores(id INT PRIMARY KEY);
    my_loop: LOOP
        INSERT INTO scores VALUES(counter);
        SET counter = counter + 1;
        IF counter > 5 THEN
            LEAVE  my_loop;
        END IF;
    END LOOP  my_loop;
END //
DELIMITER ;




DELIMITER //
CREATE PROCEDURE chekloop2(score INT)
BEGIN
    DECLARE TOTALCOUNT INT;
    DECLARE counter INT DEFAULT 1;
    CREATE TABLE IF NOT EXISTS scores(id INT PRIMARY KEY);
    my_loop: LOOP
        INSERT INTO scores VALUES(counter);
        SET counter = counter + 1;
        SELECT COUNT(*) INTO TOTALCOUNT  FROM country;
        IF counter >TOTALCOUNT THEN
            LEAVE my_loop;
        END IF;
    END LOOP  my_loop;
END //
DELIMITER ;



DELIMITER //
CREATE PROCEDURE chekloop3(score INT)
BEGIN
    DECLARE TOTALCOUNT INT;
    DECLARE counter INT DEFAULT 1;
    CREATE TABLE IF NOT EXISTS scores(id INT PRIMARY KEY);
    SELECT COUNT(*) INTO TOTALCOUNT  FROM country;
    WHILE counter<TOTALCOUNT DO
        INSERT INTO scores VALUES(counter);
        SET counter = counter + 1;
    END WHILE;
END //
DELIMITER ;
DROP PROCEDURE IF EXISTS chekloop3;

SELECT * FROM scores;
TRUNCATE scores;

CALL chekloop3(100);

SELECT @TOTALCOUNT;


DELIMITER //
CREATE PROCEDURE chekloop4(score INT)
BEGIN
    DECLARE TOTALCOUNT INT;
    DECLARE counter INT DEFAULT 1;
    CREATE TABLE IF NOT EXISTS scores(id INT PRIMARY KEY);
    SELECT COUNT(*) INTO TOTALCOUNT FROM country;
    REPEAT
        INSERT INTO scores VALUES (counter);
        SET counter = counter + 1;
        UNTIL counter < TOTALCOUNT 
    END REPEAT;
END //
DELIMITER ;


DROP PROCEDURE chekloop4;




