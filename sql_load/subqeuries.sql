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




WITH company_job_count AS (
SELECT company_id,
        COUNT(*)
FROM job_postings_fact
GROUP BY company_id
)
SELECT *
FROM company_job_count;
        
 
