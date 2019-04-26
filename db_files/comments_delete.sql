DELIMITER ;;
CREATE PROCEDURE Comments_DELETE
(IN vcomment_id INT
)
BEGIN
	DELETE FROM Comments WHERE id = vcomment_id;
END;;