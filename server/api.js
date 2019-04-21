var express = require('express');
var app = express();
var mysql = require('mysql');
var pool = mysql.createPool({
    user: 'team_14',
    host: 'eecslab-9.case.edu',
    database: 'team_14',
    port: 3306,
    password: 'b3e84b91'
});

app.use(function(req, res, next) {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
    next();
});

app.get('/', (req, res) => {
    pool.query('SELECT * FROM Users', (err, resultsSet) => {
        res.json(resultsSet);
    });
});

/**
 * return list of all recipes
 */
app.get('/recipe', (req, res) => {
    pool.query('SELECT * FROM Recipes', (err, resultsSet) => {
        res.json(resultsSet);
    });
});

/**
 * get all recipes from a specified user
 */
app.get('/recipe/:authorId', (req, res) => {
    pool.query('SELECT * FROM Recipes WHERE author_id = ${authorId}', (err, resultsSet) => {
        res.json(resultsSet);
    });
});

/**
 * gets user by email
 */
app.get('/auth/:userId', (req, res) => {
    pool.query('SELECT * FROM Users WHERE email = ' + req.params.userId, (err, resultsSet) => {
        res.json(resultsSet);
        console.log(resultsSet);
    });
});

/**
 * retrieve a JSON object containing a Recipe and list of Steps
 */
app.get('/recipe/:id', (req, res) => {});

app.listen(3000, () => {
    console.log('Server running on http://localhost:3000');
});
