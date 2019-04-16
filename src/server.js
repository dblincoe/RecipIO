// Get dependencies
import express, { static } from 'express';
import { join } from 'path';
import { createServer } from 'http';
import { json, urlencoded } from 'body-parser';

// Get our API routes
import { api } from './server/routes/api';

const app = express();

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
 * Get port from environment and store in Express.
 */
const port = process.env.PORT || '3000';
app.set('port', port);

/**
 * Create HTTP server.
 */
const server = createServer(app);

/**
 * Listen on provided port, on all network interfaces.
 */
server.listen(port, () => console.log(`API running on localhost:${port}`));
