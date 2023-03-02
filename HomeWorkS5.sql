##1. Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов
CREATE VIEW ower_cost AS SELECT * FROM cars
WHERE cost < 25000;

##2. Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW) 
ALTER VIEW ower_cost AS SELECT * FROM cars
WHERE cost < 30000;

##3. Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”
CREATE VIEW favorite_cars AS SELECT * FROM cars
WHERE (name = "Skoda" OR name = "Audi");

##4. Поезда
CREATE TABLE train_schedule (
train_id INT,
station VARCHAR(50),
station_time TIME);

INSERT INTO train_schedule (train_id,station,station_time) VALUES
(110,'Курский вокзал', '10:00:00'),
(110,'Москва товарная', '10:05:34'),
(110,'Калитники', '10:12:34'),
(110,'Текстильщики','10:17:40'),
(120,'Серпухов', '11:26:00'),
(120,'Чехов', '12:03:00'),
(120,'Подольск', '12:38:00');

SELECT *, LEAD(station_time) OVER(PARTITION BY train_id) AS next_st FROM train_schedule;