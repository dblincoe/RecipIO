import { Router } from 'express';
import connectionPool from '../dbconfig';
const router = Router();

/**
 * return list of all recipes
 */
router.get('/recipe', (req, res) => {
    connectionPool.query('getRecipes()');
});

/**
 * get all recipes from a specified user
 */
router.get('/recipe/:userId', (req, res) => {
    connectionPool.query('');
});

/**
 * retrieve a JSON object containing a Recipe and list of Steps
 */
router.get('/recipe/:id', (req, res) => {
    connectionPool.query('');
    res.send();
});

/**
 * return
 */
export default router;
