-- выбрать всех пользователей, указав их id, имя и фамилию, город и аватарку
-- (используя вложенные запросы)
SELECT id, 
concat(firstname," ", lastname) AS fullname,
`profiles`.photo_id, 
`profiles`.hometown
FROM users, `profiles`
WHERE id = user_id;

-- Список медиафайлов пользователей, указав название типа медиа (id, filename, name_type)
-- (используя JOIN)
SELECT user_id, filename, name_type FROM media 
JOIN media_types ON media.media_type_id = media_types.id;

-- Найдите друзей у  друзей пользователя с id = 1. 
-- (решение задачи с помощью представления “друзья”)
CREATE VIEW Reuben_friends AS
(SELECT users.* FROM users
JOIN
(SELECT CASE 
			WHEN initiator_user_id = "1" THEN target_user_id
            WHEN target_user_id = "1" THEN initiator_user_id
		END AS friend_id
FROM friend_requests 
WHERE `status` = 'approved') AS friends
ON users.id = friends.friend_id
WHERE friends.friend_id IS NOT NULL);