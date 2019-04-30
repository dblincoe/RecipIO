create table RecipeIngredients
(
    recipe_id     int          not null,
    ingredient_id int          not null,
    amountText    varchar(100) not null,
    primary key (recipe_id, ingredient_id),
    constraint RecipeIngredients_ibfk_1
        foreign key (recipe_id) references Recipes (id)
            on update cascade on delete cascade,
    constraint RecipeIngredients_ibfk_2
        foreign key (ingredient_id) references Ingredients (id)
            on update cascade on delete cascade
);

create index ingredient_id
    on RecipeIngredients (ingredient_id);

INSERT INTO team_14.RecipeIngredients (recipe_id, ingredient_id, amountText) VALUES (1, 1, '2 tablespoons');
INSERT INTO team_14.RecipeIngredients (recipe_id, ingredient_id, amountText) VALUES (1, 2, '1 cup');
INSERT INTO team_14.RecipeIngredients (recipe_id, ingredient_id, amountText) VALUES (1, 3, '2 tablespoons');
INSERT INTO team_14.RecipeIngredients (recipe_id, ingredient_id, amountText) VALUES (1, 4, '1 teaspoon');
INSERT INTO team_14.RecipeIngredients (recipe_id, ingredient_id, amountText) VALUES (1, 5, '1/2 teaspoon');
INSERT INTO team_14.RecipeIngredients (recipe_id, ingredient_id, amountText) VALUES (1, 6, '1/2 teaspoon');
INSERT INTO team_14.RecipeIngredients (recipe_id, ingredient_id, amountText) VALUES (1, 7, '1');
INSERT INTO team_14.RecipeIngredients (recipe_id, ingredient_id, amountText) VALUES (1, 8, '1 tablespoon');
INSERT INTO team_14.RecipeIngredients (recipe_id, ingredient_id, amountText) VALUES (15, 2, '2 Cups, unbleached');
INSERT INTO team_14.RecipeIngredients (recipe_id, ingredient_id, amountText) VALUES (15, 3, '1 Cup');
INSERT INTO team_14.RecipeIngredients (recipe_id, ingredient_id, amountText) VALUES (15, 5, '1 Tsp');
INSERT INTO team_14.RecipeIngredients (recipe_id, ingredient_id, amountText) VALUES (15, 7, '2');
INSERT INTO team_14.RecipeIngredients (recipe_id, ingredient_id, amountText) VALUES (15, 9, '1 Cup');
INSERT INTO team_14.RecipeIngredients (recipe_id, ingredient_id, amountText) VALUES (15, 10, '1 Cup');
INSERT INTO team_14.RecipeIngredients (recipe_id, ingredient_id, amountText) VALUES (15, 11, '1 Cup, packed');
INSERT INTO team_14.RecipeIngredients (recipe_id, ingredient_id, amountText) VALUES (15, 12, '2 Cups');
INSERT INTO team_14.RecipeIngredients (recipe_id, ingredient_id, amountText) VALUES (18, 8, '1 Cup, melted');
INSERT INTO team_14.RecipeIngredients (recipe_id, ingredient_id, amountText) VALUES (18, 27, '1 Tablespoon');
INSERT INTO team_14.RecipeIngredients (recipe_id, ingredient_id, amountText) VALUES (18, 28, '2 cups');
INSERT INTO team_14.RecipeIngredients (recipe_id, ingredient_id, amountText) VALUES (18, 29, '29 oz');
INSERT INTO team_14.RecipeIngredients (recipe_id, ingredient_id, amountText) VALUES (18, 30, '1 cup ');
INSERT INTO team_14.RecipeIngredients (recipe_id, ingredient_id, amountText) VALUES (18, 38, '1, boiled and cubed');
INSERT INTO team_14.RecipeIngredients (recipe_id, ingredient_id, amountText) VALUES (19, 7, '2');
INSERT INTO team_14.RecipeIngredients (recipe_id, ingredient_id, amountText) VALUES (19, 8, 'enough to cover the bread');
INSERT INTO team_14.RecipeIngredients (recipe_id, ingredient_id, amountText) VALUES (19, 25, '2 slices');
INSERT INTO team_14.RecipeIngredients (recipe_id, ingredient_id, amountText) VALUES (20, 6, 'to taste');
INSERT INTO team_14.RecipeIngredients (recipe_id, ingredient_id, amountText) VALUES (20, 7, '3');
INSERT INTO team_14.RecipeIngredients (recipe_id, ingredient_id, amountText) VALUES (20, 33, '12 oz');
INSERT INTO team_14.RecipeIngredients (recipe_id, ingredient_id, amountText) VALUES (20, 34, '8 slices');
INSERT INTO team_14.RecipeIngredients (recipe_id, ingredient_id, amountText) VALUES (20, 35, '1 cup');
INSERT INTO team_14.RecipeIngredients (recipe_id, ingredient_id, amountText) VALUES (20, 36, '2 cloves, minced');
INSERT INTO team_14.RecipeIngredients (recipe_id, ingredient_id, amountText) VALUES (20, 37, 'to taste');
INSERT INTO team_14.RecipeIngredients (recipe_id, ingredient_id, amountText) VALUES (21, 6, '1 teaspoon');
INSERT INTO team_14.RecipeIngredients (recipe_id, ingredient_id, amountText) VALUES (21, 7, '1, lightly beaten');
INSERT INTO team_14.RecipeIngredients (recipe_id, ingredient_id, amountText) VALUES (21, 30, '8 oz');
INSERT INTO team_14.RecipeIngredients (recipe_id, ingredient_id, amountText) VALUES (21, 39, '8 oz');
INSERT INTO team_14.RecipeIngredients (recipe_id, ingredient_id, amountText) VALUES (21, 40, '2 cups, shredded');
INSERT INTO team_14.RecipeIngredients (recipe_id, ingredient_id, amountText) VALUES (21, 41, '2 cups, small curd');
INSERT INTO team_14.RecipeIngredients (recipe_id, ingredient_id, amountText) VALUES (21, 42, '1 tablespoon');
INSERT INTO team_14.RecipeIngredients (recipe_id, ingredient_id, amountText) VALUES (21, 43, 'to garnish');