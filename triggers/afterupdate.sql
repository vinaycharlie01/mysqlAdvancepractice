

CREATE DATABASE triggers2;
USE triggers2;


CREATE TABLE employee(
    id int AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    AGE INT ,
    SALARY FLOAT
);


INSERT INTO employee(name,age,salary)VALUES("mr karhiuk",22,30000.00);


SELECT * FROM employee;


CREATE Table CHEKUP(
    ID INT ,
    CHEKSAL VARCHAR(225) NOT NULL
);

SELECT * FROM CHEKUP;


DELIMITER //
CREATE TRIGGER chekvalidsal
AFTER UPDATE ON employee
FOR EACH ROW
BEGIN
    IF new.age<=0 THEN 
    INSERT INTO chekvalid(id,message)
    VALUES(new.id,CONCAT("Hey hi"," ",new.name," ","YOUR age need to UPDATE"));
    END IF;
    IF new.salary<=0 THEN
    INSERT INTO chekvalid(id,message)
    VALUES(new.id,CONCAT("Hey hi"," ",new.name," ","YOUR salary need to UPDATE"));
    END IF;
END //
DELIMITER;


UPDATE employee
SET salary=21000.00
WHERE salary=30000.00;


SELECT *
FROM employee;

DROP TRIGGER IF EXISTS  chekvalidsal;


SELECT DATE_FORMAT(NOW(), '%Y-%m-%d %H:%i:%s') AS result;
SELECT CURDATE() AS RES;
SELECT NOW() AS result;
-- DROP TRIGGER IF EXISTS chekvalidsal;