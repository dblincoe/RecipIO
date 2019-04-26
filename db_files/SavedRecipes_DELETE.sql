DROP PROCEDURE IF EXISTS SaveRecipes_DELETE;
DELIMITER ;;
CREATE PROCEDURE SavedRecipes_DELETE
(
	IN vrecipe_id INT,
    IN vuser_id INT
)
BEGIN
	DELETE FROM SavedRecipes
    WHERE recipe_id = vrecipe_id 
		AND vuser_id = vuser_id;
END