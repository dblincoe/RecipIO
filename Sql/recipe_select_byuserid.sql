DELIMITER ;;
CREATE PROCEDURE Recipes_SELECT_byuser
(
	IN vuserid INT
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
	FROM
		RecipesWithVotes r
		INNER JOIN Users u
			ON r.auther_id = u.id
            AND u.id = vuserid
	ORDER BY r.time_created DESC;
END
