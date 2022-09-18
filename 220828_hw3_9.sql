/*Практическое задание по теме “Транзакции, переменные, представления”*/

/*1. В базе данных shop и sample присутствуют одни и те же таблицы, 
учебной базы данных. 
Переместите запись id = 1 из таблицы shop.users 
в таблицу sample.users. Используйте транзакции.*/

START TRANSACTION;

INSERT INTO sample.users (sample.users.name, sample.users.birthday_at, sample.users.created_at) 
	SELECT shop.users.name, shop.users.birthday_at, shop.users.created_at 
	FROM shop.users 
	WHERE shop.users.id = 1;

DELETE FROM shop.users
	WHERE id=1;

COMMIT;


/*2. Создайте представление, которое выводит название name товарной 
позиции из таблицы products и соответствующее название каталога name 
из таблицы catalogs.*/
CREATE OR REPLACE VIEW shop.NewView
AS SELECT shop.products.id, shop.products.name, shop.catalogs.name AS alias_name
FROM products INNER JOIN shop.catalogs
	ON shop.catalogs.id = shop.products.catalog_id;
	

/*Практическое задание по теме “Администрирование MySQL”
 (эта тема изучается по вашему желанию)
 
/*
 --------------------------------------------------------------------
 Создайте двух пользователей которые имеют доступ к базе данных shop. 
Первому пользователю shop_read должны быть доступны только запросы на 
чтение данных, второму пользователю shop — любые операции в пределах базы 
данных shop.*/

CREATE USER user_1;
CREATE USER user_2;
GRANT SELECT ON shop.* TO user_1;
GRANT ALL ON shop.* TO user_2;
SELECT host, USER FROM mysql.USER;
show grants for user_1;
show grants for user_2;

/*
 --------------------------------------------------------------------
 Практическое задание по теме “Хранимые процедуры и функции, триггеры"
 
 
Создайте хранимую функцию hello(), которая будет возвращать приветствие, 
в зависимости от текущего времени суток. С 6:00 до 12:00 функция должна 
возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать 
фразу "Добрый день", с 18:00 до 00:00 — "Добрый вечер", 
с 00:00 до 6:00 — "Доброй ночи".*/

DELIMITER //
DROP FUNCTION IF EXISTS hello//
CREATE FUNCTION hello ()
RETURNS TINYTEXT DETERMINISTIC
BEGIN
	DECLARE hour INT;
	SET hour = HOUR(NOW());
	CASE
		WHEN hour BETWEEN 0 AND 5 THEN RETURN "Доброй ночи";
		WHEN hour BETWEEN 6 AND 11 THEN RETURN "Доброе утро";
		WHEN hour BETWEEN 12 AND 17 THEN RETURN "Добрый день";
		WHEN hour BETWEEN 18 AND 23 THEN RETURN "Добрый вечер";
	END CASE;
END//

SELECT hello();

/*В таблице products есть два текстовых поля: name с названием товара и 
description с его описанием. Допустимо присутствие обоих полей или одно из них. 
Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема. 
Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были 
заполнены. При попытке присвоить полям NULL-значение необходимо отменить операцию.*/
DELIMITER //
DROP TRIGGER IF EXISTS name_description_notnull//
CREATE TRIGGER name_description_notnull BEFORE INSERT ON shop.products
FOR EACH ROW 
BEGIN
	SELECT CONCAT(NEW.name,NEW.description) INTO @count FROM shop.products LIMIT 1;
	IF @count=NULL THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Поля name и description не могут иметь значение NULL';
	END IF;
END//


/*INSERT INTO shop.products (name,description,price,catalog_id)
	VALUES (NULL,NULL,5060.00,2);*/

