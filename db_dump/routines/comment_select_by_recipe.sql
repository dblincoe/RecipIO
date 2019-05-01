DROP PROCEDURE IF EXISTS Comments_SELECT_by_recipe;
DELIMITER ;;
CREATE PROCEDURE Comments_SELECT_by_recipe
(IN vrecipe_id INT
, IN vuser_id INT
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
        , IFNULL
			(
            (SELECT cv.vote_value FROM CommentVotes cv WHERE cv.comment_id = c.id AND cv.user_id = vuser_id)
            , 0) AS userVote
	FROM CommentsWithVotes c
	INNER JOIN Users u
		ON u.id = c.user_id
	WHERE
		c.recipe_id = vrecipe_id
	ORDER BY c.vote_score DESC
    ;
END;;
