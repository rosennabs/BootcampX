--Select a list of all of the students that haven't added their Github username to their account yet
SELECT id, name, email, cohort_id 
FROM students
WHERE github IS NULL
ORDER BY cohort_id

--Note: In SQL, the order of clauses in a SELECT statement generally follows this sequence:
--SELECT--FROM--WHERE--GROUP BY--HAVING--ORDER BY--LIMIT