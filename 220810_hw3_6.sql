USE VK;
/*1. Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, 
 *который больше всех общался с выбранным пользователем (написал ему сообщений).*/
SELECT 
	count(*),
	from_user_id,
	(SELECT firstname FROM users WHERE id = messages.from_user_id) AS 'firstname',
	(SELECT lastname FROM users WHERE id = messages.from_user_id) AS 'lastname'
FROM messages
WHERE to_user_id = 16
GROUP BY from_user_id
ORDER BY count(*) DESC
LIMIT 1

/*2.Подсчитать общее количество лайков, которые получили пользователи младше 10 лет..*/
DROP VIEW IF EXISTS likes_malolet;
CREATE VIEW likes_malolet AS
SELECT 
	count(*) AS sum_id_likes,
	user_id
FROM likes
WHERE user_id IN (SELECT user_id FROM vk.profiles WHERE (birthday + INTERVAL 10 YEAR) > now())
GROUP BY user_id
ORDER BY count(*) DESC;

SELECT sum(sum_id_likes) FROM likes_malolet;

/*3.Определить кто больше поставил лайков (всего): мужчины или женщины.*/
DROP VIEW IF EXISTS likes_gender;
CREATE VIEW likes_gender AS
SELECT id ,user_id,
	(SELECT gender FROM profiles WHERE profiles.user_id=likes.user_id) AS 'gender' 
FROM likes;

SELECT 
	count(*) AS likes_gender,
	gender
FROM likes_gender
GROUP BY gender
ORDER BY likes_gender DESC
LIMIT 1;
