import { Router } from 'express';
import connectionPool from '../dbconfig';
const router = Router();

/**
 * return all recipes
 */
router.get('/recipe', (req, res) => {
    connectionPool.query('getRecipes()');
});

/**
 * get all recipes
 */
router.get('/recipe/:userId', (req, res) => {
    connectionPool.query('');
});

/**
 * retrieve a recipe with the specified id
 */
router.get('/recipe/:id', (req, res) => {
    connectionPool.query('');
});

/**
 * retrieve the steps for a recipe with the specified id
 */
router.get('/recipe/:id/steps', (req, res) => {
    connectionPool.query('');
});

/**
 * get the rating for a recipe with a specified id
 */
router.get('/recipe/:id/rating', (req, res) => {
    connectionPool.query('');
});

/**
 * get a list of comments associated with a recipe with a specified id
 */
router.get('/recipe/:id/comments', (req, res) => {
    connectionPool.query('');
});

/**
 * return
 */
export default router;
