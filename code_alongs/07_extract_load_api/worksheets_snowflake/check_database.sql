USE ROLE job_ads_dlt_role;

show databases;

USE job_ads.staging;

SHOW tables;

SELECT * FROM JOBSEARCH_RESOURCE;
SELECT
    headline,
    employer__workplace
FROM jobsearch_resource;

