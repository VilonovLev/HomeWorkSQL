USE lesson_4;

delimiter $$
CREATE PROCEDURE recommendedFriends(user_id INT)
DETERMINISTIC
BEGIN
	DECLARE homeCity VARCHAR(60) DEFAULT "";
    SET homeCity = (SELECT hometown FROM `profiles` WHERE lesson_4.`profiles`.user_id = user_id);

    WITH friends AS (SELECT users.* FROM users
	JOIN
	(SELECT CASE 
			WHEN initiator_user_id = user_id THEN target_user_id
            WHEN target_user_id = user_id THEN initiator_user_id
		END AS friend_id
	FROM friend_requests 
	WHERE `status` = 'approved') AS friends
	ON users.id = friends.friend_id)
    
	SELECT * FROM users WHERE users.id IN
		(SELECT users_communities.user_id 
		FROM users_communities 
        WHERE users_communities.community_id IN
			(SELECT community_id 
            FROM users_communities 
            WHERE users_communities.user_id = user_id) 
		GROUP BY users_communities.user_id)
	UNION
	SELECT * FROM users WHERE id IN 
		(SELECT user_id 
        FROM lesson_4.`profiles` 
        WHERE lesson_4.`profiles`.hometown = homeCity)
	UNION
    SELECT * FROM users WHERE id IN
		(SELECT CASE
			WHEN initiator_user_id IN (SELECT friends.id FROM friends) THEN target_user_id
			WHEN target_user_id IN (SELECT friends.id FROM friends) THEN initiator_user_id
		END AS Ff
	FROM friend_requests
	WHERE `status` = 'approved') 
	AND id != user_id
    ORDER BY RAND()
	LIMIT 5;

END $$
delimiter ;
