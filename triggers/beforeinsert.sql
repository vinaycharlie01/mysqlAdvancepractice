
-
USE triggers;
CREATE TABLE employee(
    id int AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    AGE INT ,
    SALARY FLOAT
);

SELECT * FROM employee;

SHOW TRIGGERS;


TRUNCATE employee;

INSERT INTO employee(name,age,salary)
VALUES("jhon",22,25000.00),("viky",-20,-3002.00),("smith",-29,32000);





DELIMITER //
CREATE TRIGGER beforeinsertemp
BEFORE INSERT ON employee
FOR EACH ROW
BEGIN
    IF new.age<0 THEN SET new.age=0;
    END IF;
    IF new.salary<0 THEN SET new.salary=0;
    END IF;
END //
DELIMITER;

DROP TRIGGER salarychek;

CREATE TABLE chekvalid(id INT,message VARCHAR(255));

DELIMITER //
CREATE TRIGGER salarychek2
AFTER INSERT ON employee
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

INSERT INTO employee(id,name,age,salary)
VALUES(1,"Vinay",-22,-25000.00);

INSERT INTO chekvalid(id,message)
    VALUES(1,"HEY hi");

TRUNCATE TABLE chekvalid;


SELECT * FROM  chekvalid;

DROP TRIGGER IF EXISTS salarychek2;

SELECT *
FROM employee;

UPDATE employee
SET salary=-2000
WHERE id=2;
