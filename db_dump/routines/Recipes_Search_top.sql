DELIMITER ;;
DROP PROCEDURE IF EXISTS Recipes_SELECT_top;
CREATE PROCEDURE Recipes_SELECT_top 
(
IN vuser_id INT
)
BEGIN
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
	INNER JOIN Users u
			ON r.author_id = u.id
	ORDER BY r.vote_score DESC;
    
END;;