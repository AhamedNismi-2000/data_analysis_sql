/*Answer: What are the top skills based on salary?
— Look at the average salary associated with each skill for Data Analyst positions
— Focuses on roles with specified salaries, regardless of location
— Why? It reveals how different skills impact salary levels for Data Analysts and
helps identify the most financially rewarding skills to acquire or improve
*/


SELECT 
     skills,
     ROUND(AVG(jpf.salary_year_avg ),1) AS average_salary
     FROM job_postings_fact AS jpf
     INNER JOIN skills_job_dim as sjd
     ON jpf.job_id = sjd.job_id
     INNER JOIN skills_dim AS sd
     ON sd.skill_id=sjd.skill_id
     WHERE
     job_title_short ILIKE'%Data Analyst%'
     AND salary_year_avg IS NOT NULL
     AND job_work_from_home = TRUE
     GROUP BY skills 
     ORDER BY average_salary DESC
     LIMIT 20;


     /* p paying skills (~185k–189k)
Skills: bitbucket (189k), fastapi (185k), angular (185k), keras (185k)
Insight:
Cloud/DevOps tools (bitbucket) and modern frameworks (FastAPI, Angular, Keras) command the highest salaries in this dataset.
These are specialized or cutting-edge skills, likely used in enterprise-level or high-tech projects.


2. Mid-tier salaries (~140k–182k)
Skills: pyspark (182k), golang (161k), watson (160k), couchbase (160k), gitlab (154k), jupyter (151k), swift (147k), pandas (146k), numpy (142k), flask (142k)
Insight:
These are popular programming, data engineering, and analytics tools.
Salaries are good but lower than niche/high-demand frameworks.
Examples:
Data analysis and ML: jupyter, pandas, numpy
Data engineering: pyspark, couchbase
Backend/framework: golang, flask
Mobile dev: swift

3. Lower tier (~138k–140k)
Skills: kafka, pytorch, tensorflow, cassandra, linux, rust
Insight
These are essential infrastructure and machine learning tools, but their salary is slightly lower than specialized frameworks.
Likely because they are widely used, so more candidates have these skills.


4. Patterns & key takeaways
DevOps & cloud tools like bitbucket, gitlab are high-paying, showing demand for CI/CD and deployment expertise.
Modern frameworks (FastAPI, Angular, Keras) often outpay older or more common libraries.
Data engineering & ML tools (pyspark, pandas, numpy, tensorflow, pytorch) are mid-range, indicating high supply of talent but still strong demand.
Niche languages (golang, rust, swift) are well-paying, likely because fewer people specialize in them.