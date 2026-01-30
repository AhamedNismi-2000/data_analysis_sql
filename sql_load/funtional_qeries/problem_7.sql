-- Find the top 10 skills required for remote Data Analyst positions

WITH remote_jobs AS (
    SELECT 
        skills.skill_id,
        COUNT(*) AS skill_count
        FROM skills_job_dim AS skills
        INNER JOIN job_postings_fact AS fact
        ON skills.job_id = fact.job_id
        WHERE fact.job_work_from_home =TRUE AND job_title_short ='Data Analyst'
        GROUP BY skill_id
)

SELECT 
      skills_dim.skills AS skill_name,
      remote_jobs.skill_count,
      skills_dim.skill_id
  FROM
      remote_jobs 
      INNER JOIN skills_dim ON 
      remote_jobs.skill_id = skills_dim.skill_id
    ORDER BY remote_jobs.skill_count DESC
    LIMIT 10;
   