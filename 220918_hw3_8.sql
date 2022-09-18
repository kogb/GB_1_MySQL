USE VK;
/*1. Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, 
 *который больше всех общался с выбранным пользователем (написал ему сообщений).*/
SELECT count(*) AS 'number_of_messages',
	from_user_id,
	to_user_id,
	concat(firstname,' ', lastname)AS 'name'
FROM vk.messages
INNER JOIN vk.users ON vk.users.id = vk.messages.from_user_id
WHERE to_user_id = 16 -- задаем пользователя
GROUP BY from_user_id
ORDER BY count(*) DESC
LIMIT 1;

/*2.Подсчитать общее количество лайков, которые получили пользователи младше 10 лет..*/
SELECT 
	count(*) AS sum_id_likes
FROM vk.likes
JOIN vk.profiles ON vk.profiles.user_id = vk.likes.user_id
WHERE birthday + INTERVAL 10 YEAR > now()

/*3.Определить кто больше поставил лайков (всего): мужчины или женщины.*/
SELECT 
	count(*), 
	gender
FROM vk.likes
JOIN vk.profiles ON vk.profiles.user_id = vk.likes.user_id
GROUP BY gender
ORDER BY count(*) DESC
LIMIT 1;
