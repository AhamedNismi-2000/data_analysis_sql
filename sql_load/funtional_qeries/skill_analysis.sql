SELECT * FROM skills_job_dim LIMIT 5;

-- in here short form of table names are used for better readability


WITH top_skills AS (
     SELECT 
        skill_id,
        COUNT(*) AS skill_count
     FROM skills_job_dim
     GROUP BY skill_id
     
)
SELECT ts.skill_id,
       sd.skills AS skill_name,
       ts.skill_count
       FROM skills_dim AS sd
       LEFT JOIN top_skills AS ts
       ON sd.skill_id = ts.skill_id
       ,
       LEFT JOIN  skils_job_dim AS sjd
       ON job_postings_fact.job_id = sjd.job_id
       WHERE job_postings_fact.job_title_short = 'Data Scientist'
       ORDER BY ts.skill_count DESC
       LIMIT 10;



/*WITH top_skills AS (
     SELECT 
        skill_id,
        COUNT(*) AS skill_count
     FROM skills_job_dim
     GROUP BY skill_id
)
SELECT 
    ts.skill_id,
    sd.skills AS skill_name,
    ts.skill_count,
   COUNT (jpf.job_title_short) AS job_count,
   jpf.job_title_short AS job_title
FROM top_skills AS ts
JOIN skills_dim AS sd
    ON ts.skill_id = sd.skill_id
JOIN skills_job_dim AS sjd
    ON ts.skill_id = sjd.skill_id
JOIN job_postings_fact AS jpf
    ON sjd.job_id = jpf.job_id
WHERE jpf.job_title_short = 'Data Analyst'
GROUP BY ts.skill_id,
         sd.skills,
         ts.skill_count,
         jpf.job_title_short
ORDER BY ts.skill_count DESC


*/
