-- 1. Create the database
CREATE DATABASE friendships_schema;

-- 2. Use the database
USE friendships_schema;

-- 3. Create users table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

-- 4. Create friendships table
CREATE TABLE friendships (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    friend_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (friend_id) REFERENCES users(id)
);

-- 5. Insert 6 users
INSERT INTO users (first_name, last_name) VALUES 
('Amy', 'Giver'),
('Eli', 'Byers'),
('BigBird', ''),
('Kermit', 'The Frog'),
('Marky', 'Mark'),
('John', 'Doe');

-- 6. Insert friendships
-- User 1 friends with users 2, 4, 6
INSERT INTO friendships (user_id, friend_id) VALUES 
(1, 2),
(1, 4),
(1, 6);

-- User 2 friends with users 1, 3, 5
INSERT INTO friendships (user_id, friend_id) VALUES 
(2, 1),
(2, 3),
(2, 5);

-- User 3 friends with users 2, 5
INSERT INTO friendships (user_id, friend_id) VALUES 
(3, 2),
(3, 5);

-- User 4 friends with user 3
INSERT INTO friendships (user_id, friend_id) VALUES 
(4, 3);

-- User 5 friends with users 1, 6
INSERT INTO friendships (user_id, friend_id) VALUES 
(5, 1),
(5, 6);

-- User 6 friends with users 2, 3
INSERT INTO friendships (user_id, friend_id) VALUES 
(6, 2),
(6, 3);

-- 7. Display all relationships
SELECT 
    users.first_name AS first_name,
    users.last_name AS last_name,
    user2.first_name AS friend_first_name,
    user2.last_name AS friend_last_name
FROM users
JOIN friendships ON users.id = friendships.user_id
LEFT JOIN users AS user2 ON friendships.friend_id = user2.id;

-- 8. Ninja Query 1: All users who are friends with the first user
SELECT 
    user2.first_name,
    user2.last_name
FROM friendships
JOIN users AS user2 ON friendships.friend_id = user2.id
WHERE friendships.user_id = 1;

-- 9. Ninja Query 2: Count all friendships
SELECT COUNT(*) AS total_friendships
FROM friendships;

-- 10. Ninja Query 3: Who has the most friends
SELECT 
    users.first_name,
    users.last_name,
    COUNT(friendships.friend_id) AS friend_count
FROM users
JOIN friendships ON users.id = friendships.user_id
GROUP BY users.id
ORDER BY friend_count DESC
LIMIT 1;

-- 11. Ninja Query 4: Friends of the third user in alphabetical order
SELECT 
    user2.first_name,
    user2.last_name
FROM friendships
JOIN users AS user2 ON friendships.friend_id = user2.id
WHERE friendships.user_id = 3
ORDER BY user2.first_name ASC;