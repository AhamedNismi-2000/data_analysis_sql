-- SQL Query to combine job listings from January, February, and March
SELECT job_title_short,
       job_location,
       salary_year_avg
FROM   january_jobs

UNION 

SELECT job_title_short,
       job_location,
       salary_year_avg
FROM   february_jobs

UNION

SELECT job_title_short,
       job_location,
       salary_year_avg
FROM   march_jobs;

-- SQL Query to combine job listings from January, February, and March including duplicates

SELECT job_title_short,
       job_location,
       salary_year_avg
FROM   january_jobs

UNION ALL

SELECT job_title_short,
       job_location,
       salary_year_avg
FROM   february_jobs

UNION ALL

SELECT job_title_short,
       job_location,
       salary_year_avg
FROM   march_jobs;



