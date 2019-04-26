DELIMITER ;;
CREATE PROCEDURE RecipesSteps_SELECT_byrecipe
(
	IN vrecipe_id INT
)
BEGIN
	SELECT 
    s.step_num
    , s.step_text
    FROM RecipeSteps s
    WHERE s.recipe_id = vrecipe_id
    ORDER BY s.step_num ASC;
END;;
