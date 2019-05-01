DROP PROCEDURE IF EXISTS SavedRecipes_SELECT;
DELIMITER ;;
CREATE DEFINER=`team_14`@`%` PROCEDURE `SavedRecipes_SELECT`(IN vuser_id int)
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
	INNER JOIN SavedRecipes s
		ON s.recipe_id = r.id
		AND s.user_id = vuser_id
	ORDER BY r.title ASC;
END