DELIMITER ;;
CREATE PROCEDURE User_authenticate
(
	IN vusername VARCHAR(50)
    , IN vpassword CHAR(64)
)
BEGIN 
	SELECT (EXISTS(
		SELECT 1
        FROM Users u
        WHERE vusername = u.user_name
        AND vpassword_hash = u.password_hash
    )) as authenticated;
END
