USE WAREHOUSE COMPUTE_WH;
USE ROLE movies_reader;
USE DATABASE movies;

SHOW SCHEMAS;

USE SCHEMA staging;

SHOW TABLES;

SELECT * FROM netflix
LIMIT 10;

DESC TABLE netflix;

SELECT COUNT(*) FROM netflix;

SELECT COUNT(DISTINCT title) FROM netflix;

