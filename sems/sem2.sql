CREATE DATABASE IF NOT EXISTS lesson_2;

USE lesson_2;

DROP TABLE IF EXISTS movie;
CREATE TABLE movie
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(45) NOT NULL,
    title_eng VARCHAR(45),
    year_movie YEAR NOT NULL,
    count_min INT,
    storyline TEXT
);

INSERT INTO movie (title, title_eng, year_movie, count_min, storyline)
VALUES 
('Игры разума', 'A Beautiful Mind', 2001, 135, 'От всемирной известности до греховных глубин — все это познал на своей шкуре Джон Форбс Нэш-младший. Математический гений, он на заре своей карьеры сделал титаническую работу в области теории игр, которая перевернула этот раздел математики и практически принесла ему международную известность. Однако буквально в то же время заносчивый и пользующийся успехом у женщин Нэш получает удар судьбы, который переворачивает уже его собственную жизнь.'),
('Форрест Гамп', 'Forrest Gump', 1994, 142, 'Сидя на автобусной остановке, Форрест Гамп — не очень умный, но добрый и открытый парень — рассказывает случайным встречным историю своей необыкновенной жизни. С самого малолетства парень страдал от заболевания ног, соседские мальчишки дразнили его, но в один прекрасный день Форрест открыл в себе невероятные способности к бегу. Подруга детства Дженни всегда его поддерживала и защищала, но вскоре дороги их разошлись.'),
('Иван Васильевич меняет профессию', NULL, 1998, 128,'Инженер-изобретатель Тимофеев сконструировал машину времени, которая соединила его квартиру с далеким шестнадцатым веком - точнее, с палатами государя Ивана Грозного. Туда-то и попадают тезка царя пенсионер-общественник Иван Васильевич Бунша и квартирный вор Жорж Милославский. На их место в двадцатом веке «переселяется» великий государь. Поломка машины приводит ко множеству неожиданных и забавных событий...'),
('Назад в будущее', 'Back to the Future', 1985, 116, 'Подросток Марти с помощью машины времени, сооружённой его другом-профессором доком Брауном, попадает из 80-х в далекие 50-е. Там он встречается со своими будущими родителями, ещё подростками, и другом-профессором, совсем молодым.'),
('Криминальное чтиво', 'Pulp Fiction', 1994, 154, NULL);

SELECT * FROM movie;

-- DDL: CREATE, DROP, ALTER, RENAME
-- DML: INSERT, UPDATE, DELETE, SELECT 

-- RENAME TABLE old_name TO new_name
DROP TABLE IF EXISTS cinema;
RENAME TABLE movie TO cinema;


-- Играемся с ALTER: часть 1 - добавление столбца 
ALTER TABLE cinema
ADD COLUMN test INT DEFAULT 100,
ADD price INT DEFAULT 200;

SELECT * FROM cinema;

-- Играемся с ALTER: часть 2 - удаление столбца 
ALTER TABLE cinema
DROP test; -- Удалил тест

SELECT * FROM cinema; 
DESCRIBE cinema; -- Инфо о таблице

-- UPDATE 
UPDATE cinema
SET price = price + 150
WHERE title = "Иван Васильевич меняет профессию"; -- price += 150 (price = price + 150)

SELECT * FROM cinema; 

-- Статус оплаты заказа 
-- 0 - заказ не оплачен онлайн 
-- 1 - заказ оплачен 

ALTER TABLE cinema
ADD category INT; -- новый столбец, целое число, NULL 

UPDATE cinema 
SET category = RAND(); -- От 0 до 1

SELECT * FROM cinema; 

SELECT 
	id,
    category,
    price, -- Перед CASE ставится запятая, вернется столбец с результатом
CASE
	WHEN category = 0
		THEN "Заказ НЕ оплачен :с"
	WHEN category = 1
		THEN "Заказ оплачен :)"
	ELSE "Error" -- Категория - любое число, кроме 0 и 1
END AS result_message
FROM cinema; 

