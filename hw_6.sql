CREATE DATABASE IF NOT EXISTS lesson_06;

USE lesson_06;

DROP PROCEDURE IF EXISTS print_numbers;
DELIMITER $$
CREATE PROCEDURE print_numbers
(
	input_number INT
)
BEGIN 
	DECLARE n INT; 
    DECLARE result VARCHAR(45) DEFAULT "";
    SET n = input_number;
    REPEAT
		SET result = CONCAT(n,", ", result);
        SET n = n - 2;
        UNTIL n <= 0
    END REPEAT;
    SELECT result;
END $$

-- Вызов процедуры 
CALL print_numbers(10);


DROP FUNCTION IF EXISTS get_period_from_number_of_seconds;
DELIMITER $$ 
CREATE FUNCTION get_period_from_number_of_seconds
(
	num INT
)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
	DECLARE x INT;
    DECLARE number_of_days INT;
    DECLARE number_of_hours INT;
    DECLARE number_of_minutes INT;
    DECLARE number_of_seconds INT;
    DECLARE result VARCHAR(255) DEFAULT "";
	SET x = num;
	SET number_of_days = x DIV 86400;
	SET x = x MOD 86400;
	SET number_of_hours = x DIV 3600;
	SET x = X MOD 3600;
	SET number_of_minutes = x DIV 60;
	SET number_of_seconds = x MOD 60;
    SET result = CONCAT(number_of_days, " days ", number_of_hours, " hours ", number_of_minutes, " minutes ", number_of_seconds, " seconds");			
	RETURN (result);
END $$
-- DELIMITER ; 
SELECT get_period_from_number_of_seconds(123456) AS "Срок в числе секунд";