USE VK;
/*1. Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, 
 *который больше всех общался с выбранным пользователем (написал ему сообщений).*/
SET @to_user_id1:=16;

SELECT count(*) AS 'number_of_messages',
	vk.messages.from_user_id,
	vk.messages.to_user_id,
	concat(firstname,' ', lastname)AS 'name'
FROM vk.messages
INNER JOIN vk.users ON vk.users.id = vk.messages.from_user_id
WHERE vk.messages.to_user_id = @to_user_id1
GROUP BY from_user_id
ORDER BY count(*) DESC
LIMIT 1;
/*!!!!! не совсем понял почему выдает ошибку при запуске 
 * всего кода с переменной, при этом последовательно все работает?*/


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
