


USE sakila;


show TABLES;

SELECT * FROM employees
;
-- Create a stored procedure
DELIMITER //
CREATE PROCEDURE process_emps()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE emp_id INT;
    DECLARE emp_name VARCHAR(255);
    
    -- Declare the cursor
    DECLARE emp_cursor CURSOR FOR
        SELECT  id,  name FROM employees;
        
    -- Declare handlers for exceptions
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    -- Open the cursor
    OPEN emp_cursor;
    
    -- Fetch rows from the cursor and process them
    emp_loop: LOOP
        -- Fetch the next row from the cursor
        FETCH emp_cursor INTO emp_id, emp_name;
        
        -- Check if no more rows to fetch
        IF done THEN
            LEAVE emp_loop;
        END IF;
        
        UPDATE employees
        SET name =CONCAT('emp ID: ', emp_id, ', name: ', emp_name)
        WHERE id=5;
        -- Process the row here
        -- Example: Print customer details
        SELECT CONCAT('emp ID: ', emp_id, ', name: ', emp_name) AS emp_details;
    END LOOP;
    
    -- Close the cursor
    CLOSE emp_cursor;
    
END //
DELIMITER ;




DROP PROCEDURE process_emps;


call process_emps();





DELIMITER //
CREATE PROCEDURE process_emps1()
BEGIN
    -- DECLARE done INT DEFAULT FALSE;
    DECLARE emp_id INT;
    DECLARE emp_name VARCHAR(255);
    
    -- Declare the cursor
    DECLARE emp_cursor CURSOR FOR
        SELECT  id,  name FROM employees;
        
    -- Declare handlers for exceptions
    -- DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    -- Open the cursor
    OPEN emp_cursor;
    FETCH emp_cursor INTO emp_id, emp_name;
    SELECT CONCAT('emp ID: ', emp_id, ', name: ', emp_name) AS emp_details;
    
    -- Close the cursor
    CLOSE emp_cursor;
    
END //
DELIMITER ;


CALL  process_emps1();

