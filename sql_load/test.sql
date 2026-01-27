
DROP TABLE job_postings_fact,
          skills_job_dim,
          skills_dim,
          company_dim;


SELECT * FROM company_dim LIMIT 5;
SELECT * FROM skills_dim LIMIT 5;
SELECT * FROM job_postings_fact LIMIT 5;
SELECT * FROM skills_job_dim LIMIT 5;          