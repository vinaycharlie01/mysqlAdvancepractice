
CREATE TABLE employee(
    id int AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    AGE INT ,
    SALARY FLOAT
);


INSERT INTO employee(name,age,salary)VALUES("mr hello",22,25000.00);





DELIMITER //
CREATE TRIGGER salarychekupdate
BEFORE UPDATE ON employee
FOR EACH ROW
BEGIN
    IF new.age<=0 THEN SET new.age=0;
    END IF;
    IF new.salary<=0 THEN SET new.salary=0;
    END IF;
END //
DELIMITER;

DROP TRIGGER IF EXISTS  salarychekupdate;

SELECT *
FROM employee;

UPDATE employee
SET salary=21000.00
WHERE salary=20000.00



SELECT DATE_ADD(NOW(), INTERVAL 1 MONTH) AS result;




