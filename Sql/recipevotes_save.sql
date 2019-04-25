DELIMITER ;;
CREATE PROCEDURE RecipeVotes_SAVE
(IN vrecipe_id INT
, IN vuser_id INT
, IN visUpvote BIT
)
BEGIN
	DECLARE vCurrentVote BIT;
    SET vCurrentVote = 
	(
		SELECT vote_value 
        FROM RecipeVotes 
        WHERE vrecipe_id = recipe_id
			AND user_id = vuser_id
	);
	IF vCurrentVote IS NULL
    THEN
		INSERT INTO RecipeVotes
        (
			recipe_id
			, user_id
            , vote_value
        )
        VALUES
        (
			vrecipe_id
            , vuser_id
            , visUpvote
        )
    ;
    ELSEIF vCurrentVote = visUpvote
    THEN
		DELETE FROM RecipeVotes WHERE vrecipe_id = recipe_id AND user_id = vuser_id
    ;
    ELSE
		UPDATE RecipeVotes
        SET vote_value = visUpvote
        WHERE vrecipe_id = recipe_id AND user_id = vuser_id
	;
    END IF
    ;
END;;