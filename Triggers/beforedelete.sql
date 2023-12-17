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


CREATE Table DELETEDATA(
    ID INT ,
    NAME VARCHAR(255) 
);



DELIMITER //
CREATE TRIGGER chekdelete
AFTER DELETE ON employee
FOR EACH ROW
BEGIN
     INSERT INTO  DELETEDATA(id,name)
     VALUES(old.id,old.name);
END //
DELIMITER;

DROP TRIGGER  chekdelete;

DELIMITER //
CREATE TRIGGER chekafterdelete
BEFORE DELETE ON employee
FOR EACH ROW
BEGIN
  IF OLD.id = 1 THEN
    -- Prevent the deletion
    -- You can use SIGNAL or RESIGNAL to raise an error or exception
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Deletion not allowed for high-salary employees';
  END IF;
END //
DELIMITER ;


DROP TRIGGER  chekafterdelete;




SELECT * FROM DELETEDATA;

SELECT *
FROM employee;

DELETE FROM employee
WHERE name="Vinay";






-- SELECT DATE_FORMAT(NOW(), '%Y-%m-%d %H:%i:%s') AS result;
-- SELECT CURDATE() AS RES;
-- SELECT NOW() AS result;
-- -- DROP TRIGGER IF EXISTS chekvalidsal;