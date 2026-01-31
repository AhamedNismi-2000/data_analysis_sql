/*Question: What are the most in—demand skills for data analysts?
 — Join job postings to inner join table similar to query 2
 — Identify the top 5 in—demand skills for a data analyst.
 — Focus on all job postings.
 — Why? Retrieves the top 5 skills with the highest demand in the job market,
 providing insights into the most valuable skills for job seekers.
 */


 
-- This is Top Demanded Skills for Data Scientist 
SELECT sd.skills AS skill_name,
    COUNT(sjd.job_id) AS skill_count,
    jpf.salary_year_avg
FROM job_postings_fact AS jpf
    INNER JOIN skills_job_dim as sjd ON jpf.job_id = sjd.job_id
    INNER JOIN skills_dim AS sd ON sjd.skill_id = sd.skill_id
WHERE jpf.job_title_short = 'Data Scientist'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY skill_name,
    jpf.salary_year_avg
ORDER BY skill_count DESC
LIMIT 20;



-- This Top Demanded Skills For Data Analyst 
SELECT sd.skills AS skill_name,
    COUNT(sjd.job_id) AS skill_count,
    jpf.salary_year_avg
FROM job_postings_fact AS jpf
    INNER JOIN skills_job_dim as sjd ON jpf.job_id = sjd.job_id
    INNER JOIN skills_dim AS sd ON sjd.skill_id = sd.skill_id
WHERE jpf.job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY skill_name,
    jpf.salary_year_avg
ORDER BY skill_count DESC
LIMIT 20;



-- Top Demanded Skills For All Data Science Jobs 
SELECT sd.skills AS skill_name,
    COUNT(sjd.job_id) AS skill_count,
    jpf.salary_year_avg,
    job_title_short
FROM job_postings_fact AS jpf
    INNER JOIN skills_job_dim as sjd ON jpf.job_id = sjd.job_id
    INNER JOIN skills_dim AS sd ON sjd.skill_id = sd.skill_id
WHERE jpf.job_title_short ILIKE '%data%'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY skill_name,
    jpf.salary_year_avg,
    job_title_short
ORDER BY skill_count DESC
LIMIT 100;



-- Top Demanded Skills For All Jobs
SELECT sd.skills AS skill_name,
    COUNT(sjd.job_id) AS skill_count,
    jpf.salary_year_avg
FROM job_postings_fact AS jpf
    INNER JOIN skills_job_dim as sjd ON jpf.job_id = sjd.job_id
    INNER JOIN skills_dim AS sd ON sjd.skill_id = sd.skill_id
WHERE salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY skill_name,
    jpf.salary_year_avg
ORDER BY skill_count DESC
LIMIT 20;