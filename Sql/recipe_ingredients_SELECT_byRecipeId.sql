DELIMITER ;;
CREATE PROCEDURE RecipesIngredients_SELECT_byrecipe
(
	IN vrecipe_id INT
)
BEGIN
	SELECT 
    i.id
    , i.ingredient_name
    , ri.amount_text
    FROM RecipeIngredients ri
		INNER JOIN Ingredients i
			ON ri.ingredient_id = i.id
    WHERE ri.recipe_id = vrecipe_id
    ORDER BY i.ingredient_name ASC;
END;;
