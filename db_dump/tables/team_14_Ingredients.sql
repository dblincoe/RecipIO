create table Ingredients
(
    id   int auto_increment
        primary key,
    name varchar(50) not null,
    constraint ingredient_name
        unique (name)
);

INSERT INTO team_14.Ingredients (id, name) VALUES (2, 'All-Purpose Flour');
INSERT INTO team_14.Ingredients (id, name) VALUES (34, 'Bacon');
INSERT INTO team_14.Ingredients (id, name) VALUES (4, 'Baking Powder');
INSERT INTO team_14.Ingredients (id, name) VALUES (5, 'Baking Soda');
INSERT INTO team_14.Ingredients (id, name) VALUES (26, 'beer');
INSERT INTO team_14.Ingredients (id, name) VALUES (25, 'bread');
INSERT INTO team_14.Ingredients (id, name) VALUES (11, 'Brown Sugar');
INSERT INTO team_14.Ingredients (id, name) VALUES (8, 'Butter');
INSERT INTO team_14.Ingredients (id, name) VALUES (40, 'Cheddar Cheese');
INSERT INTO team_14.Ingredients (id, name) VALUES (38, 'Chicken Breast');
INSERT INTO team_14.Ingredients (id, name) VALUES (12, 'Chocolate Chips');
INSERT INTO team_14.Ingredients (id, name) VALUES (42, 'Coconut Oil');
INSERT INTO team_14.Ingredients (id, name) VALUES (41, 'Cottage Cheese');
INSERT INTO team_14.Ingredients (id, name) VALUES (29, 'Cream of Chicken Soup');
INSERT INTO team_14.Ingredients (id, name) VALUES (16, 'Cucumber');
INSERT INTO team_14.Ingredients (id, name) VALUES (7, 'Egg');
INSERT INTO team_14.Ingredients (id, name) VALUES (17, 'Fresh Mint');
INSERT INTO team_14.Ingredients (id, name) VALUES (36, 'Garlic');
INSERT INTO team_14.Ingredients (id, name) VALUES (15, 'Grapefruit');
INSERT INTO team_14.Ingredients (id, name) VALUES (18, 'Ice');
INSERT INTO team_14.Ingredients (id, name) VALUES (13, 'Lemon');
INSERT INTO team_14.Ingredients (id, name) VALUES (14, 'Lime');
INSERT INTO team_14.Ingredients (id, name) VALUES (39, 'Macaroni');
INSERT INTO team_14.Ingredients (id, name) VALUES (9, 'Margerine');
INSERT INTO team_14.Ingredients (id, name) VALUES (43, 'Paprika');
INSERT INTO team_14.Ingredients (id, name) VALUES (35, 'Parmesan Cheese');
INSERT INTO team_14.Ingredients (id, name) VALUES (10, 'Peanut Butter');
INSERT INTO team_14.Ingredients (id, name) VALUES (37, 'Pepper');
INSERT INTO team_14.Ingredients (id, name) VALUES (27, 'Poppyseeds');
INSERT INTO team_14.Ingredients (id, name) VALUES (28, 'Ritz Crackers');
INSERT INTO team_14.Ingredients (id, name) VALUES (6, 'Salt');
INSERT INTO team_14.Ingredients (id, name) VALUES (30, 'Sour Cream');
INSERT INTO team_14.Ingredients (id, name) VALUES (33, 'Spaghetti');
INSERT INTO team_14.Ingredients (id, name) VALUES (19, 'Water');
INSERT INTO team_14.Ingredients (id, name) VALUES (3, 'White Sugar');
INSERT INTO team_14.Ingredients (id, name) VALUES (1, 'White Vinegar');