


USE sakila;

SHOW TABLES;

SELECT * FROM payment;



SELECT s.first_name ,
    CASE
        WHEN  amount>=4 THEN  "Valid"
        ELSE  
            "Invalid"
     END AS result
 FROM payment p
 JOIN staff s; 

 SELECT  * FROM staff;


 
SELECT 
    IF (amount IN (2.99),'Valid','Not Valid') AS result
 FROM payment;


SELECT first_name,IF(picture IS NOT NULL,"Uploded","NOTUPLODED") AS uploded_photo
FROM staff;

SELECT NULLIF(amount, 7.99)
FROM payment;


SELECT  IFNULL(NULLIF(amount, 7.99),"VALID")
FROM payment;



SELECT * FROM actor;


SELECT IF(LENGTH(first_name)=LENGTH(last_name),CONCAT(first_name," ",last_name),NULL)as res
FROM actor;



-- NULLIF(), IFNULL(),





SELECT 
-- WHERE NULLIF(amount, 7.99) IS NOT NULL;