

SHOW DATABASES;


SHOW TABLEs;

USE sakila;

SELECT * FROM country;


CREATE PROCEDURE getalldetails()
BEGIN
    SELECT * FROM country;
END;

CREATE PROCEDURE getdetails(IN id int,IN con VARCHAR(50))
BEGIN
    SELECT * FROM country
    WHERE  country_id=id AND country=con ;
END;

DROP PROCEDURE getalldetails;

CALL getalldetails();


CALL getdetails(4,Angola);





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












CALL GetEmployeeCount(@c);
SELECT @c;


