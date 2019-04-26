DELIMITER ;;
DROP PROCEDURE IF EXISTS Recipes_Search_byingredients;
CREATE PROCEDURE Recipes_Search_byingredients 
(
IN vrecipeids VARCHAR(500)
)
BEGIN
	DECLARE remainingIds VARCHAR(500);
    
    SELECT vrecipeids;
    
    SET remainingIds = vrecipeids;
    DROP TABLE IF EXISTS query_recipe_ingredients;
	CREATE TEMPORARY TABLE query_recipe_ingredients SELECT id FROM Recipes LIMIT 0;
    parseloop: LOOP
		IF remainingIds = ''
        THEN 
			LEAVE parseloop;
		END IF;
        
		INSERT INTO query_recipe_ingredients (id) VALUES (
			SUBSTRING_INDEX(remainingIds, ',', -1)
		);
        SET remainingIds = LEFT(remainingIds
								, LENGTH(remainingIds)
                                - LENGTH(SUBSTRING_INDEX(remainingIds, ',', -1))
                                - 1);
	END LOOP parseloop;
    -- SELECT * FROM query_recipe_ingredients;
    -- Done building temp table, run actual query
	SELECT
		r.id
        , r.title
        , r.description
        , r.time_created
        , r.author_id
        , u.user_name
        , r.vote_score
	FROM RecipesWithVotes r
	INNER JOIN RecipeIngredients i
		ON r.id = i.recipe_id
	RIGHT OUTER JOIN query_recipe_ingredients q
		ON i.ingredient_id = q.id
	INNER JOIN Users u
			ON r.auther_id = u.id
    GROUP BY r.id, r.title, r.description, r.time_created, r.author_id, u.user_name, r.vote_score
    ORDER BY 2 * COUNT(q.id) - COUNT(i.ingredient_id) DESC, r.vote_score DESC;
END;;