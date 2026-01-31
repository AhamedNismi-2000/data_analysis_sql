/*Answer: What are the most optimal skills to learn (aka it's in high demand and a high—paying skill)?
 — Identify skills in high demand and associated with high average salaries for Data Analyst roles
 — Concentrates on remote positions with specified salaries
 — Why? Targets skills that offer job security (high demand) and financial benefits (high salaries),
 offering stratxgic insights for career development in data analysis
 */
WITH skill_demand AS (
    SELECT 
        sd.skills,
        sd.skill_id,
        COUNT(sjd.job_id) AS demand_count
        
    FROM job_postings_fact AS jpf
        INNER JOIN skills_job_dim as sjd ON jpf.job_id = sjd.job_id
        INNER JOIN skills_dim AS sd ON sjd.skill_id = sd.skill_id
    WHERE jpf.job_title_short = 'Data Scientist'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = TRUE
    GROUP BY sd.skills,sd.skill_id    
),
 avg_salary AS (
    SELECT sd.skills,
        sd.skill_id,
        ROUND(AVG(jpf.salary_year_avg), 1) AS average_salary
    FROM job_postings_fact AS jpf
        INNER JOIN skills_job_dim as sjd ON jpf.job_id = sjd.job_id
        INNER JOIN skills_dim AS sd ON sd.skill_id = sjd.skill_id
    WHERE job_title_short ILIKE '%Data Analyst%'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = TRUE
     GROUP BY sd.skills,sd.skill_id     
)
SELECT avg_salary.skill_id,
    skill_demand.skills,
    demand_count,
    average_salary
FROM skill_demand
    INNER JOIN avg_salary ON skill_demand.skill_id = avg_salary.skill_id
ORDER BY demand_count DESC,
    average_salary DESC
LIMIT 25;