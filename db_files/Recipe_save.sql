DELIMITER ;;
DROP PROCEDURE IF EXISTS Recipes_INSERT;
DROP PROCEDURE IF EXISTS Recipes_UPDATE;

CREATE PROCEDURE Recipes_SAVE
(
	IN vid INT -- -1 for insert
	, IN vtitle VARCHAR(150)
    , IN vdescription text
    , IN vauthor_id INT
)
BEGIN
	IF vid = -1
    THEN
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
	ELSE
		UPDATE Recipes
		SET 
			title = vtitle
			, description = vdescription
			, time_created = NOW()
			, author_id = vauthor_id
		WHERE
			id = vid;
	END IF;
END;;
