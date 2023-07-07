USE home_work;

-- Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней, часов, минут и секунд.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DROP FUNCTION IF EXISTS get_nums;
CREATE FUNCTION get_nums
(
	seconds INT
)
RETURNS VARCHAR(50) 
DETERMINISTIC 
RETURN CONCAT((FLOOR(seconds / 86400)), " ",
	FLOOR((seconds - (FLOOR(seconds / 86400) * 84600)) / 3600), " ",
    FLOOR((seconds - (((FLOOR(seconds / 86400)) * 86400) + ((FLOOR((seconds - (FLOOR(seconds / 86400) * 84600)) / 3600)) * 3600))) / 60), " ",
    seconds - ((((FLOOR(seconds / 86400))) * 86400) + ((FLOOR((seconds - (FLOOR(seconds / 86400) * 84600)) / 3600)) * 3600) + ((FLOOR((seconds - (((FLOOR(seconds / 86400)) * 86400) + ((FLOOR((seconds - (FLOOR(seconds / 86400) * 84600)) / 3600)) * 3600))) / 60)) * 60))
);

SELECT get_nums(123456);

-- Выведите только четные числа от 1 до 10 (Через цикл внутри процедуры).
-- ример: 2,4,6,8,10

DROP PROCEDURE IF EXISTS get_nums;
DELIMITER //
CREATE PROCEDURE get_nums
(
	IN input_num INT
)
BEGIN
	DECLARE n INT;
    DECLARE result INT;
	SET n =  input_num;
    
	REPEAT
		SET result = CONCAT(result, n, ",");
		SET n = n - 2;
		UNTIL n <= 0
    END REPEAT;
    SELECT result;
	
END//
    
CALL get_nums(10);


 
