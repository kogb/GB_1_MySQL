use vk;
-- ii. Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке
SELECT DISTINCT firstname
FROM users
ORDER BY firstname ASC;
/* iii. Написать скрипт, отмечающий несовершеннолетних пользователей как 
 * неактивных (поле is_active = false). Предварительно добавить такое поле 
 * в таблицу profiles со значением по умолчанию = true (или 1)*/
ALTER TABLE vk.profiles 
ADD COLUMN is_active BIT DEFAULT 1;

UPDATE profiles
SET is_active = 0
WHERE YEAR(CURRENT_TIMESTAMP) - YEAR(birthday) - (RIGHT(CURRENT_TIMESTAMP, 5) < RIGHT(birthday, 5)) < 18;

-- iv. Написать скрипт, удаляющий сообщения «из будущего» (дата больше сегодняшней)
UPDATE messages
	SET created_at='2029-07-11 04:00:00'
	WHERE id = 1;

DELETE FROM messages
WHERE created_at > now();







