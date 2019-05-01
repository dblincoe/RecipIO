DROP PROCEDURE IF EXISTS Recipes_SELECT_byuser;
DELIMITER ;;
CREATE PROCEDURE Recipes_SELECT_byuser
(
	IN vqueryUser INT
	, IN vuserid INT
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
	FROM
		RecipesWithVotes r
		INNER JOIN Users u
			ON r.auther_id = u.id
            AND u.id = vqueryUser
	ORDER BY r.time_created DESC;
END
-- Error Code: 1304. PROCEDURE Recipes_SELECT_byuser already exists
