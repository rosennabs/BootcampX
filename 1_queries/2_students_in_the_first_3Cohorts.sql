--Select the total number of students in the first 3 cohorts
SELECT count(id)
FROM students
WHERE cohort_id IN (1, 2, 3);