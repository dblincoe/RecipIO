DELIMITER ;;
CREATE PROCEDURE Recipes_SELECT_by_popular
()
BEGIN 
	DECLARE daycount INT;
    SET daycount = 20;
	SELECT
		r.id
        , r.title
        , r.description
        , r.time_created
        , r.author_id
        , u.user_name
        , r.vote_score
	FROM
		RecipesWithVotes r
		INNER JOIN Users u
			ON r.auther_id = u.id
		INNER JOIN (
			SELECT 
				SUM(v.view_count * (dayCount - DATEDIFF(NOW(), v.view_date))) AS views
                , v.recipe_id 
			FROM PageViews
            WHERE
				DATEDIFF(NOW(), v.view_date) < dayCount
			GROUP BY recipe_id
            ) p
			ON r.id = p.recipe_id
	ORDER BY p.views DESC
	LIMIT 0, 100;
END
