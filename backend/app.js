const express = require('express');
const pool = require('./database'); 
const { comparePassword } = require('./auth'); 
const app = express();
const port = 3000;
const { printValue, printLog } = require('./print');

app.use(express.json());


app.get('/messageChannel',async(req,res)=>{
    
})

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
            console.log(printLog('->','r','401','User not found with : '),printValue('email', email),printValue('password', password))
            return res.status(401).json({ error: 'Invalid email or password' });
        }

        const hashedPassword = rows[0].hashed_password;
        const isMatch = await comparePassword(password, hashedPassword);

        if (isMatch) {
            console.log(printLog('->','g','200','Login request successful with : '),printValue('email', email),printValue('password',password))
            return res.status(200).json({ message: 'Login successful' });
        } else {
            // console.log(printLog('->','r','401','User not found with : '),printValue('email', email))
            return res.status(401).json({ error: 'Invalid email or password' });
        }
    } catch (err) {
        console.error('Error occurred:', err.message);
        return res.status(500).json({ error: 'Internal Server Error' });
    }
});

app.listen(port, () => {
    console.log(`\n\n\t\t\x1b[37m[⚡️] Gradsy server has started on \x1b[36mhttp://localhost:${port}\n\x1b[37m`);
});
