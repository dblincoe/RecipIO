DELIMITER ;;
CREATE PROCEDURE RecipesSteps_SAVE
(
	IN vrecipe_id INT
    , IN vstep_num INT
    , IN vstep_text VARCHAR(1500)
)
BEGIN
	IF EXISTS (
		SELECT 1 
        FROM RecipeSteps r 
        WHERE r.recipe_id = vrecipe_id 
			AND r.step_num = vstep_num)
	THEN
		UPDATE RecipeSteps
        SET step_text = vstep_text
        WHERE recipe_id = vrecipe_id 
			AND step_num = vstep_num;
    ELSE
		INSERT INTO RecipesSteps
		(
			recipe_id
			, step_num
			, step_text
		)
		VALUES
		(
			vrecipe_id
			, vstep_num
			, vstep_text
		);
	END IF;
END;;
