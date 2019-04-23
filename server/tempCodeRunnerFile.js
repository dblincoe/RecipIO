
/**
 * Select viewcount for a recipe
 */
app.get('/recipe/:id/views', (req, res) => {
    pool.query(`SELECT view_count FROM PageViews WHERE recipe_id = (${req.params.id})`, (err, resultsSet) => {
        res.json(resultsSet);
    });
});