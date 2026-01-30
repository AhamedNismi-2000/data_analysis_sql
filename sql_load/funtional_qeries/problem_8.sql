/* Find job postings from the first quarter that have a salary greater than $70K
- Combine job posting tables from the first quarter of 2023 (Jan-Mar)
— Gets job postings with an average yearly salary > $70,000
*/
-- Using Subqueries and UNION to combine results from multiple tables
SELECT 
    job_title_short,
    job_location,
    job_via,
    job_posted_date:: DATE,
    salary_year_avg
FROM
(SELECT *
FROM january_jobs
UNION
SELECT *
FROM february_jobs
UNION
SELECT *   
FROM march_jobs
) AS job_postings_quarter1
WHERE salary_year_avg > 70000 AND job_title_short = 'Data Scientist'
ORDER BY salary_year_avg DESC;


-- Using CTEs (Common Table Expressions) to combine results from multiple tables 
WITH job_postings_quarter1 AS (
    SELECT * 
    FROM january_jobs
    UNION 
    SELECT * 
    FROM february_jobs
    UNION
    SELECT *
    FROM march_jobs
)
SELECT job_title_short,
       job_location,
       job_via,
       job_posted_date::DATE,
       salary_year_avg
FROM job_postings_quarter1
WHERE salary_year_avg > 70000 AND job_title_short = 'Data Scientist'
ORDER BY salary_year_avg DESC;