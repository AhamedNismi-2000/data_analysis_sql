
-- Load company_dim
COPY company_dim
FROM 'D:\Mine\SQL\data_analysis_sql\csv_files\company_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

-- Load skills_dim
COPY skills_dim
FROM 'D:\Mine\SQL\data_analysis_sql\csv_files\skills_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

-- Load job_postings_fact
COPY job_postings_fact
FROM 'D:\Mine\SQL\data_analysis_sql\csv_files\job_postings_fact.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

-- Load skills_job_dim
COPY skills_job_dim
FROM 'D:\Mine\SQL\data_analysis_sql\csv_files\skills_job_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');


