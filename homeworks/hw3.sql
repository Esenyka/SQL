USE home_work;

DROP TABLE IF EXISTS hw3;
CREATE TABLE hw3
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(45),
    last_name VARCHAR(45),
    post VARCHAR(45),
    seniority INT, 
    selary DECIMAL(8,2),
    age INT
);

INSERT INTO hw3 (first_name, last_name, post, seniority, selary, age)
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
 ('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
 ('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
 ('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);

-- Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания
SELECT 
	id,
    selary
FROM hw3
ORDER BY selary;

SELECT 
	id,
    selary
FROM hw3
ORDER BY selary DESC;

-- Выведите 5 максимальных заработных плат (saraly)

SELECT
	id,
    selary
FROM hw3
ORDER BY selary DESC LIMIT 5;

-- Посчитайте суммарную зарплату (salary) по каждой специальности (роst)

SELECT 
    post,
    SUM(selary) AS all_s
FROM hw3
GROUP BY post;

-- Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.

SELECT 
    COUNT(post) AS num_per,
    post
FROM hw3
WHERE post = "Рабочий" AND age >= 24 AND age <= 49;

-- Найдите количество специальностей

SELECT
	COUNT(DISTINCT post) AS count_post
FROM hw3;

-- Выведите специальности, у которых средний возраст сотрудников меньше 30 лет
-- Сделала больше, тк если меньше, то таких нет :)

SELECT DISTINCT
	post,
	ROUND(AVG(age)) AS mid_age
FROM hw3
GROUP BY post
HAVING mid_age > 30;

-- Внутри каждой должности вывести ТОП-2 по ЗП (2 самых высокооплачиваемых сотрудника по ЗП внутри каждой должности)
SELECT 
	post, 
    MAX(selary)
FROM hw3
GROUP BY post
ORDER BY selary;

    