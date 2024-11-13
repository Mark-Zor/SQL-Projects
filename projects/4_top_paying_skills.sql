/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analsyt positions
- Focuses on roles with specified slaaries, regardess of location
- Why? it reveals how different skills impact salary levels for Data Analysts and
    helps indetidy the most financially rewardsing skills to acquire or improve
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' 
    AND salary_year_avg IS NOT NULL
    -- job_location = 'Dallas, TX'
GROUP BY
    skills
ORDER BY 
    avg_salary DESC
LIMIT 25

/* 
High-Paying, Niche Skills: Tools like SVN and Solidity command top salaries, 
with SVN reaching around $400,000 and Solidity at $179,000, highlighting their specialized demand.

Popular Data & ML Frameworks: DataRobot, MXNet, Keras, TensorFlow, and 
PyTorch are sought after for machine learning roles, with average salaries around $120,000–$155,000.

Cloud & Collaboration Tools: Terraform, VMware, and GitLab reflect a need for cloud infrastructure 
and version control skills, each averaging above $130,000.
*/
