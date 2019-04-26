DELIMITER ;;
DROP PROCEDURE IF EXISTS Recipes_SELECT_top;
CREATE PROCEDURE Recipes_SELECT_top 
(
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
	FROM RecipesWithVotes r
	INNER JOIN Users u
			ON r.author_id = u.id
	ORDER BY r.vote_score DESC;
    
END;;