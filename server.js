var express = require('express');
var bodyParser = require('body-parser');
var app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

var routes = require('./server/api')(app);

var server = app.listen(3000, function() {
    console.log('Listening on port %s...', server.address().port);
});

// Parsers for POST data
app.use(json());
app.use(urlencoded({ extended: false }));

// Point static path to dist
app.use(static(join(__dirname, 'dist')));

// Set our api routes
app.use('/api', api);

// Catch all other routes and return the index file
app.get('*', (req, res) => {
    res.sendFile(join(__dirname, 'dist/index.html'));
});

/**
 * Listen on provided port, on all network interfaces.
 */
server.listen(port, () => console.log(`API running on localhost:${port}`));
