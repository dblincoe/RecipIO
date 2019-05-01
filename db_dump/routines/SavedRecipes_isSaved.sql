-- DROP PROCEDURE IF EXISTS SaveRecipes_SELECT;
DELIMITER ;;
CREATE DEFINER=`team_14`@`%` PROCEDURE `SavedRecipes_isSaved`(IN vrecipe_id int, IN vuser_id int)
BEGIN
	SELECT EXISTS(
		SELECT 1
		FROM SavedRecipes
		 WHERE recipe_id = vrecipe_id
               AND user_id = vuser_id
	) AS is_saved;
    -- DECLARE IS_SAVED int;
    -- SET IS_SAVED =
    --        (SELECT 1
    --         FROM SavedRecipes
    --         WHERE recipe_id = vrecipe_id
    --           AND user_id = vuser_id);
    -- SELECT IFNULL(IS_SAVED, 0) as is_saved;
END