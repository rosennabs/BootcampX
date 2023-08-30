--Calculate the average total duration of assistance requests for each cohort
SELECT avg(total_duration) as average_total_duration --This is the main query
FROM ( --This is the subquery
SELECT cohorts.name as cohort, sum(completed_at - started_at) as total_duration
FROM assistance_requests
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
GROUP BY cohort
ORDER BY total_duration
) subquery;

--The above takes the result of the subquery and finds the total average in the main query