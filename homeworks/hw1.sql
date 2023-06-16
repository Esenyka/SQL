CREATE DATABASE IF NOT EXISTS hw1;
USE hw1;

DROP TABLE IF EXISTS phone;
CREATE TABLE phone
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(10),
	Manufacturer VARCHAR(10),
    ProductCount INT,
	Price INT
);

INSERT phone (ProductName, Manufacturer, ProductCount, Price)
VALUES
	("iPhone X", "Apple", 3, 76000),
    ("iPhone 8", "Apple", 2, 51000),
    ("Galaxy s9", "Samsung", 2, 56000),
    ("Galaxy s8", "Samsung", 1, 41000),
    ("P20", "Huawei", 5, 36000);

-- 2. Выведите название, производителя и цену для товаров, количество которых превышает 2.
SELECT ProductName, Manufacturer, Price
FROM phone
WHERE ProductCount >= 2;

-- 3. Выведите весь ассортимент товаров марки “Samsung”.
SELECT * FROM phone
WHERE Manufacturer = "Samsung";

-- 4. Выведите информацию о телефонах, где суммарный чек больше 100 000 и меньше 145 000.
SELECT * FROM phone
WHERE Price * ProductCount >= 100000 AND Price * ProductCount <= 145000;

/* 5.  С помощью регулярных выражений найти 
	5.1. Товары, в которых есть упоминание "Iphone"
	5.2. "Galaxy"
*/

SELECT * FROM phone
WHERE ProductName LIKE "%IPHONE%";

SELECT * FROM phone
WHERE ProductName LIKE "%GALAXY%";



