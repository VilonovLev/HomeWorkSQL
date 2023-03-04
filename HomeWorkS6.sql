##1.	Создайте функцию, которая принимает кол-во сек и форматирует их в кол-во дней, часов, минут и секунд.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

delimiter $$
CREATE FUNCTION timeToString(seconds INT)
RETURNS VARCHAR(60)
DETERMINISTIC
BEGIN
	DECLARE secondsToDay INT DEFAULT 86400;
    DECLARE secondsToHour INT DEFAULT 3600;
    DECLARE secondsToMin INT DEFAULT 60;
    
    DECLARE days INT DEFAULT 0;
    DECLARE hours INT DEFAULT 0;
    DECLARE minutes INT DEFAULT 0;
    
	SET days = FLOOR(seconds/secondsToDay);
    SET seconds = seconds - (days * secondsToDay);
    SET hours = FLOOR(seconds/secondsToHour);
    SET seconds = seconds - (hours * secondsToHour);
    SET minutes = FLOOR(seconds/secondsToMin);
    SET seconds = seconds - (minutes * secondsToMin);
    
	RETURN CONCAT(days, " days ", hours, " hour ", minutes, " minute ", seconds, " seconds ");
    
END $$
delimiter ;



##2.	Выведите только четные числа от 1 до 10 включительно. (Через функцию / процедуру)
Пример: 2,4,6,8,10 (можно сделать через шаг +  2: х = 2, х+=2)

delimiter $$
CREATE PROCEDURE evenNumbers(startNum INT, endNum INT)
DETERMINISTIC
BEGIN
	DECLARE result VARCHAR(100) DEFAULT "";
    SET startNum = IF(startNum%2=0, startNum, startNum + 1);
    
	WHILE startNum < endNum DO
		SET result = CONCAT(result," ",startNum);
        SET startNum = startNum + 2;
	END WHILE;
	SELECT result;
END $$
delimiter ;


CALL evenNumbers(2,23);