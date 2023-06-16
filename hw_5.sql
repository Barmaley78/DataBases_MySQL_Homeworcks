CREATE DATABASE IF NOT EXISTS lesson_05;

USE lesson_05;

DROP TABLE IF EXISTS cars;

CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT *
FROM cars;

DROP VIEW IF EXISTS cars_priced_above_25000;
CREATE OR REPLACE VIEW cars_priced_above_25000
AS
SELECT * 
FROM cars
WHERE cost <= 25000;

SELECT *
FROM cars_priced_above_25000;

ALTER VIEW cars_priced_above_25000
AS
SELECT *
FROM cars
WHERE cost <= 30000;

SELECT *
FROM cars_priced_above_25000;

DROP VIEW IF EXISTS cars_brand_audi_shkoda;
CREATE VIEW cars_brand_audi_shkoda
AS
SELECT *
FROM cars
WHERE `name` IN ("Audi", "Skoda");

SELECT *
FROM cars_brand_audi_shkoda;