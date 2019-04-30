create table Tags
(
    id   int auto_increment
        primary key,
    name varchar(150) not null,
    constraint Tags_name_uindex
        unique (name)
);

INSERT INTO team_14.Tags (id, name) VALUES (32, 'abcde');
INSERT INTO team_14.Tags (id, name) VALUES (5, 'american');
INSERT INTO team_14.Tags (id, name) VALUES (1, 'breakfast');
INSERT INTO team_14.Tags (id, name) VALUES (34, 'canadian');
INSERT INTO team_14.Tags (id, name) VALUES (54, 'Casserole');
INSERT INTO team_14.Tags (id, name) VALUES (56, 'Chicken');
INSERT INTO team_14.Tags (id, name) VALUES (6, 'chinese');
INSERT INTO team_14.Tags (id, name) VALUES (2, 'dessert');
INSERT INTO team_14.Tags (id, name) VALUES (55, 'Dinner');
INSERT INTO team_14.Tags (id, name) VALUES (52, 'german');
INSERT INTO team_14.Tags (id, name) VALUES (3, 'healthy');
INSERT INTO team_14.Tags (id, name) VALUES (33, 'indian');
INSERT INTO team_14.Tags (id, name) VALUES (35, 'italian');
INSERT INTO team_14.Tags (id, name) VALUES (23, 'lunch');
INSERT INTO team_14.Tags (id, name) VALUES (60, 'Macaroni');
INSERT INTO team_14.Tags (id, name) VALUES (53, 'Main course');
INSERT INTO team_14.Tags (id, name) VALUES (31, 'mexican');
INSERT INTO team_14.Tags (id, name) VALUES (59, 'noodles');
INSERT INTO team_14.Tags (id, name) VALUES (58, 'quick');
INSERT INTO team_14.Tags (id, name) VALUES (57, 'simple');
INSERT INTO team_14.Tags (id, name) VALUES (4, 'vegetarian');