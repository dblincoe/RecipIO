create table PageViews
(
    id         int auto_increment
        primary key,
    recipe_id  int                                not null,
    view_count int      default 0                 not null,
    view_date  datetime default CURRENT_TIMESTAMP null,
    constraint PageViews_ibfk_1
        foreign key (recipe_id) references Recipes (id)
            on update cascade on delete cascade
);

create index recipe_id
    on PageViews (recipe_id);

INSERT INTO team_14.PageViews (id, recipe_id, view_count, view_date) VALUES (28, 15, 37, '2019-04-30 00:00:00');
INSERT INTO team_14.PageViews (id, recipe_id, view_count, view_date) VALUES (29, 1, 32, '2019-04-30 00:00:00');
INSERT INTO team_14.PageViews (id, recipe_id, view_count, view_date) VALUES (32, 18, 32, '2019-04-30 00:00:00');
INSERT INTO team_14.PageViews (id, recipe_id, view_count, view_date) VALUES (33, 19, 14, '2019-04-30 00:00:00');
INSERT INTO team_14.PageViews (id, recipe_id, view_count, view_date) VALUES (34, 20, 10, '2019-04-30 00:00:00');
INSERT INTO team_14.PageViews (id, recipe_id, view_count, view_date) VALUES (35, 21, 9, '2019-04-30 00:00:00');