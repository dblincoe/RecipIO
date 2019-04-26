DELIMITER ;;
CREATE PROCEDURE Ingredients_SELECT_prefix
(
	IN tomatch VARCHAR(50)
)
BEGIN 
	SELECT
		i.id
        , i.ingredient_name
	FROM
		Ingredients i
	WHERE LOWER(i.ingredient_name) LIKE CONCAT(LOWER(tomatch), '%'); 
END
