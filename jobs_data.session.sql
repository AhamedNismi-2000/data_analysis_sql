CREATE TABLE job_title(
    job_id INTEGER,
    job_name TEXT,
    job_location VARCHAR,
    job_type VARCHAR
);

INSERT INTO job_title VALUES (1,'Data Analyst' ,'US ', 'Full-Time'),(2,'Data Scientist' ,'UAE', 'Full-Time');

UPDATE job_title SET  job_name='Data Engineer' WHERE job_id=1;

 SELECT * FROM job_title; 

DELETE FROM job_title WHERE job_id=1;


ALTER TABLE job_title ADD email VARCHAR(50);


UPDATE job_title  SET email = CASE job_id 
WHEN 1 THEN 'mnanismi@gmail.com'
WHEN 2 THEN 'nismi@gmail.com'
END 
WHERE  job_id IN (1,2);

ALTER TABLE job_title DROP COLUMN email;