create definer = team_14@`%` view CommentsWithVotes as
select `c`.`id`                         AS `id`,
       `c`.`recipe_id`                  AS `recipe_id`,
       `c`.`user_id`                    AS `user_id`,
       `c`.`comment_text`               AS `comment_text`,
       `c`.`time_posted`                AS `time_posted`,
       sum(ifnull(`v`.`vote_value`, 0)) AS `vote_score`
from (`team_14`.`Comments` `c`
         left join `team_14`.`CommentVotes` `v` on ((`c`.`id` = `v`.`comment_id`)))
group by `c`.`id`, `c`.`recipe_id`, `c`.`user_id`, `c`.`comment_text`, `c`.`time_posted`;

INSERT INTO team_14.CommentsWithVotes (id, recipe_id, user_id, comment_text, time_posted, vote_score) VALUES (47, 15, 1, 'aaaaa'';) DROP TABLE Users;--', '2019-04-30 01:28:34', 1);
INSERT INTO team_14.CommentsWithVotes (id, recipe_id, user_id, comment_text, time_posted, vote_score) VALUES (48, 18, 17, 'Wow so delicious
', '2019-04-30 01:38:48', 1);
INSERT INTO team_14.CommentsWithVotes (id, recipe_id, user_id, comment_text, time_posted, vote_score) VALUES (49, 1, 17, 'I like to put bananas in mine', '2019-04-30 01:39:18', 0);
INSERT INTO team_14.CommentsWithVotes (id, recipe_id, user_id, comment_text, time_posted, vote_score) VALUES (50, 15, 17, 'Yum!', '2019-04-30 01:39:36', 0);
INSERT INTO team_14.CommentsWithVotes (id, recipe_id, user_id, comment_text, time_posted, vote_score) VALUES (51, 19, 1, 'Wow! I really love this recipe Sammy Boy! I made some for my whole family the other day! Really Great! 1 upvote!!', '2019-04-30 01:54:21', 0);