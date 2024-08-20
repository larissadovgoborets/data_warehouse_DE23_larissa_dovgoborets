-- display databases to find the name of the Google database
SHOW DATABASES;

-- select the right database to work on
USE DATABASE GOOGLE_KEYWORDS_SEARCH_DATASET__DISCOVER_ALL_SEARCHES_ON_GOOGLE;

-- show the schemas
SHOW SCHEMAS;

-- select the latest schema
USE SCHEMA INFORMATION_SCHEMA;

-- show the tables
SHOW TABLES;

SHOW VIEWS;

SELECT * FROM VIEWS LIMIT 10;

-- select the other schema
USE SCHEMA DATAFEEDS;

SHOW TABLES;

-- see if the schema got any views
SHOW VIEWS; -- nope

-- b) display all the columns and their datatypes in the table
DESC TABLE GOOGLE_KEYWORDS;


-- preview the first 10 rows of the only table
SELECT * FROM GOOGLE_KEYWORDS LIMIT 10;


-- c) count the number of rows in the table
SELECT COUNT(*) FROM GOOGLE_KEYWORDS;
-- 35046855 rows

-- d) When is the first search and when is the latest search in the dataset?
SELECT DISTINCT(DATE) FROM GOOGLE_KEYWORDS
ORDER BY DATE ASC;
-- first search 2022-06-01

SELECT DISTINCT(DATE) FROM GOOGLE_KEYWORDS
ORDER BY DATE DESC; -- last seatch 2022-06-30

-- e) Which are the 10 most popular keywords?
SELECT KEYWORD, COUNT(*) AS number_of_searches FROM GOOGLE_KEYWORDS
GROUP BY KEYWORD
ORDER BY number_of_searches DESC
LIMIT 10;
-- gmail, youtube, facebook, google, amazon, google drive, canva, instagram, netflix, roblox


-- f) see how many unique keywords are in the table
SELECT COUNT(DISTINCT KEYWORD) FROM GOOGLE_KEYWORDS;
-- 7263686 unique keywords

-- g) Check what type of platfroms are used and how many users per platform
SELECT PLATFORM, SUM(CALIBRATED_USERS) AS number_of_users FROM GOOGLE_KEYWORDS
GROUP BY PLATFORM
ORDER BY number_of_users DESC;
-- desktop 108757008.104741

-- check if there is only one platform
SELECT DISTINCT(PLATFORM) FROM GOOGLE_KEYWORDS; 


