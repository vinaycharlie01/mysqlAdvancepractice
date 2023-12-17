



USE triggers;


-- CREATE TABLE customers1(
--     id int AUTO_INCREMENT PRIMARY KEY,
--     name VARCHAR(30) NOT NULL,
--     email VARCHAR(40),
--     dateofbith DATE
-- );



CREATE TABLE message(
    id int AUTO_INCREMENT,
    messgageID int,
    message VARCHAR(225) NOT NULL,
    PRIMARY KEY (id,messgageID)
);

DROP TABLE message;



DELIMITER //
CREATE TRIGGER chek_NULL_DOB
AFTER INSERT ON customers1
FOR EACH ROW
BEGIN
    IF NEW.dateofbith IS NULL THEN
    INSERT INTO message(messgageID,message)
    VALUES (NEW.id,CONCAT("Hi"," ",new.name,"Please update date of Birth"));
    END IF;
END;
DELIMITER ;

DROP TRIGGER IF EXISTS chek_NULL_DOB;

-- DELIMITER//
INSERT INTO customers1(name,email, dateofbith)
VALUES("karthik","vinay@gmail.com",NULL);



DELIMITER//
SELECT *
FROM message;

SELECT * FROM customers1;






-- before update






CREATE TABLE employee(
    id int AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    AGE INT ,
    SALARY FLOAT
);


INSERT INTO employee(name,age,salary)VALUES("mr hello",22,25000.00);





DELIMITER //
CREATE TRIGGER salarychek
BEFORE UPDATE ON employee
FOR EACH ROW
BEGIN
    IF new.salary>20000.00 THEN SET new.salary=30000.00;
    END IF;
END //
DELIMITER;


SELECT *
FROM employee;

UPDATE employee
SET salary=21000.00
WHERE salary=20000.00




