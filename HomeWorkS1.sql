CREATE DATABASE assortment;
USE assortment;
CREATE TABLE phone
(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    brand VARCHAR(45),
    model VARCHAR(45),
    price VARCHAR(45),
    count INT,
    availability BOOLEAN
);

INSERT phone(brand,model,price,count,availability)
VALUES 
	("Samsung","Galaxy S23","72000",1,FALSE),
    ("Realme","9 Pro","22000",5,TRUE),
    ("Samsung","Galaxy A13","11000",3,TRUE),
    ("Realme","10","8000",4,TRUE),
    ("Samsung","Galaxy A03","5999",2,TRUE),
    ("Nokia", "3310", "2000",4, TRUE),
    ("Iphone", "14", "72000",5, TRUE),
    ("My", "MyIphone", "10000",1, TRUE);

# Выведите название, производителя и цену для товаров, количество которых превышает 2 
SELECT brand,model,price 
FROM phone 
WHERE count>2;

# Выведите весь ассортимент товаров марки “Samsung”
SELECT * 
FROM phone 
WHERE brand LIKE "%Samsung%";

# Выведите информацию о телефонах, где суммарный чек больше 100 000 и меньше 145 000**
SELECT *,(count*price) AS result
FROM phone 
WHERE 100000<count*price AND count*price<145000;

# Товары, в которых есть упоминание "Iphone" 
SELECT *
FROM phone 
WHERE brand REGEXP "Iphone" OR model REGEXP "Iphone";

# Товары, в которых есть упоминание "Galaxy" 
SELECT *
FROM phone 
WHERE brand LIKE "%Galaxy%" OR model LIKE "%Galaxy%";

# Товары, в которых есть ЦИФРЫ
SELECT *
FROM phone 
WHERE brand REGEXP "[0-9]" OR model REGEXP "[0-9]";

# Товары, в которых есть ЦИФРА 8
SELECT *
FROM phone 
WHERE brand LIKE "%8%" OR model LIKE "%8%";

