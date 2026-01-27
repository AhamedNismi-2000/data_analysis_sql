
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

      


