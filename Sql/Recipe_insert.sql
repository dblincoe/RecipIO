DELIMITER ;;
CREATE PROCEDURE Recipes_INSERT
(
	IN vtitle VARCHAR(150)
    , IN vdescription text
    , IN vauthor_id INT
)
BEGIN 
	INSERT INTO Recipes
    (
		title
        , description
        , time_created
        , author_id
    )
    VALUES
    (
		vtitle
        , vdescription
		, NOW()
        , vauthor_id
    );
    SELECT LAST_INSERT_ID() AS newID;
END;;
