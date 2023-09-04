// Connect to the bootcampx database
const { Pool } = require('pg');

const pool = new Pool({
  user: 'rosennabs',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});




//Get the name of all teachers that performed an assistance request during a cohort
pool.query(`
SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
FROM assistance_requests
JOIN teachers ON teachers.id = teacher_id
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name LIKE '%${process.argv[2]}%'
ORDER BY teacher;
`)
  
  .then(res => {

  res.rows.forEach(user => {
    console.log(`${user.teacher} assisted the ${user.cohort} cohort`);
  })

}).catch(err => console.error('query error', err.stack));