const express = require('express');
const sqlite3 = require('sqlite3').verbose();
const bodyParser = require('body-parser');
const fs = require('fs');
const path = require('path');
const app = express();

// Middleware
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Initialize and set up the database
const dbFile = path.join(__dirname, 'gradsy.db');
const dbExists = fs.existsSync(dbFile);

const db = new sqlite3.Database(dbFile, (err) => {
  if (err) {
    console.error('Error opening database', err.message);
  } else {
    console.log('Connected to SQLite database.');
  }
});

// Create table if it doesn't exist
if (!dbExists) {
  db.serialize(() => {
    db.exec('schema.sql', (err) => {
      if (err) {
        console.error('Error creating table', err.message);
      } else {
        console.log('Table created or already exists.');
      }
    });
  });
}

// GET route to fetch all profiles
app.get('/profiles', (req, res) => {
  db.all('SELECT * FROM profiles', (err, rows) => {
    if (err) {
      res.status(500).json({ error: err.message });
      return;
    }
    res.json(rows);
  });
});

// POST route to create a new profile
app.post('/profiles', (req, res) => {
  const { name, email } = req.body;

  if (!name || !email) {
    res.status(400).json({ error: 'Name and email are required' });
    return;
  }

  db.run('INSERT INTO profiles (name, email) VALUES (?, ?)', [name, email], function (err) {
    if (err) {
      res.status(500).json({ error: err.message });
      return;
    }
    res.status(201).json({ id: this.lastID, name, email });
  });
});

// Start server
const port = 3000;
app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});
