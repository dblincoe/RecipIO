DROP PROCEDURE IF EXISTS RecipeTags_DELETE;
DELIMITER ;;
CREATE PROCEDURE RecipeTags_DELETE
(
	IN vrecipe_id INT,
    IN vtag_id INT
)
BEGIN
	DELETE FROM RecipeTags
    WHERE recipe_id = vrecipe_id 
		AND vtag_id = vtag_id;
END