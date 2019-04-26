-- SHOW CREATE VIEW CommentsWithVotes;
DROP VIEW IF EXISTS CommentsWithVotes;
CREATE VIEW CommentsWithVotes AS 
select `c`.`id` AS `id`
	,`c`.`recipe_id` AS `recipe_id`
    ,`c`.`user_id` AS `user_id`
    ,`c`.`comment_text` AS `comment_text`
    ,`c`.`time_posted` AS `time_posted`
    ,sum(`v`.`vote_value`) AS `vote_score` 
    from (`Comments` `c` 
		join `CommentVotes` `v` on((`c`.`id` = `v`.`comment_id`))) 
	group by c.id, c.recipe_id, c.user_id, c.comment_text, c.time_posted;