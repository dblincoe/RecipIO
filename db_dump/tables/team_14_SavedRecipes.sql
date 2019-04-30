create table SavedRecipes
(
    user_id   int not null,
    recipe_id int not null,
    primary key (user_id, recipe_id),
    constraint SavedRecipes_ibfk_1
        foreign key (user_id) references Users (id)
            on update cascade on delete cascade,
    constraint SavedRecipes_ibfk_2
        foreign key (recipe_id) references Recipes (id)
            on update cascade on delete cascade
);

create index recipe_id
    on SavedRecipes (recipe_id);

INSERT INTO team_14.SavedRecipes (user_id, recipe_id) VALUES (1, 1);
INSERT INTO team_14.SavedRecipes (user_id, recipe_id) VALUES (2, 1);
INSERT INTO team_14.SavedRecipes (user_id, recipe_id) VALUES (2, 18);
INSERT INTO team_14.SavedRecipes (user_id, recipe_id) VALUES (17, 18);