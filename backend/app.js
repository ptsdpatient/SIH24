const express = require('express');
const pool = require('./database'); // Assuming your database configuration is in database.js
const app = express();

app.use(express.json());

app.get('/users', async (req, res) => {
    try {
        const result = await pool.query('SELECT * FROM users');
        res.json(result.rows);
    } catch (err) {
        console.error(err);
        res.status(500).send('Error retrieving users');
    }
});

app.listen(3000, () => {
    console.log('Server is running on http://localhost:3000');
});
