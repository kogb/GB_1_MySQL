/*1. Пусть в таблице users поля created_at и 
updated_at оказались незаполненными. 
Заполните их текущими датой и временем.*/

SHOW DATABASES;
USE VK;
ALTER TABLE users ADD `created_at` VARCHAR(20);
ALTER TABLE users ADD `updated_at` VARCHAR(20);
SELECT now();
DESCRIBE ;
UPDATE users
SET
	`created_at`=now(),
	`updated_at`=now()
;
/* 2. Таблица users была неудачно спроектирована. Записи created_at
 *  и updated_at были заданы типом VARCHAR и в них долгое время 
 * помещались значения в формате "20.10.2017 8:10". Необходимо 
 * преобразовать поля к типу DATETIME, сохранив введеные ранее значения.*/
ALTER TABLE users MODIFY `created_at` datetime NOT NULL, 
MODIFY `updated_at` datetime NOT NULL;

/*3. В таблице складских запасов storehouses_products в поле value могут 
 * встречаться самые разные цифры: 0, если товар 
 * закончился и выше нуля, если на складе имеются запасы. 
 * Необходимо отсортировать записи таким образом, чтобы они выводились в порядке 
 * увеличения значения value. Однако, нулевые запасы должны выводиться в конце, 
 * после всех записей.*/
USE VK;
DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products(
	id SERIAL primary key,
    storehouse_id SMALLINT NOT NULL,
    product_id INTEGER NOT NULL unique,
    value int unsigned comment 'Запас товарной позиции на складе',
    created_at DATETIME default current_timestamp COMMENT 'Дата регистрации',
    updated_at DATETIME default current_timestamp ON UPDATE current_timestamp COMMENT 'Дата последнего обновления записи'
) COMMENT = 'Склады и продукты';

INSERT INTO storehouses_products (storehouse_id, product_id, value) VALUES
	(1, 1, 0),
	(1, 2, 4),
    (1, 3, 10),
    (2, 4, 7),
    (2, 5, 56),
    (1, 6, 0),
    (1, 7, 4),
    (1, 8, 1);
    
SELECT * FROM storehouses_products  ORDER BY value = 0 ASC, value ASC;

/*Практическое задание теме “Агрегация данных”
1. Подсчитайте средний возраст пользователей в таблице users
2. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
Следует учесть, что необходимы дни недели текущего года, а не года рождения.*/
select
      avg(
         (YEAR(CURRENT_DATE) - YEAR(birthday)) - (DATE_FORMAT(CURRENT_DATE, '%m%d') < DATE_FORMAT(birthday, '%m%d')) 
          )
 FROM profiles

select 
    weekday(date_format(birthday, '2021-%m-%d')) as 'day_number',
    count(*) as 'birthdays_qnty'
from profiles
group by weekday(date_format(birthday, '2021-%m-%d'))
order by day_number;



