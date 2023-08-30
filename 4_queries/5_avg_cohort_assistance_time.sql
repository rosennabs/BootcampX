--Get the average duration of assistance requests for each cohort
SELECT cohorts.name, avg(completed_at - started_at) as average_assistance_time
FROM students
JOIN cohorts ON cohorts.id = cohort_id
JOIN assistance_requests ON student_id = students.id
GROUP BY cohorts.name
ORDER BY average_assistance_request_duration;
