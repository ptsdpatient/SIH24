const express = require('express');
const pool = require('./database'); 
const { comparePassword } = require('./auth'); 
const app = express();
const port = 3000;
const { printValue, printLog } = require('./print');
const cors = require('cors')
const jwt = require('jsonwebtoken');
const secretKey='hellomyfriendjohndoe'

app.use(express.json());
app.use(cors())



app.get('/authenticateToken',(req,res)=>{
    const authHeader = req.headers['authorization'];
    const token = authHeader && authHeader.split(' ')[1]; 
    console.log("authenticating")
    if (!token) {
      return res.status(401).json({ error: 'Token is required' });
    }
    console.log(printLog('->','g','200','Token is valid'),printValue('user',user))

    jwt.verify(token, secretKey, (err, user) => {
      if (err) {
        return res.status(403).json({ error: 'Invalid token' });
      }
  
      console.log(printLog('->','g','200','Token is valid'),printValue('user',user))

    });
})


app.post('/login', async (req, res) => {
    const { email, password } = req.body;
   

    if (!email || !password) {
        console.log(printLog('->','r','400','Missing email or password'))
        return res.status(400).json({ error: 'Email and password are required' });
    }

    try {

        const {rows} = await pool.query('SELECT id, hashed_password FROM users WHERE email = $1',[email])

        if (rows.length === 0) {
            console.log(printLog('->','r','401','User not found with : '),printValue('email', email),printValue('password', password))
            return res.status(401).json({ error: 'Invalid email or password' });
        }

        const hashedPassword = rows[0].hashed_password;
        const isMatch = await comparePassword(password, hashedPassword);

        if (isMatch) {
            const token = jwt.sign({ userId: rows[0].id }, secretKey, { expiresIn: '2h' });
            const userInfo = await pool.query('SELECT * FROM users WHERE id = $1', [rows[0].id]);
            console.log(printLog('->','g','200','Login request successful with : '),printValue('email', email),printValue('password',password))
            return res.status(200).json({user:userInfo.rows[0],token:token});
        } else {
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
