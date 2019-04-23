var express = require('express');
var app = express();
var mysql = require('mysql');

/**
 * database connection info
 */
var pool = mysql.createPool({
    user: 'team_14',
    host: 'eecslab-9.case.edu',
    database: 'team_14',
    port: 3306,
    password: 'b3e84b91'
});

/**
 * allow XSS for separate API functionality
 * TODO: DISABLE THIS FOR ACTUAL PRODUCTION
 */
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
 * Select steps for a recipeId
 */
app.get('/recipe/:id/steps', (req, res) => {
    pool.query(`CALL RecipeSteps_SELECT(${req.params.id})`, (err, resultsSet) => {
        res.json(resultsSet[0]);
        console.log(resultsSet[0]);
    });
});

/**
 * Select steps for a recipeId
 */
app.get('/recipe/:id/votes', (req, res) => {
    pool.query(`CALL RecipeSteps_SELECT(${req.params.id})`, (err, resultsSet) => {
        res.json(resultsSet[0]);
    });
});

/**
 * Select steps for a recipeId
 */
app.get('/recipe/:id/views', (req, res) => {
    pool.query(`SELECT view_count FROM PageViews WHERE recipe_id = (${req.params.id})`, (err, resultsSet) => {
        res.json(resultsSet);
    });
});

/**
 * Select steps for a recipeId
 */
app.get('/recipe/:id/ingredients', (req, res) => {
    pool.query(
        `SELECT * FROM Ingredients i
    INNER JOIN RecipeIngredients ri ON ri.ingredient_id = i.id
    WHERE recipe_id = ${req.params.id}`,
        (err, resultsSet) => {
            res.json(resultsSet);
        }
    );
});

/**
 * Votes on a recipe
 */
app.get('/recipe/:recipeId/:userId/:vote', (req, res) => {
    console.log(`CALL RecipeVotes_SAVE(${req.params.recipeId}, ${req.params.userId}, ${req.params.vote})`);
    pool.query(
        `CALL RecipeVotes_SAVE(${req.params.recipeId}, ${req.params.userId}, ${req.params.vote})`,
        (err, resultsSet) => {
            res.json(resultsSet);
        }
    );
});

/**
 * Select a specific user
 */
app.get('/user/:userId', (req, res) => {
    pool.query(`SELECT * FROM Users WHERE id = ${req.params.userId}`, (err, resultsSet) => {
        res.json(resultsSet);
    });
});

/**
 * Select a specific user
 */
app.get('/user/:id/savedRecipes', (req, res) => {
    pool.query(
        `SELECT * FROM SavedRecipes sr
    INNER JOIN Recipes r ON sr.recipe_id = r.id
    WHERE sr.user_id = ${req.params.id}`,
        (err, resultsSet) => {
            res.json(resultsSet);
        }
    );
});

/**
 * Authorizes a user
 */
app.get('/auth/:userEmail/:userPassword', (req, res) => {
    pool.query(`CALL User_authenticate('${req.params.userEmail}', '${req.params.userPassword}')`, (err, resultsSet) => {
        res.json(resultsSet[0]);
    });
});

/**
 * Checks that an email is unique
 */
app.get('/register/:userEmail', (req, res) => {
    pool.query(`CALL User_check_email('${req.params.userEmail}')`, (err, resultsSet) => {
        res.json(resultsSet[0]);
    });
});

/**
 * Inserts a new user
 */
app.get('/register/:userName/:userEmail/:userPassword', (req, res) => {
    pool.query(
        `CALL User_INSERT('${req.params.userName}', '${req.params.userEmail}', '${req.params.userPassword}')`,
        (err, resultsSet) => {
            res.json(resultsSet);
        }
    );
});

app.listen(3000, () => {
    console.log('Server running on http://localhost:3000');
});
