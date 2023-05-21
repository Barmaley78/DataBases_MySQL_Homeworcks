/*
1. Создайте таблицу с мобильными телефонами, используя графический интерфейс. Заполните БД данными
2. Выведите название, производителя и цену для товаров, количество которых превышает 2
3. Выведите весь ассортимент товаров марки “Samsung”
4. Выведите информацию о телефонах, где суммарный чек больше 100 000 и меньше 145 000**

4.*** С помощью регулярных выражений найти (можно использовать операторы “LIKE”, “RLIKE” для 4.3 ):
4.1. Товары, в которых есть упоминание "Iphone"
4.2. "Galaxy"
4.3. Товары, в которых есть ЦИФРЫ
4.4. Товары, в которых есть ЦИФРА "8"

*/


USE lesson_01;

-- 1. Создайте таблицу с мобильными телефонами, используя графический интерфейс. Заполните БД данными

DROP TABLE IF EXISTS hw_1;
CREATE TABLE hw_1
 (
	id INT PRIMARY KEY AUTO_INCREMENT,
    productname VARCHAR(45),
    manufacturer VARCHAR(45),
    productcount INT,
    price INT
 ) ;

INSERT hw_1 (productname, manufacturer, productcount, price)
 VALUES
	("iPhone X", "Apple", 3 , 76000),
    ("iPhone 8", "Apple",2, 51000),
    ("Galaxy S9", "Samsung", 2, 56000),
    ("Galaxy S8", "Samsung", 1, 41000),
    ("P20 Pro", "Huawei", 5, 36000);

-- 2. Выведите название, производителя и цену для товаров, количество которых превышает 2 

SELECT productname, manufacturer, productcount, price 
FROM hw_1 
WHERE productcount > 2;

-- 3. Выведите весь ассортимент товаров марки “Samsung”

SELECT 
    productname, productcount, price
FROM
    hw_1
WHERE
    manufacturer = 'Samsung';

-- 4. Выведите информацию о телефонах, где суммарный чек больше 100 000 и меньше 145 000**

SELECT productname, manufacturer, price 
FROM hw_1 
WHERE productcount * price > 100000 AND productcount * price < 145000;

-- 4.1. Товары, в которых есть упоминание "Iphone"

SELECT productname 
FROM hw_1 
WHERE productname LIKE "%iPhone%";

-- 4.2. "Galaxy"

SELECT productname 
FROM hw_1 
WHERE productname LIKE "%Galaxy%";

-- 4.3. Товары, в которых есть ЦИФРЫ

SELECT productname 
FROM hw_1 
WHERE productname RLIKE '[0-9]';

-- 4.4. Товары, в которых есть ЦИФРА "8"

SELECT productname 
FROM hw_1 
WHERE productname RLIKE '8';
