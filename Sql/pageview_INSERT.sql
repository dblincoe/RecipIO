DELIMITER ;;
CREATE PROCEDURE pageview_INSERT
(IN vrecipe_id INT)
BEGIN
	IF EXISTS (SELECT 1 FROM PageViews p WHERE p.recipe_id = vrecipe_id AND view_date = CURDATE())
    THEN 
		UPDATE PageViews
        SET view_count = view_count + 1
        WHERE recipe_id = vrecipe_id
			AND view_date = CURDATE();
    ELSE
		INSERT INTO PageViews
        (
			recipe_id
            , view_count
            , view_date
        )
        VALUES
        (
			vrecipe_id
            , 1
            , CURDATE()
        );
    END IF;
END;;