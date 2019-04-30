create table CommentVotes
(
    comment_id int           not null,
    user_id    int           not null,
    vote_value int default 0 not null,
    primary key (comment_id, user_id),
    constraint CommentVotes_ibfk_1
        foreign key (comment_id) references Comments (id)
            on update cascade on delete cascade,
    constraint CommentVotes_ibfk_2
        foreign key (user_id) references Users (id)
            on update cascade on delete cascade
);

INSERT INTO team_14.CommentVotes (comment_id, user_id, vote_value) VALUES (47, 2, 1);
INSERT INTO team_14.CommentVotes (comment_id, user_id, vote_value) VALUES (48, 17, 1);
INSERT INTO team_14.CommentVotes (comment_id, user_id, vote_value) VALUES (50, 2, 0);