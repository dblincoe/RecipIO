DELIMITER ;;
CREATE PROCEDURE RecipeTags_INSERT
(IN vrecipe_id INT
, IN vtag_id INT
)
BEGIN
	IF NOT EXISTS (SELECT 1 FROM RecipeTags WHERE recipe_id = vrecipe_id AND vtag_id = tag_id)
    THEN
		INSERT INTO RecipeTags
		(
			recipe_id
			, tag_id
		)
		VALUES
		(
			vrecipe_id
			, vtag_id
		);
	END IF;
END;;