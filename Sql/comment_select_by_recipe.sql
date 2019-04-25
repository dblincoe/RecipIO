DELIMITER ;;
CREATE PROCEDURE Comments_SELECT_by_recipe
(IN vrecipe_id INT
)
BEGIN
	SELECT 
		c.id
        , c.recipe_id
        , c.user_id
        , u.user_name
        , c.time_posted
        , c.comment_text
        , c.vote_score
	FROM Comments c
	INNER JOIN Users u
		ON u.id = c.user_id
	WHERE
		c.recipe_id = vrecipe_id
	ORDER BY c.vote_score DESC
    ;
END;;