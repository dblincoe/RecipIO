DELIMITER ;;
CREATE PROCEDURE CommentVotes_SAVE
(IN vcomment_id INT
, IN vuser_id INT
, IN visUpvote BIT
)
BEGIN
	DECLARE vCurrentVote BIT;
    SET vCurrentVote = 
	(
		SELECT vote_value 
        FROM CommentVotes 
        WHERE vcomment_id = comment_id
			AND user_id = vuser_id
	);
	IF vCurrentVote IS NULL
    THEN
		INSERT INTO CommentVotes
        (
			comment_id
			, user_id
            , vote_value
        )
        VALUES
        (
			vcomment_id
            , vuser_id
            , visUpvote
        )
    ;
    ELSEIF vCurrentVote = visUpvote
    THEN
		DELETE FROM CommentVotes WHERE vcomment_id = comment_id AND user_id = vuser_id
    ;
    ELSE
		UPDATE CommentVotes
        SET vote_value = visUpvote
        WHERE vcomment_id = comment_id AND user_id = vuser_id
	;
    END IF
    ;
END;;