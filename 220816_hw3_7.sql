USE shop;
/*1 Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.*/
INSERT INTO shop.orders
	(user_id)
VALUES
	(1),
	(3),
	(6),
	(1),	
	(3),
	(2),
	(4),
	(3),
	(2);

SELECT * FROM orders;

SELECT count(*) AS 'numb_orders', (SELECT name FROM shop.users WHERE id = user_id) AS 'buyers' 
FROM orders
GROUP BY buyers
ORDER BY count(*) DESC;

/*Второй вариант решения*/
SELECT count(*) AS 'numb_orders', shop.users.name AS 'buyers'
FROM orders JOIN users
ON shop.orders.user_id = shop.users.id
GROUP BY shop.users.name  
ORDER BY count(*) DESC;

/*2 Выведите список товаров products и разделов catalogs, который соответствует товару.*/

SELECT id, name, (SELECT name FROM catalogs WHERE id = catalog_id) AS 'catalog' 
FROM products;

/*Второй вариант решения*/
SELECT shop.products.id, shop.products.name, shop.catalogs.name 
FROM products INNER JOIN shop.catalogs
	ON shop.catalogs.id = shop.products.catalog_id;


/*3 (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
Поля from, to и label содержат английские названия городов, поле name — русское. Выведите список рейсов flights с русскими названиями городов.*/
DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;

CREATE TABLE flights 
	(id serial PRIMARY KEY, 
	`from` varchar(255) COMMENT 'Пункт отправления', 
	`to` varchar(255) COMMENT 'Пункт назначения');

INSERT INTO test.flights
	(`from`,`to`)
VALUES
	('moscow', 'omsk'),
	('novgorod', 'kazan'),
	('irkutsk', 'moscow'),
	('omsk', 'irkutsk'),
	('moscow', 'kazan');

CREATE TABLE cities 
	(label varchar(255) COMMENT 'Название латиницей',
	name varchar(255) COMMENT 'Название кириллицей');

INSERT INTO test.cities
	(label, name)
VALUES
	('moscow', 'Москва'),
	('irkutsk', 'Иркутск'),
	('novgorod', 'Новгород'),
	('kazan', 'Казань'),	
	('omsk', 'Омск');

SELECT * FROM flights;
SELECT * FROM cities;

SELECT id, 
(SELECT name FROM test.cities WHERE label = `from`) AS `from`,
(SELECT name FROM test.cities WHERE label = `to`) AS `to`
FROM test.flights;


/*Второй вариант решения*/
DROP VIEW IF EXISTS first_table;
CREATE VIEW first_table AS
SELECT id, cities.name AS `from`, `to`
FROM test.flights JOIN test.cities /*AS first_table*/
	ON test.cities.label = flights.`from`
	ORDER BY test.flights.id;

SELECT id, `from`, cities.name AS `to`
FROM first_table JOIN test.cities 
		ON test.cities.label = first_table.`to`
		ORDER BY test.first_table.id;
