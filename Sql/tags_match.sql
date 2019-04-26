DELIMITER ;;
CREATE PROCEDURE Tags_SELECT_prefix
(
	IN tomatch VARCHAR(150)
)
BEGIN 
	SELECT
		t.id
        , t.name
	FROM
		Tags t
	WHERE LOWER(t.name) LIKE CONCAT(LOWER(tomatch), '%');
END
