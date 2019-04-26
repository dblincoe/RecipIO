DELIMITER ;;
CREATE PROCEDURE RecipesIngredients_INSERT
(
	IN vrecipe_id INT
    , IN vingredient_id INT
    , IN vamount_text VARCHAR(100)
)
BEGIN 
	INSERT INTO RecipesIngredients
    (
		recipe_id
        , ingredient_id
		, amountText
    )
    VALUES
    (
		vrecipe_id
        , vingredient_id
        , vamount_text
    );
END;;
