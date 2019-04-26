DELIMITER ;;
CREATE PROCEDURE Users_SELECT_byid
(
	IN vid INT
)
BEGIN
	SELECT 
    u.id
    , u.user_name
    , u.email
    , u.time_creates
    FROM Users u
    WHERE u.id = vid;
END;;
