DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    birthday_at VARCHAR(255),
    created_at VARCHAR(255),
    updated_at VARCHAR(255)
 ) COMMENT = 'Пользователи';

ALTER TABLE example.users CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;

INSERT INTO users (name, birthday_at, created_at, updated_at) VALUES
    ('Александр', '20 may 1988', '20.10.2017 8:10', '23.10.2017 8:10'),
    ('Мария', '06 augast 1989', '21.10.2017 8:10', '24.10.2017 8:10'),
    ('Иван', '15 february 1990', '22.10.2017 8:10', '25.10.2017 8:10');