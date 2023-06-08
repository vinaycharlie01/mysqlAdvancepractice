SHOW DATABASES;


SHOW TABLEs;

USE sakila;

SELECT * FROM country;





-- Create the table
CREATE TABLE my_table (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  age INT
);

-- Insert a value into the table
INSERT INTO my_table (id, name, age) VALUES (1, 'John Doe', 25);

-- Create the stored function to return the total count
CREATE FUNCTION GetTotalCount()
RETURNS INT
NO SQL
-- READS SQL DATA
-- DETERMINISTIC
BEGIN
    DECLARE total_count INT;
    SELECT COUNT(*) INTO total_count FROM country;
    RETURN total_count;
END;


DELIMITER //

CREATE FUNCTION GetEmployeeDetails(id_ INT)
RETURNS VARCHAR(55)
DETERMINISTIC
BEGIN
    -- Assign values to the OUT parameters
    DECLARE empname VARCHAR(55);
    SELECT country INTO empname 
    FROM country 
    WHERE country_id = id_;
    RETURN empname;
END //
DELIMITER ;


DROP FUNCTION IF EXISTS GetEmployeeDetails;


SELECT GetEmployeeDetails(1) AS name;


DROP FUNCTION IF EXISTS  GetTotalCount;

SELECT GetTotalCount() AS total;






DELIMITER //
CREATE FUNCTION CalculateSquare(input_number INT) RETURNS INT
    deterministic
    BEGIN
        DECLARE square INT;
        SET square = input_number * input_number;
        RETURN square;
    END //
DELIMITER;












DELIMITER //

CREATE FUNCTION GetEmployeeUpdate(id_ INT,name_ VARCHAR(55)) RETURNS INT
DETERMINISTIC
BEGIN
    -- Assign values to the OUT parameters
     DECLARE empname INT;
    -- SELECT country INTO empname 
    -- FROM country 
    -- WHERE country_id = id_;
    UPDATE country SET country = name_
    WHERE country_id=id_;
    RETURN empname;
END //
DELIMITER ;



SELECT GetEmployeeUpdate(1,"India") ;

SELECT * FROM country;
DROP FUNCTION IF EXISTS GetEmployeeUpdate;




DELIMITER //

CREATE FUNCTION GetEmployeeDelete(id_ INT,name_ VARCHAR(55)) RETURNS INT
DETERMINISTIC
BEGIN
    -- Assign values to the OUT parameters
     DECLARE empname INT;
    -- SELECT country INTO empname 
    -- FROM country 
    -- WHERE country_id = id_;
    DELETE FROM country
    WHERE country_id=id_;
    RETURN empname;
END //
DELIMITER ;


CREATE TABLE a1(id INT);


DELIMITER //
CREATE FUNCTION push1(id INT) RETURNS INT
DETERMINISTIC
    BEGIN
        DECLARE res INT;
        insert into a1(id) values(id);
        return res;
    END //
DELIMITER ;

SELECT push(30);

SELECT * FROM a1;


