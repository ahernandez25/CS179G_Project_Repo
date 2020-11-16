DROP TABLE IF EXISTS Users CASCADE;
DROP TABLE IF EXISTS Post CASCADE;
DROP TABLE IF EXISTS UserProfile CASCADE;

-------------
--SEQUENCES--
-------------
/*
CREATE SEQUENCE userID START WITH 11;
CREATE SEQUENCE post_id START WITH 11;
CREATE SEQUENCE profile_id START WITH 11;
*/
-------------
---DOMAINS---
-------------

/*CREATE DOMAIN STATUS_1 AS CHAR(5) CHECK (value IN ( 'TRUE' , 'FALSE') );
*/
------------
---TABLES---
------------

CREATE TABLE Users(
userID INTEGER NOT NULL,
fullname VARCHAR(128) NOT NULL,
username VARCHAR(64) NOT NULL,
email VARCHAR(64) NOT NULL,
user_password CHAR(64) NOT NULL,
PRIMARY KEY(username)
);

---------------
---RELATIONS---
---------------

CREATE TABLE Post(
post_id INTEGER NOT NULL,
username_id VARCHAR(64) NOT NULL,
likes INTEGER NOT NULL,
date_posted DATE NOT NULL,
num_comments INTEGER NOT NULL,
tags VARCHAR(64) NOT NULL,
photo_url VARCHAR(128) NOT NULL,
PRIMARY KEY(post_id),
FOREIGN KEY(username_id) REFERENCES Users(username)
);

CREATE TABLE UserProfile(
profile_id INTEGER NOT NULL,
username_id VARCHAR(64) NOT NULL,
num_posts INTEGER NOT NULL,
followers INTEGER NOT NULL,
followings INTEGER NOT NULL,
followStatus VARCHAR(5) NOT NULL,
FOREIGN KEY(username_id) REFERENCES Users(username)
);


----------------------------
-- INSERT DATA STATEMENTS --
----------------------------

COPY Users(
	userID,
    fullname,
    username,
    email,
    user_password
)
FROM 'users.csv'
WITH DELIMITER ',';

COPY Post (
	post_id,
	username_id,
    likes,
    date_posted,
    num_comments,
    tags,
    photo_url
)
FROM 'posts.csv'
WITH DELIMITER ',';

COPY UserProfile (
	profile_id,
	username_id,
    num_posts,
    followers,
    followings,
    followStatus
)
FROM 'profiles.csv'
WITH DELIMITER ',';

