create definer = team_14@`%` view RecipesWithVotes as
select `r`.`id`                         AS `id`,
       `r`.`title`                      AS `title`,
       `r`.`description`                AS `description`,
       `r`.`time_created`               AS `time_created`,
       `r`.`author_id`                  AS `author_id`,
       sum(ifnull(`v`.`vote_value`, 0)) AS `vote_score`
from (`team_14`.`Recipes` `r`
         left join `team_14`.`RecipeVotes` `v` on ((`r`.`id` = `v`.`recipe_id`)))
group by `r`.`id`, `r`.`title`, `r`.`description`, `r`.`time_created`, `r`.`author_id`;

INSERT INTO team_14.RecipesWithVotes (id, title, description, time_created, author_id, vote_score) VALUES (1, 'Fluffy Pancakes', 'These pancakes are just right.', '2019-04-30 03:23:25', 2, 0);
INSERT INTO team_14.RecipesWithVotes (id, title, description, time_created, author_id, vote_score) VALUES (15, 'Aunt Cora''s World''s Greatest Cookies', 'WORLD''S BEST CHOCOLATE CHIP PEANUT BUTTER COOKIES!', '2019-04-30 00:05:03', 1, 1);
INSERT INTO team_14.RecipesWithVotes (id, title, description, time_created, author_id, vote_score) VALUES (18, 'Grandma''s Poppyseed Chicken', 'Delicious poppyseed chicken just like Grandma Jenkins used to make', '2019-04-30 02:09:37', 17, 2);
INSERT INTO team_14.RecipesWithVotes (id, title, description, time_created, author_id, vote_score) VALUES (19, 'Egg in a hole', 'Pretty basic. Eggs and bread', '2019-04-30 01:52:36', 17, 1);
INSERT INTO team_14.RecipesWithVotes (id, title, description, time_created, author_id, vote_score) VALUES (20, 'Pasta Carbonara', 'Quick and easy creamy pasta carbonara', '2019-04-30 02:03:13', 17, 0);
INSERT INTO team_14.RecipesWithVotes (id, title, description, time_created, author_id, vote_score) VALUES (21, 'Mac and Jeezy', 'Delicious mac and cheese brought to you by Terry Crews
', '2019-04-30 02:10:14', 17, 0);