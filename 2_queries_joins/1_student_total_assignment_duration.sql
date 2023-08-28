--Get the total amount of time that a student has spent on all assignments
SELECT SUM(assignment_submissions.duration) as total_duration
FROM students JOIN assignment_submissions ON student_id = students.id 
WHERE name = 'Ibrahim Schimmel';