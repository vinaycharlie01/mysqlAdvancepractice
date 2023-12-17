

use sakila;


DELIMITER //
CREATE FUNCTION daychek(day VARCHAR(20))
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE name VARCHAR(20);
    CASE 
    WHEN day = 'Monday' THEN
       SET name= 'Start of the week';
    WHEN day = 'Friday' THEN
       SET name= 'End of the week';
    ELSE
       SET name= 'Regular day';
    END CASE;
    RETURN name;
END //
DELIMITER;


SELECT  daychek("friday");

CREATE Table days (name VARCHAR(10));
INSERT INTO days(name) VALUES ("Monday"),("Tuesday"),("Wednesday"),("Thursday"),("Friday"),("Saturday");


SELECT * FROM days;

SELECT  daychek(name) FROM days;

DELIMITER //
CREATE PROCEDURE chek(OUT res VARCHAR(10))
BEGIN
    SET res = "Hello, world!";
END //
DELIMITER ;

SET res VARCHAR(50);
CALL chek(@res);

SELECT @res;



DELIMITER //

CREATE PROCEDURE CalculateSum(IN a INT, IN b INT, OUT result INT)
BEGIN
    SET result = a + b;
END //

DELIMITER ;



SET @output = 0;
CALL CalculateSum(10, 20, @output);

SELECT @output;




