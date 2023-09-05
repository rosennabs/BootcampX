// Connect to the bootcampx database
const { Pool } = require('pg');

const pool = new Pool({
  user: 'rosennabs',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});


//Get students' data using parameterized query to prevent SQL injection

const queryString = `
SELECT students.id, students.name, cohorts.name as cohort_name
FROM students
JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name LIKE $1
LIMIT $2;
`;

const cohortName = process.argv[2];
const limit = process.argv[3] || 5; //default to limit 5 if limit is not provided by user

// Store all potentially malicious values in an array.
const values = [`%${cohortName}%`, limit];

pool.query(queryString, values)

.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.name} has an id of ${user.id} and was in the ${user.cohort_name} cohort`);
  })

}).catch(err => console.error('query error', err.stack));

