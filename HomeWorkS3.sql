CREATE DATABASE IF NOT EXISTS home_work_3;

USE home_work_3;
CREATE TABLE IF NOT EXISTS `staff`
(
	`id` INT  AUTO_INCREMENT PRIMARY KEY,
	`firstname` VARCHAR(45),
    `lastname` VARCHAR(45),
    `post` VARCHAR(45),
    `seniority` INT,
    `salary` INT,
    `age` INT
);

INSERT INTO staff (firstname, lastname, post, seniority, salary, age)
VALUES
	('Вася', 'Петров', 'Начальник', 40, 100000, 60),
	('Петр', 'Власов', 'Начальник', 8, 70000, 30),
	('Катя', 'Катина', 'Инженер', 2, 70000, 25),
	('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
	('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
	('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
	('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35), 
	('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
	('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
	('Максим', 'Максимов', 'Рабочий', 2, 11000, 19),
	('Юрий', 'Галкин', 'Рабочий', 3, 12000, 24), 
	('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);
    
#Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания 
SELECT * FROM staff ORDER BY salary;
SELECT * FROM staff ORDER BY salary DESC; 

#Выведите 5 максимальных заработных плат (saraly)
## Первая часть
SELECT salary 
FROM staff 
ORDER BY salary DESC 
LIMIT 5;
## Две максимальные зарплаты из отдела 'Рабочий'
SELECT salary 
FROM staff
WHERE post = 'Рабочий' 
ORDER BY salary DESC 
LIMIT 2;

#Посчитайте суммарную зарплату (salary) по каждой специальности (роst)
SELECT post, SUM(salary) AS post_salary 
FROM staff 
GROUP BY post;

#Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.
SELECT COUNT(*) AS count_worker 
FROM staff 
WHERE (age BETWEEN 25 AND 49) AND post = 'Рабочий';

#Найдите количество специальностей
SELECT COUNT(*) AS count_posts 
FROM (SELECT COUNT(post) FROM staff GROUP BY post) AS posts;

#Выведите специальности, у которых средний возраст сотрудников меньше 30 лет 
SELECT * 
FROM (SELECT post, AVG(age) AS age FROM staff GROUP BY post) AS posts_avg_age 
WHERE age < 35;