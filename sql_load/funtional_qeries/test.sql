SELECT  
        cd.name AS company_name,
       jpf.job_posted_date :: DATE AS posted_date ,
       EXTRACT(QUARTER FROM jpf.job_posted_date) AS posting_quarter,
       COUNT(*)
FROM company_dim AS cd 
JOIN job_postings_fact AS jpf       
ON cd.company_id = jpf.company_id
WHERE EXTRACT(QUARTER FROM jpf.job_posted_date) = 2

-- Rule for the GROUP BY clause
/* Always include in GROUP BY: all non-aggregated columns in SELECT

Aggregated columns (COUNT, SUM, MIN, MAX…) do not go in GROUP BY

WHERE filters rows before GROUP BY — only rows that pass WHERE are grouped

If you want aggregation across all rows without grouping, you can skip GROUP BY
*/







CREATE TABLE january_jobs AS 
SELECT  *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

CREATE TABLE february_jobs AS 
SELECT  *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) =2;

CREATE TABLE march_jobs AS 
SELECT  *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 3;



SELECT 
       COUNT(job_id) AS total_job_postings,
       EXTRACT(MONTH FROM job_posted_date) AS month
FROM job_postings_fact
WHERE job_title_short = 'Data Scientist'
GROUP BY month
ORDER BY total_job_postings DESC;

SELECT * FROM company_dim LIMIT 5;
SELECT * FROM skills_dim LIMIT 5;
SELECT * FROM job_postings_fact LIMIT 5;
SELECT * FROM skills_job_dim LIMIT 5;    


/*DROP TABLE job_postings_fact,
          skills_job_dim,
          skills_dim,
          company_dim;
*/

      


