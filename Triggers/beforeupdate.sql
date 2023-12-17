
CREATE TABLE employee(
    id int AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    AGE INT ,
    SALARY FLOAT
);


INSERT INTO employee(name,age,salary)VALUES("mr hello",22,25000.00);


TRUNCATE  employee;


DELIMITER //
CREATE TRIGGER salarychek
BEFORE UPDATE ON employee
FOR EACH ROW
BEGIN
    IF new.salary>20000.00 THEN SET new.salary=30000.00;
    END IF;
END //
DELIMITER;

DELIMITER //
CREATE TRIGGER salarycheknega
BEFORE UPDATE ON employee
FOR EACH ROW
BEGIN
    IF new.salary<0 THEN SET new.salary=0;
    END IF;
END //
DELIMITER;

DROP TRIGGER salarycheknega;
SELECT *
FROM employee;

UPDATE employee
SET salary=-21000.00
WHERE id=2;









