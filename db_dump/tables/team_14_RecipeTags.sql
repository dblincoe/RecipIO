create table RecipeTags
(
    recipe_id int not null,
    tag_id    int not null,
    primary key (recipe_id, tag_id),
    constraint RecipeTags_ibfk_1
        foreign key (recipe_id) references Recipes (id)
            on update cascade on delete cascade,
    constraint RecipeTags_ibfk_2
        foreign key (tag_id) references Tags (id)
            on update cascade on delete cascade
);

create index tag_id
    on RecipeTags (tag_id);

INSERT INTO team_14.RecipeTags (recipe_id, tag_id) VALUES (19, 1);
INSERT INTO team_14.RecipeTags (recipe_id, tag_id) VALUES (1, 5);
INSERT INTO team_14.RecipeTags (recipe_id, tag_id) VALUES (18, 5);
INSERT INTO team_14.RecipeTags (recipe_id, tag_id) VALUES (21, 5);
INSERT INTO team_14.RecipeTags (recipe_id, tag_id) VALUES (20, 35);
INSERT INTO team_14.RecipeTags (recipe_id, tag_id) VALUES (18, 53);
INSERT INTO team_14.RecipeTags (recipe_id, tag_id) VALUES (18, 54);
INSERT INTO team_14.RecipeTags (recipe_id, tag_id) VALUES (18, 55);
INSERT INTO team_14.RecipeTags (recipe_id, tag_id) VALUES (20, 55);
INSERT INTO team_14.RecipeTags (recipe_id, tag_id) VALUES (21, 55);
INSERT INTO team_14.RecipeTags (recipe_id, tag_id) VALUES (18, 56);
INSERT INTO team_14.RecipeTags (recipe_id, tag_id) VALUES (19, 57);
INSERT INTO team_14.RecipeTags (recipe_id, tag_id) VALUES (20, 57);
INSERT INTO team_14.RecipeTags (recipe_id, tag_id) VALUES (19, 58);
INSERT INTO team_14.RecipeTags (recipe_id, tag_id) VALUES (20, 59);
INSERT INTO team_14.RecipeTags (recipe_id, tag_id) VALUES (21, 60);