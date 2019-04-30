create table RecipeVotes
(
    recipe_id  int           not null,
    user_id    int           not null,
    vote_value int default 0 not null,
    primary key (recipe_id, user_id),
    constraint RecipeVotes_ibfk_1
        foreign key (recipe_id) references Recipes (id)
            on update cascade on delete cascade,
    constraint RecipeVotes_ibfk_2
        foreign key (user_id) references Users (id)
            on update cascade on delete cascade
);

INSERT INTO team_14.RecipeVotes (recipe_id, user_id, vote_value) VALUES (1, 1, 1);
INSERT INTO team_14.RecipeVotes (recipe_id, user_id, vote_value) VALUES (1, 2, -1);
INSERT INTO team_14.RecipeVotes (recipe_id, user_id, vote_value) VALUES (15, 2, 1);
INSERT INTO team_14.RecipeVotes (recipe_id, user_id, vote_value) VALUES (18, 1, 1);
INSERT INTO team_14.RecipeVotes (recipe_id, user_id, vote_value) VALUES (18, 2, 1);
INSERT INTO team_14.RecipeVotes (recipe_id, user_id, vote_value) VALUES (19, 1, 1);
INSERT INTO team_14.RecipeVotes (recipe_id, user_id, vote_value) VALUES (21, 2, 0);