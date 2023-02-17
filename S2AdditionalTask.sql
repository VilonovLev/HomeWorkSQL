-- №1.	Используя оператор ALTER TABLE, установите внешний ключ в одной из таблиц. 
ALTER TABLE posts 
ADD CONSTRAINT user_id_clients
FOREIGN KEY (user_id) REFERENCES clients(id) ON UPDATE CASCADE; 
-- №2.	Без оператора JOIN, верните заголовок публикации, текст с описанием, идентификатор клиента, опубликовавшего публикацию и логин данного клиента.
SELECT title, full_text, user_id, clients.login 
FROM posts, clients 
WHERE user_id = clients.id 
ORDER BY user_id;
-- №3.	Выполните поиск  по публикациям, автором котоырх является клиент "Mikle".
SELECT * FROM posts 
WHERE user_id IN (SELECT id FROM clients WHERE login = "Mikle") 
ORDER BY id;