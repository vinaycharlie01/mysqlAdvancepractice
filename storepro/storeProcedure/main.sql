

SHOW DATABASES;


SHOW TABLEs;

USE sakila;

SELECT * FROM country;


SHOW TABLES;
RENAME TABLE world TO world2;


CREATE PROCEDURE getalldetails()
BEGIN
    SELECT * FROM country;
END;

CALL  getalldetails();

CREATE PROCEDURE getdetails(IN id int,IN con VARCHAR(50))
BEGIN
    SELECT * FROM country
    WHERE  country_id=id AND country=con ;
END;

DROP PROCEDURE getalldetails;

CALL getalldetails();


CALL getdetails(4,"Angola");














-- SET @count = CALL GetEmployeeCount();
-- SELECT @count;

CALL GetEmployeeCount(@c);
SELECT @c;



SHOW TABLES;

SELECT * FROM world;

DELIMITER //
CREATE Procedure insertintoworld()
BEGIN
   insert into World (name, continent, area, population, gdp) values ('Angola', 'Africa', '1246700', '20609294', '100990000000');

END //
DELIMITER ;


CALL insertintoworld();

DROP PROCEDURE insertintoworld;





DELIMITER //
CREATE PROCEDURE adda(IN a INT,IN b INT,OUT res INT)
BEGIN
    SET res=a+b;
END //
DELIMITER ;


SET @a INT;
CALL adda(10,20,@a);

DECLARE re INT;

SELECT @a ;



-- SELECT *
-- FROM Tweets
-- where tweet_id IS NOT NULL= (SELECT 
--     CASE 
--         WHEN LENGTH(content)>15 THEN  tweet_id  
--     END AS tweet_id
-- END
-- FROM Tweets)

SELECT tweet_id
FROM Tweets
WHERE LENGTH(content) > 15;


SELECT *
FROM Employees e 
JOIN EmployeeUNI ue
ON e.id =ue.unique_id;


