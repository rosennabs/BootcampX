--Get the names of all students in cohort 11
SELECT id,name
FROM students
WHERE cohort_id=11
ORDER BY name;
