DELIMITER //

CREATE FUNCTION  fun3(tablenam VARCHAR(50)) RETURNS BOOL
DETERMINISTIC
BEGIN
    DECLARE table_exists BOOL;
    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name =tablenam) THEN
        SET table_exists = TRUE;
    ELSE 
        SET table_exists = FALSE;
    END IF;
    RETURN table_exists;
    -- Drop the table after use
END //
DELIMITER ;