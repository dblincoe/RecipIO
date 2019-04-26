DELIMITER ;;
CREATE PROCEDURE RecipesSteps_DELETE_byIDafter
(
	IN vrecipe_id INT
    , IN vmax_step_num INT
)
BEGIN
	DELETE FROM RecipeSteps
    WHERE recipe_id = vrecipe_id 
		AND step_num > vmax_step_num;
END;;
