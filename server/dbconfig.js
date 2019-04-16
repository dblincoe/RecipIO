import { Pool } from 'mysql';

const connectionPool = new Pool({
	user: 'abc123',
	database: 'group14',
	port: 3306,
	password: 'password'
});

export default connectionPool;
