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
/* Таблица users была неудачно спроектирована. Записи created_at
 *  и updated_at были заданы типом VARCHAR и в них долгое время 
 * помещались значения в формате "20.10.2017 8:10". Необходимо 
 * преобразовать поля к типу DATETIME, сохранив введеные ранее значения.*/
ALTER TABLE users MODIFY `created_at` datetime NOT NULL, 
MODIFY `updated_at` datetime NOT NULL;

