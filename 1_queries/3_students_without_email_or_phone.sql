--Get all of the students without an email or phone number
SELECT name, id, cohort_id
FROM students
WHERE email IS NULL 
OR phone IS NULL;