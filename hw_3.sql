/*
1. Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания
2. Выведите 5 максимальных заработных плат (saraly)
3. Посчитайте суммарную зарплату (salary) по каждой специальности (роst)
4. Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.
5. Найдите количество специальностей
6. Выведите специальности, у которых средний возраст сотрудников меньше 30 лет


Доп:
Внутри каждой должности вывести ТОП-2 по ЗП (2 самых высокооплачиваемых сотрудника по ЗП внутри каждой должности)
Доп по базе данных для ВК(in progress):
....
*/

CREATE DATABASE IF NOT EXISTS lesson_03;

USE lesson_03;

DROP TABLE IF EXISTS staff;

CREATE TABLE staff
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(45) NOT NULL,
    lastname VARCHAR(45) NOT NULL,
    post VARCHAR(45) NOT NULL,
    seniority INT, 
    salary DECIMAL(8,2), -- 100 000 . 00
    age INT
);
-- 4. Заполнение таблицы данными
INSERT staff(firstname, lastname, post, seniority,salary,age)
VALUES ("Петр", "Петров", "Начальник", 8, 70000, 30); -- id = 1
INSERT staff (firstname, lastname, post, seniority, salary, age)
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


-- 1. Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания  
SELECT * 
FROM staff 
ORDER BY salary DESC;
  
SELECT * 
FROM staff 
ORDER BY salary;

-- 2. Выведите 5 максимальных заработных плат (saraly)

SELECT salary
FROM staff 
ORDER BY salary DESC 
LIMIT 5;

-- 3. Посчитайте суммарную зарплату (salary) по каждой специальности (роst)

SELECT post, SUM(salary) AS salary_sum_by_post
FROM staff
GROUP BY post;

-- 4. Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.

SELECT COUNT(post) AS worker_number
FROM staff
WHERE (post = 'Рабочий') AND (age BETWEEN 24 AND 49);

-- 5. Найдите количество специальностей

SELECT COUNT(DISTINCT post)
FROM staff;

-- 6. Выведите специальности, у которых средний возраст сотрудников меньше 30 лет

SELECT post 
FROM staff 
GROUP BY post 
HAVING AVG(age) < 30;

-- ДОП
-- Внутри каждой должности вывести ТОП-2 по ЗП (2 самых высокооплачиваемых сотрудника по ЗП внутри каждой должности)

-- зависимый запрос (до конца на отработал потому что из 3 начальником у двух одинаковая зарплата)
select t1.* from staff t1
where (select count(*) from staff t2 where t1.post=t2.post and t2.salary > t1.salary) < 2;

-- Оконные функции
select * from
(select staff.*,
row_number() over (partition by post order by salary desc) i
from staff) t where i <= 2;