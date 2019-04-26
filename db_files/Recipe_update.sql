DELIMITER ;;
-- This procedure no longer exists.
CREATE PROCEDURE Recipes_UPDATE
(
	IN vid INT
	, IN vtitle VARCHAR(150)
    , IN vdescription text
    , IN vauthor_id INT
)
BEGIN 
	UPDATE Recipes
    SET 
		title = vtitle
        , description = vdescription
		, time_created = NOW()
        , author_id = vauthor_id
	WHERE
		id = vid;
END;;
