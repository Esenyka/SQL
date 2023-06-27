USE home_work;

DROP TABLE IF EXISTS trains;
CREATE TABLE trains
(
	id SERIAL PRIMARY KEY AUTO_INCREMENT,
	train_id INT, 
    station VARCHAR(30),
    station_time TIME
);

INSERT INTO trains (train_id, station, station_time) VALUES
	('110', 'San Fran', '10:00:00'),
    ('110', 'San Fran', '10:54:00'),
    ('110', 'San Fran', '11:02:00'),
    ('110', 'San Fran', '12:35:00'),
    ('120', 'San Fran', '11:00:00'),
    ('120', 'San Fran', '12:49:00'),
    ('120', 'San Fran', '13:30:00');
    
SELECT * FROM trains;

SELECT 
	train_id,
    station,
    station_time,
    timediff(LEAD(station_time) OVER w, station_time) AS time_to_next
FROM trains
WINDOW w AS (PARTITION BY train_id);