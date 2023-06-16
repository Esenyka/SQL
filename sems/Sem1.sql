--  Комментарий, необходим пробел после "--"
# Ком как в Питоне
/* многосточный
комментарий */

-- 1. Создание БД
CREATE DATABASE IF NOT EXISTS Semenar1; -- создается, если еще не  было

-- 2. Подключение к БД
USE Semenar1;

-- 3. Создание таблицы - 
DROP TABLE IF EXISTS student; -- удалени перед созданием
CREATE TABLE student 
(	
	-- имя_столбца тип_данных ограничения
	id INT PRIMARY KEY AUTO_INCREMENT, -- столбец id  - целое число, первичный ключ и автоинкремент - i++
    firstname VARCHAR(45),
    phone VARCHAR(20),
    email VARCHAR(45)
);

-- 4. Таблица есть, а где данные ? 
INSERT student (firstname, phone, email) -- три столбца
VALUES -- 3 столбца = 3 значения
	("Anton", "89528954457", "rarra@gmail.com"), -- id = 1 (id++)
    ("Arat", "89754125798", "hfjghk@gail.com"), -- id = 2 (id++)
    ("Artem", "6545465464550", "artem@gmail.com"), -- id = 3 (id++)
    ("Alecsandr", "235345464550", "alex@gmail.com"), -- id = 4 (id++)
    ("Anastasia", "34445464550", "nasta@gmail.com"), -- id = 5 (id++)
    ("Valera", "54684864550", "valerka@gmail.com"); -- id = 6 (id++)

-- 5. Просмотр таблицы 
SELECT * FROM student; -- * = дурной тон, убычно столбцы через ","

-- 6. Увидим только 2 столбца 
SELECT firstname, email
FROM student;

-- 7. получить посту студента по имени антон 
SELECT firstname, email 
FROM student 
WHERE firstname = "ANTON";

-- 8. Получить всех, кроме АнтонаALTER
SELECT firstname, email 
FROM student 
WHERE firstname != "ANTON";

SELECT firstname, email 
FROM student 
WHERE firstname <> "ANTON";

-- 9. Получить почты студентов, имена которых начинаются на А
SELECT firstname, email 
FROM student 
WHERE firstname LIKE "A%";



