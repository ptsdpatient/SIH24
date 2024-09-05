const express = require('express');
const pool = require('./database'); 
const { hashPassword, comparePassword } = require('./auth'); 
const app = express();
const port = 3000;

app.use(express.json());



app.get('/users', async (req, res) => {
    console.log("get request")
    try {
        const result = await pool.query('SELECT * FROM users');
        res.json(result.rows);
    } catch (err) {
        console.error('Error executing query:', err.message);
        res.status(500).json({ error: 'Internal Server Error' });
    }
});


app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
});
