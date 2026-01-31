
/*Question:
What skills are required for the top—paying data analyst jobs?
— Use the top 10 highest—paying Data Analyst jobs from first query
— Add the specific skills required for these roles
— Why? It provides a detailed look at which high-paying jobs demand certain skills,
helping job seekers understand which skills to develop that align with top salaries
*/

    WITH top_paying_skill_job AS (
    SELECT 
            jpf.job_id,
            jpf.job_title_short,
            jpf.salary_year_avg,
            cd.name AS company_name 
            FROM job_postings_fact AS jpf
            INNER JOIN company_dim AS cd
            ON jpf.company_id = cd.company_id
            WHERE jpf.salary_year_avg IS NOT NULL AND 
            jpf.job_title_short = 'Data Analyst'
        
    )
    SELECT 
        tpsj.job_id,
        tpsj.job_title_short,
        tpsj.salary_year_avg,
        tpsj.company_name,
        sd.skills AS skill_name 
    FROM top_paying_skill_job AS tpsj
    INNER JOIN skills_job_dim AS sjd
    ON tpsj.job_id = sjd.job_id
    INNER JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
    ORDER BY tpsj.salary_year_avg DESC;


-- Alternate Method  istead od using the top paying job skill table 
/*  tpsj.job_id,
        tpsj.job_title_short,
        tpsj.salary_year_avg,
        tpsj.company_name,

*/
-- Use like this it means select all the things which is relevant to the top paying job skills table CTE
    WITH top_paying_skill_job AS (
    SELECT 
            jpf.job_id,
            jpf.job_title_short,
            jpf.salary_year_avg,
            cd.name AS company_name 
            FROM job_postings_fact AS jpf
            INNER JOIN company_dim AS cd
            ON jpf.company_id = cd.company_id
            WHERE jpf.salary_year_avg IS NOT NULL AND 
            jpf.job_title_short = 'Data Analyst'
        
    )
    SELECT 
        tpsj.*,
        sd.skills AS skill_name 
    FROM top_paying_skill_job AS tpsj
    INNER JOIN skills_job_dim AS sjd
    ON tpsj.job_id = sjd.job_id
    INNER JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
    ORDER BY tpsj.salary_year_avg DESC;    

