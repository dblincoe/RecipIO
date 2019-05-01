DELIMITER ;;
CREATE PROCEDURE Comments_INSERT
(IN vrecipe_id INT
, IN vuser_id INT
, IN vcomment_text VARCHAR(500)
)
BEGIN
	INSERT INTO Comments
    (
		recipe_id
        , user_id
        , comment_text
        , time_posted
    )
    VALUES
    (
		vrecipe_id
        , vuser_id
        , vcomment_text
        , NOW()
    );
END;;