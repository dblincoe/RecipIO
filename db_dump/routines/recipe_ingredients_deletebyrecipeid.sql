DELIMITER ;;
CREATE PROCEDURE RecipesIngredients_DELETE_byRecipeId
(
	IN vrecipe_id INT
)
BEGIN 
	DELETE FROM RecipeIngredients
    WHERE recipe_id = vrecipe_id;
END;;
