import { Pool } from 'mysql';

const connectionPool = new Pool({
	user: 'team_14',
	database: 'team_14',
	port: 3306,
	password: 'b3e84b91'
});

export default connectionPool;
