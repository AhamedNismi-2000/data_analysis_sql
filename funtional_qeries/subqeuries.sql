SELECT *  
FROM(--Sub Queries Start Here 
     SELECT * 
     FROM job_postings_fact 
     WHERE EXTRACT(MONTH FROM job_posted_date) =1 
   
     )
AS january;



SELECT name as company_name,
               company_id
FROM   company_dim
WHERE  company_id IN (
       SELECT company_id
       FROM job_postings_fact
       WHERE job_no_degree_mention = TRUE
       ORDER BY company_id DESC
)

-- ETC
SELECT company_id,
       COUNT(*) 
FROM   job_postings_fact
GROUP BY company_id


-- this query lists companies along with their job posting counts, ordered by the number of postings in descending order
WITH company_job_counts AS (
     SELECT company_id,
            COUNT(*) AS job_count
     FROM   job_postings_fact
     GROUP BY company_id
)
SELECT 
    company_dim.name AS  company_name,
    company_job_counts.job_count
    FROM company_dim
    LEFT JOIN company_job_counts
    ON company_dim.company_id = company_job_counts.company_id
    ORDER BY company_job_counts.job_count DESC;


 
-- Find the top 100 skills for Data Scientist positions in January with highest average salaries
WITH skill_job_postings AS (
    SELECT
         sd.skill_id,
         sd.skills AS skill_name,
         sd.type AS skill_type,
         sjd.job_id      
    FROM skills_dim AS sd 
    INNER JOIN skills_job_dim AS sjd
    ON sd.skill_id = sjd.skill_id
)

SELECT sjp.skill_id,
       sjp.skill_name,
       jjob.job_title_short,
       jjob.salary_year_avg AS average_salary,
       EXTRACT(DAY FROM jjob.job_posted_date) AS job_posted_DAY
       
       FROM skill_job_postings AS sjp
       INNER JOIN january_jobs AS jjob
       ON sjp.job_id = jjob.job_id 
       WHERE jjob.salary_year_avg IS NOT NULL AND job_title_short = 'Data Scientist'
       ORDER BY average_salary DESC
       LIMIT 100;


-- Job Posted in 2023 Q1 for Data Scientist positions with highest average salaries

WITH skill_job_postings AS (
    SELECT
         sd.skill_id,
         sd.skills AS skill_name,
         sd.type AS skill_type,
         sjd.job_id      
    FROM skills_dim AS sd 
    INNER JOIN skills_job_dim AS sjd
    ON sd.skill_id = sjd.skill_id
)
SELECT sjp.skill_id,
       sjp.skill_name,
        jpf.job_title_short,
        jpf.salary_year_avg AS average_salary,
       EXTRACT(QUARTER FROM jpf.job_posted_date) AS job_posted_quarter
       
       FROM skill_job_postings AS sjp
       INNER JOIN job_postings_fact AS jpf
       ON sjp.job_id = jpf.job_id 
       WHERE jpf.salary_year_avg IS NOT NULL AND job_title_short = 'Data Scientist'
       ORDER BY average_salary DESC
       LIMIT 100;     