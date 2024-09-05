const { Pool } = require('pg');

const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'gradsy',
    password: 'sus',
    port: 5432, 
});

module.exports = pool;
