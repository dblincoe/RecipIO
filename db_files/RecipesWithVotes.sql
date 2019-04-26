DROP VIEW RecipesWithVotes;
CREATE VIEW RecipesWithVotes
AS 
select `r`.`id` AS `id`
,`r`.`title` AS `title`
,`r`.`description` AS `description`
,`r`.`time_created` AS `time_created`
,`r`.`author_id` AS `author_id`
,sum((case when (`v`.`vote_value` = 1) then 1 else -(1) end)) AS `vote_score`
 from (`Recipes` `r` join `RecipeVotes` `v` on((`r`.`id` = `v`.`recipe_id`)))
 GROUP BY r.id, r.title, r.description, r.time_created, r.author_id;
 