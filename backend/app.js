const express = require('express');
const pool = require('./database'); 
const { comparePassword } = require('./auth'); 
const app = express();
const port = 3000;

app.use(express.json());

app.post('/login', async (req, res) => {
    const { email, password } = req.body;
   

    if (!email || !password) {
        console.log("Missing email or password");
        return res.status(400).json({ error: 'Email and password are required' });
    }

    try {
        const query = 'SELECT hashed_password FROM users WHERE email = $1';
        const { rows } = await pool.query(query, [email]);

        if (rows.length === 0) {
            console.log("No user found with this email");
            return res.status(401).json({ error: 'Invalid email or password' });
        }

        const hashedPassword = rows[0].hashed_password;
        const isMatch = await comparePassword(password, hashedPassword);

        if (isMatch) {
            console.log("Login Request Successful ✅ \nuser: ", email, "\n password: ", password);
            return res.status(200).json({ message: 'Login successful' });
        } else {
            console.log("Login Request Denied to user: ", email, " password: ", password);
            return res.status(401).json({ error: 'Invalid email or password' });
        }
    } catch (err) {
        console.error('Error occurred:', err.message);
        return res.status(500).json({ error: 'Internal Server Error' });
    }
});

app.listen(port, () => {

    console.log(`\n [] Server has started on http://localhost:${port}\n`);

});
