DROP PROCEDURE IF EXISTS Recipes_SELECT_bytags;
DELIMITER ;;
CREATE PROCEDURE Recipes_SELECT_bytags
(
IN vtagids VARCHAR(500)
, IN vuser_id INT
)
BEGIN
	DECLARE remainingIds VARCHAR(500);
    
    -- SELECT vrecipeids;
    
    SET remainingIds = vtagids;
    DROP TABLE IF EXISTS query_recipe_tags;
	CREATE TEMPORARY TABLE query_recipe_tags SELECT id FROM Tags LIMIT 0;
    parseloop: LOOP
		IF remainingIds = ''
        THEN 
			LEAVE parseloop;
		END IF;
        
		INSERT INTO query_recipe_tags (id) VALUES (
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
        , IFNULL
			(
            (SELECT rv.vote_value FROM RecipeVotes rv WHERE rv.recipe_id = r.id AND rv.user_id = vuser_id)
            , 0) AS userVote
	FROM RecipesWithVotes r
	INNER JOIN RecipeTags t
		ON r.id = t.recipe_id
	LEFT OUTER JOIN query_recipe_tags q
		ON t.tag_id = q.id
	INNER JOIN Users u
			ON r.auther_id = u.id
    GROUP BY r.id, r.title, r.description, r.time_created, r.author_id, u.user_name, r.vote_score
    ORDER BY COUNT(q.id) DESC, r.vote_score DESC;
END;;