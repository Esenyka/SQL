CREATE DATABASE IF NOT EXISTS home_work;

USE home_work;

DROP TABLE IF EXISTS hw2_task1;
CREATE TABLE hw2_task1
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    count_product INT
);

INSERT INTO hw2_task1 (order_date, count_product)
VALUES
	(20200101, 156),
    (20200102, 180),
    (20220103, 21),
    (20220104, 124),
    (20220105, 341);

SELECT 
	id,
CASE
	WHEN count_product <= 100
		THEN 'Маленький заказ'
	WHEN count_product > 100 and count_product <= 300
		THEN 'Средний заказ'
	ELSE 'Большой заказ'
END AS order_type
FROM hw2_task1;

SELECT * FROM hw2_task1;

-- !.................TASK 2....................!

DROP TABLE IF EXISTS hw2_task2;
CREATE TABLE hw2_task2
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id VARCHAR(5),
    amount FLOAT, 
    order_status VARCHAR(15)
);

INSERT INTO hw2_task2 (employee_id, amount, order_status)
VALUES 
	('e03', 15.00, 'OPEN'),
    ('e01', 25.50, 'OPEN'), 
    ('e05', 100.70, 'CLOSED'),
    ('e02', 22.18, 'OPEN'), 
    ('e04', 09.50, 'CANCELLED');
    
SELECT 
	id,
CASE
	WHEN order_status = 'OPEN'
		THEN 'Order is in open state'
	WHEN order_status = 'CLOSED'
		THEN 'Order is closed'
	WHEN order_status = 'CANCELLED'
		THEN 'Order is cancelled'
	ELSE 'Error'
END AS full_order_status
FROM hw2_task2;

SELECT * FROM hw2_task2;
    