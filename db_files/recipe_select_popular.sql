DROP PROCEDURE IF EXISTS Recipes_SELECT_by_popular;
DELIMITER ;;
CREATE PROCEDURE Recipes_SELECT_by_popular
(
	IN vuser_id INT
)
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
        , IFNULL
			(
            (SELECT rv.vote_value FROM RecipeVotes rv WHERE rv.recipe_id = r.id AND rv.user_id = vuser_id)
            , 0) AS userVote
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
