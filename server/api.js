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
 * insert a tag with a given name -- will ignore duplicates
 */
app.get('/tag/:name', (req, res) => {
    pool.query(`CALL Recipes_INSERT('${req.params.name}')`, (err, resultsSet) => {
        res.json(resultsSet[0].name);
    });
});

/**
 * get a list of all tags
 */
app.get('/tag', (req, res) => {
    pool.query('CALL Tags_SELECT()', (err, resultsSet) => {
        const tags = [];
        for (let x in resultsSet[0]) {
            tags.push(x.name);
        }

        res.json(resultsSet[0]);
    });
});

/**
 * return list of all recipes
 */
app.get('/recipe', (req, res) => {
    pool.query('CALL Recipes_SELECT()', (err, resultsSet) => {
        res.json(resultsSet[0]);
    });
});

/**
 * Select steps for a recipeId
 */
app.get('/recipe/:id/steps', (req, res) => {
    pool.query(`CALL RecipeSteps_SELECT(${req.params.id})`, (err, resultsSet) => {
        res.json(resultsSet[0]);
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
    pool.query(`CALL Ingredients_SELECT_by_recipe (${req.params.id})`, (err, resultsSet) => {
        res.json(resultsSet[0]);
    });
});

/**
 * Checks votes for a recipe
 */
app.get('/recipe/:recipeId/voteCount', (req, res) => {
    pool.query(`CALL RecipeVotes_SELECT(${req.params.recipeId})`, (err, resultsSet) => {
        res.json(resultsSet[0]);
    });
});

/**
 * Checks user vote on a recipe
 */
app.get('/recipe/:recipeId/:userId/vote', (req, res) => {
    pool.query(
        `SELECT vote_value
        FROM RecipeVotes
        WHERE recipe_id = ${req.params.recipeId}
        AND user_id = ${req.params.userId}`,
        (err, resultsSet) => {
            res.json(resultsSet[0]);
        }
    );
});

/**
 * Votes on a recipe
 */
app.get('/recipe/:recipeId/:userId/:vote', (req, res) => {
    pool.query(
        `CALL RecipeVotes_SAVE(${req.params.recipeId}, ${req.params.userId}, ${req.params.vote})`,
        (err, resultsSet) => {
            res.json(resultsSet);
        }
    );
});

/**
 * View a recipe
 */
app.get('/recipe/:recipeId/view', (req, res) => {
    pool.query(`CALL PageView_INSERT(${req.params.recipeId})`, (err, resultsSet) => {
        res.json(resultsSet);
    });
});

/**
 * Select all comments based on recipeId
 */
app.get('/comment/:recipeId', (req, res) => {
    pool.query(`CALL Comments_SELECT_by_recipe(${req.params.recipeId})`, (err, resultsSet) => {
        res.json(resultsSet[0]);
    });
});

/**
 * Checks votes for a comment
 */
app.get('/comment/:commentId/voteCount', (req, res) => {
    pool.query(`CALL CommentVotes_SELECT(${req.params.commentId})`, (err, resultsSet) => {
        res.json(resultsSet[0]);
    });
});

/**
 * Checks user vote on a comment
 */
app.get('/comment/:commentId/:userId/vote', (req, res) => {
    pool.query(
        `SELECT vote_value
        FROM CommentVotes
        WHERE comment_id = ${req.params.commentId}
        AND user_id = ${req.params.userId}`,
        (err, resultsSet) => {
            res.json(resultsSet[0]);
        }
    );
});

/**
 * Votes on a comment
 */
app.get('/comment/:commentId/:userId/:vote', (req, res) => {
    pool.query(
        `CALL CommentVotes_SAVE(${req.params.commentId}, ${req.params.userId}, ${req.params.vote})`,
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
 * Save a recipe to a user's personal list
 */
app.get('/user/save/:userId/:recipeId/', (req, res) => {
    pool.query(`CALL SavedRecipes_SAVE(${req.params.recipeId}, ${req.params.userId})`, (err, resultsSet) => {
        res.json(resultsSet[0][0]);
    });
});

/**
 * Save a recipe to a user's personal list
 */
app.get('/user/save/:userId/:recipeId/check', (req, res) => {
    pool.query(`CALL SavedRecipes_SELECT(${req.params.recipeId}, ${req.params.userId})`, (err, resultsSet) => {
        res.json(resultsSet[0][0]);
    });
});

/**
 * Get a user's saved recipes
 */
app.get('/user/save/:userId', (req, res) => {
    pool.query(
        `SELECT * FROM SavedRecipes sr
    INNER JOIN Recipes r ON sr.recipe_id = r.id
    WHERE sr.user_id = ${req.params.userId}`,
        (err, resultsSet) => {
            res.json(resultsSet);
        }
    );
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

/**
 * Authorizes a user
 */
app.get('/auth/:userEmail/:userPassword', (req, res) => {
    pool.query(`CALL User_authenticate('${req.params.userEmail}', '${req.params.userPassword}')`, (err, resultsSet) => {
        res.json(resultsSet[0]);
    });
});

app.listen(3000, () => {
    console.log('Server running on http://localhost:3000');
});
