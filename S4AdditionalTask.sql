##1. Вывести на экран сколько машин каждого цвета для машин марок BMW и LADA#
SELECT mark, color, COUNT(color) AS count_car
FROM auto WHERE (mark = 'LADA' OR mark = 'BMW')
GROUP BY mark, color;

##2. Вывести на экран марку авто и количество AUTO не этой марки
SELECT mark,((SELECT Count(*) FROM auto) - Count(*)) as another_car  
FROM auto GROUP BY mark;

##3. Напишите запрос, который вернет строки из таблицы test_a, id которых нет в таблице test_b, НЕ используя ключевого слова NOT.
SELECT * FROM test_a
LEFT join test_b USING (id)
WHERE test_b.id IS NULL;