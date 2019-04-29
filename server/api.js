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

var debug = true;
var fakeAPI = debug ? '/api' : '';

/**
 * allow XSS for separate API functionality
 */
if (debug) {
    app.use(function(req, res, next) {
        res.header('Access-Control-Allow-Origin', '*');
        res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
        next();
    });
}

app.get(fakeAPI + '/', (req, res) => {
    pool.query('SELECT * FROM Users', (err, resultsSet) => {
        res.json(resultsSet);
    });
});

/**
 * get a list of all tags
 */
app.get(fakeAPI + '/tag', (req, res) => {
    pool.query('CALL Tags_SELECT()', (err, resultsSet) => {
        res.json(resultsSet[0]);
    });
});

/**
 * insert a tag with a given name -- will ignore duplicates
 */
app.get(fakeAPI + '/tag/insert/:name', (req, res) => {
    pool.query(`CALL Recipes_INSERT('${req.params.name}')`, (err, resultsSet) => {
        res.json(resultsSet[0]);
    });
});

/**
 * select
 */
app.get(fakeAPI + '/recipeTag/:recipeId', (req, res) => {
    pool.query(`CALL RecipeTags_SELECT(${req.params.recipeId})`, (err, resultsSet) => {
        res.json(resultsSet[0]);
    });
});

/**
 * return list of all recipes
 */
app.get(fakeAPI + '/recipe', (req, res) => {
    pool.query('SELECT * FROM RecipesWithVotes', (err, resultsSet) => {
        res.json(resultsSet);
    });
});

/**
 * return list of all recipes by a specific user
 */
app.get(fakeAPI + '/recipe/user/:userId', (req, res) => {
    pool.query(`CALL Recipes_SELECT_byuser(${req.params.userId},${req.params.userId})`, (err, resultsSet) => {
        res.json(resultsSet[0]);
    });
});

/**
 * Select steps for a recipeId
 */
app.get(fakeAPI + '/recipe/:id/steps', (req, res) => {
    pool.query(`CALL RecipeSteps_SELECT(${req.params.id})`, (err, resultsSet) => {
        res.json(resultsSet[0]);
    });
});

/**
 * Select steps for a recipeId
 */
app.get(fakeAPI + '/recipe/:id/views', (req, res) => {
    pool.query(`SELECT view_count FROM PageViews WHERE recipe_id = (${req.params.id})`, (err, resultsSet) => {
        res.json(resultsSet);
    });
});

/**
 * Select steps for a recipeId
 */
app.get(fakeAPI + '/recipe/:id/ingredients', (req, res) => {
    pool.query(`CALL Ingredients_SELECT_by_recipe (${req.params.id})`, (err, resultsSet) => {
        res.json(resultsSet[0]);
    });
});

/**
 * Checks votes for a recipe
 */
app.get(fakeAPI + '/recipe/:recipeId/voteCount', (req, res) => {
    pool.query(`CALL RecipeVotes_SELECT(${req.params.recipeId})`, (err, resultsSet) => {
        res.json(resultsSet[0]);
    });
});

/**
 * Checks user vote on a recipe
 */
app.get(fakeAPI + '/recipe/:recipeId/:userId/vote', (req, res) => {
    pool.query(
        `SELECT IFNULL((
            SELECT vote_value
            FROM RecipeVotes
            WHERE recipe_id = ${req.params.recipeId}
            AND user_id = ${req.params.userId}),0) AS vote_value`,
        (err, resultsSet) => {
            res.json(resultsSet[0]);
        }
    );
});

/**
 * Votes on a recipe
 */
app.get(fakeAPI + '/recipe/:recipeId/:userId/:vote', (req, res) => {
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
app.get(fakeAPI + '/recipe/:recipeId/view', (req, res) => {
    pool.query(`CALL PageView_INSERT(${req.params.recipeId})`, (err, resultsSet) => {
        res.json(resultsSet);
    });
});

/**
 * Select all comments based on recipeId
 */
app.get(fakeAPI + '/comment/select/:recipeId/:userId', (req, res) => {
    pool.query(`CALL Comments_SELECT_by_recipe(${req.params.recipeId},${req.params.userId})`, (err, resultsSet) => {
        res.json(resultsSet[0]);
    });
});

/**
 * Delete comment
 */
app.get(fakeAPI + '/comment/delete/:id', (req, res) => {
    pool.query(`CALL Comments_DELETE(${req.params.id})`, (err, resultsSet) => {
        res.json(resultsSet[0]);
    });
});

/**
 * Updated unique comment
 */
app.get(fakeAPI + '/comment/update/:id/:text', (req, res) => {
    pool.query(`CALL Comments_UPDATE(${req.params.id},${req.params.text})`, (err, resultsSet) => {
        res.json(resultsSet[0]);
    });
});

/**
 * Insert new comment
 */
app.get(fakeAPI + '/comment/insert/:recipeId/:userId/:text', (req, res) => {
    pool.query(
        `CALL Comments_INSERT(${req.params.recipeId},${req.params.userId},${req.params.text})`,
        (err, resultsSet) => {
            res.json(resultsSet[0]);
        }
    );
});

/**
 * Checks votes for a comment
 */
app.get(fakeAPI + '/comment/voteCount/:commentId', (req, res) => {
    pool.query(`CALL CommentVotes_SELECT(${req.params.commentId})`, (err, resultsSet) => {
        res.json(resultsSet[0]);
    });
});

/**
 * Votes on a comment
 */
app.get(fakeAPI + '/comment/:commentId/:userId/:vote', (req, res) => {
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
app.get(fakeAPI + '/user/:userId', (req, res) => {
    pool.query(`SELECT * FROM Users WHERE id = ${req.params.userId}`, (err, resultsSet) => {
        res.json(resultsSet);
    });
});

/**
 * Save a recipe to a user's personal list
 */
app.get(fakeAPI + '/user/save/:userId/:recipeId/', (req, res) => {
    pool.query(`CALL SavedRecipes_SAVE(${req.params.recipeId}, ${req.params.userId})`, (err, resultsSet) => {
        res.json(resultsSet[0][0]);
    });
});

/**
 * Save a recipe to a user's personal list
 */
app.get(fakeAPI + '/user/save/:userId/:recipeId/check', (req, res) => {
    pool.query(`CALL SavedRecipes_isSaved(${req.params.recipeId}, ${req.params.userId})`, (err, resultsSet) => {
        res.json(resultsSet[0][0]);
    });
});

/**
 * Get a user's saved recipes
 */
app.get(fakeAPI + '/user/save/:userId', (req, res) => {
    pool.query(`CALL SavedRecipes_SELECT(${req.params.userId})`, (err, resultsSet) => {
        res.json(resultsSet[0]);
    });
});

/**
 * Checks that an email is unique
 */
app.get(fakeAPI + '/register/:userEmail', (req, res) => {
    pool.query(`CALL User_check_email('${req.params.userEmail}')`, (err, resultsSet) => {
        res.json(resultsSet[0]);
    });
});

/**
 * Inserts a new user
 */
app.get(fakeAPI + '/register/:userName/:userEmail/:userPassword', (req, res) => {
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
app.get(fakeAPI + '/auth/:userEmail/:userPassword', (req, res) => {
    pool.query(`CALL User_authenticate('${req.params.userEmail}', '${req.params.userPassword}')`, (err, resultsSet) => {
        res.json(resultsSet[0]);
    });
});

if (debug) {
    const port = 3000;
    app.listen(port, () => {
        console.log(`Server running on http://localhost:${port}`);
    });
}

module.exports = app;
