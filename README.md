# Lesson-3
SELECT, ORDER BY,  UPDATE
Пусть в таблице users поля created_at и updated_at оказались незаполненными. 
Заполните их текущими датой и временем.


1. UPDATE users SET created_at = NOW(), updated_at = NOW() WHERE created_at is NULL or updated_at is NULL;
2. UPDATE users SET created_at = IF(created_at is NULL, NOW(), created_at), updated_at = IF(updated_at is NULL, NOW(), updated_at);
3. UPDATE users SET created_at = NOW() WHERE created_at = NULL;
   UPDATE users SET updated_at = NOW() WHERE updated_at = NULL;
4. UPDATE users SET created_at = NOW(), updated_at = NOW(); если в таблице все поля пусты или их надо поменять!

Таблица users была неудачно спроектирована. 
Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате "20.10.2017 8:10". 
Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.

Создаем таблицу и заполняем данными Users-2.sql;
1. Приводим данные в формат DATETIME из строки:
   UPDATE users SET created_at = STR_TO_DATE(created_at, '%d.%m.%Y %H:%i');
   UPDATE users SET updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %H:%i');
2. Далее меняем атрибут VARCHAR на DATETIME:
   ALTER TABLE users MODIFY created_at DATETIME DEFAULT CURRENT_TIMESTAMP;
   ALTER TABLE users MODIFY updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 
0, если товар закончился и выше нуля, если на складе имеются запасы. 
Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. 
Однако, нулевые запасы должны выводиться в конце, после всех записей.

1. Заполняем таблицу данными storehouses_products.sql
2. SELECT * FROM storehouses_products ORDER BY CASE WHEN value = 0 THEN TRUE ELSE FALSE END, value;

Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. 
Месяцы заданы в виде списка английских названий ('may', 'august')

SELECT id, name, birthday_at FROM users WHERE (birthday_at LIKE '%may%' OR birthday_at LIKE '%august%');

Из таблицы catalogs извлекаются записи при помощи запроса. SELECT * FROM catalogs WHERE id IN (5, 1, 2); 
Отсортируйте записи в порядке, заданном в списке IN.


Lesson 4
1.Подсчитайте средний возраст пользователей в таблице users
ALTER TABLE users ADD age INT NOT NULL;
UPDATE users SET age = TIMESTAMPDIFF(YEAR, birthday_at, NOW());
SELECT AVG(age) FROM users;
