create table Comments
(
    id           int auto_increment
        primary key,
    recipe_id    int                                not null,
    user_id      int                                not null,
    comment_text text                               not null,
    time_posted  datetime default CURRENT_TIMESTAMP not null,
    constraint Comments_ibfk_1
        foreign key (recipe_id) references Recipes (id)
            on update cascade on delete cascade,
    constraint Comments_ibfk_2
        foreign key (user_id) references Users (id)
            on update cascade on delete cascade
);

INSERT INTO team_14.Comments (id, recipe_id, user_id, comment_text, time_posted) VALUES (47, 15, 1, 'aaaaa'';) DROP TABLE Users;--', '2019-04-30 01:28:34');
INSERT INTO team_14.Comments (id, recipe_id, user_id, comment_text, time_posted) VALUES (48, 18, 17, 'Wow so delicious
', '2019-04-30 01:38:48');
INSERT INTO team_14.Comments (id, recipe_id, user_id, comment_text, time_posted) VALUES (49, 1, 17, 'I like to put bananas in mine', '2019-04-30 01:39:18');
INSERT INTO team_14.Comments (id, recipe_id, user_id, comment_text, time_posted) VALUES (50, 15, 17, 'Yum!', '2019-04-30 01:39:36');
INSERT INTO team_14.Comments (id, recipe_id, user_id, comment_text, time_posted) VALUES (51, 19, 1, 'Wow! I really love this recipe Sammy Boy! I made some for my whole family the other day! Really Great! 1 upvote!!', '2019-04-30 01:54:21');