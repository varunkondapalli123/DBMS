ALTER USER my_username IDENTIFIED BY new_password;

SELECT fruits
FROM likes;

CREATE TABLE likes AS SELECT * FROM kotroczo.likes;
SELECT * FROM likes;

-- 1. List the fruits that Winnie likes.
SELECT fruits
FROM likes
WHERE name = 'Winnie';

-- 2. List the fruits that Winnie doesn't like but someone else does.
SELECT fruits
FROM likes
MINUS
SELECT fruits
FROM likes
WHERE name = 'Winnie';

-- 3. Who likes apple?
SELECT name
FROM likes
WHERE fruits = 'apple';

-- 4. List those names who doesn't like pear but like something else.
SELECT name
FROM likes
MINUS
SELECT name
FROM likes
WHERE fruits = 'pear';

-- 5. Who likes raspberry or pear? 
SELECT DISTINCT name
FROM likes
WHERE fruits = 'pear' OR fruits = 'raspberry';

-- 6. Who likes both apple and pear?
SELECT name
FROM likes
WHERE fruits = 'apple'
INTERSECT
SELECT name
FROM likes
WHERE fruits = 'pear';
