# Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными
CREATE TABLE IF NOT EXISTS sales
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    count_product INT NOT NULL DEFAULT 0
);

INSERT INTO sales(order_date,count_product)
VALUES
	('2022-01-01',156),
    ('2022-01-02',180),
    ('2022-01-03',21),
    ('2022-01-04',124),
    ('2022-01-05',341);

# Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.
## 1 Вариант
SELECT 
		id,
        IF (count_product<100, "маленький заказ",
			IF(count_product BETWEEN 100 AND 300, "средний заказ",
				IF(count_product>300, "большой заказ","нет данных ")))
		AS result
FROM sales;
## 2 Вариант
SELECT id,
CASE 
	WHEN(count_product<100) 
		THEN "маленький заказ"
    WHEN(count_product BETWEEN 100 AND 300) 
		THEN "средний заказ"
    WHEN(count_product>300) 
		THEN "большой заказ"
	ELSE "нет данных"
END AS result
FROM sales;

# Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE
CREATE TABLE IF NOT EXISTS orders
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id VARCHAR(10) NOT NULL, 
    amound DOUBLE NOT NULL,
    order_status VARCHAR(10) NOT NULL
);

INSERT INTO orders(employee_id,amound,order_status)
VALUES
	("e03",15.00,"OPEN"),
    ("e01",25.50,"OPEN"),
    ("e05",100.70,"CLOSED"),
    ("e02",22.18,"OPEN"),
    ("e04",9.50,"CANCELLED");

SELECT *, 
CASE 
	WHEN(order_status = "OPEN") 
		THEN "Order is in open state"
    WHEN(order_status = "CLOSED") 
		THEN "Order is closed"
    WHEN(order_status = "CANCELLED") 
		THEN "Order is cancelled"
END AS full_order_status
FROM orders;

# Чем 0 отличается от NULL?
# 0 - Число или символ, NULL - отсутствие данных
