--Get the total number of assistance_requests for a teacher
SELECT teachers.name, count(assistance_requests.*) as total_assistance
FROM teachers
JOIN assistance_requests ON teachers.id = teacher_id
WHERE name = 'Waylon Boehm'
GROUP BY teachers.name;