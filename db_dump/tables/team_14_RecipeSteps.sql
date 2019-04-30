create table RecipeSteps
(
    id        int auto_increment
        primary key,
    recipe_id int           not null,
    step_num  int           not null,
    step_text varchar(1500) not null,
    constraint recipe_step
        unique (recipe_id, step_num),
    constraint RecipeSteps_ibfk_1
        foreign key (recipe_id) references Recipes (id)
            on update cascade on delete cascade
);

create index recipe_id
    on RecipeSteps (recipe_id);

INSERT INTO team_14.RecipeSteps (id, recipe_id, step_num, step_text) VALUES (91, 15, 3, 'Bake for 12 to 15 minutes in the preheated oven, or until lightly browned at the edges. Allow cookies to cool on the cookie sheets for a minute before removing to wire racks to cool completely. ');
INSERT INTO team_14.RecipeSteps (id, recipe_id, step_num, step_text) VALUES (92, 15, 2, 'In a large bowl, cream together the margarine, peanut butter, white sugar, and brown sugar until smooth. Beat in the eggs one at a time, mixing well after each. Combine the flour and baking soda; stir into the peanut butter mixture. Mix in chocolate chips. Drop by heaping spoonfuls onto ungreased cookie sheets');
INSERT INTO team_14.RecipeSteps (id, recipe_id, step_num, step_text) VALUES (93, 15, 1, 'Preheat oven to 325 degrees F (165 degrees C). ');
INSERT INTO team_14.RecipeSteps (id, recipe_id, step_num, step_text) VALUES (115, 19, 1, 'Use a cup to cut a circular hole in the middle of the bread');
INSERT INTO team_14.RecipeSteps (id, recipe_id, step_num, step_text) VALUES (116, 19, 2, 'Butter it up and toss it in a pan');
INSERT INTO team_14.RecipeSteps (id, recipe_id, step_num, step_text) VALUES (117, 19, 3, 'Crack an egg and put it in the middle');
INSERT INTO team_14.RecipeSteps (id, recipe_id, step_num, step_text) VALUES (118, 19, 4, 'Butter the cut out hole and toast that too');
INSERT INTO team_14.RecipeSteps (id, recipe_id, step_num, step_text) VALUES (119, 19, 5, 'Enjoy!');
INSERT INTO team_14.RecipeSteps (id, recipe_id, step_num, step_text) VALUES (120, 20, 1, 'Cook spaghetti in a a large pot according to directions. Drain and keep 1 cup pasta water.');
INSERT INTO team_14.RecipeSteps (id, recipe_id, step_num, step_text) VALUES (121, 20, 2, 'In a medium bowl, whisk eggs and parmesan together.');
INSERT INTO team_14.RecipeSteps (id, recipe_id, step_num, step_text) VALUES (122, 20, 3, 'Cook bacon in a large skillet until crispy, then place on paper towel to drain. Keep the fat in the skillet!');
INSERT INTO team_14.RecipeSteps (id, recipe_id, step_num, step_text) VALUES (123, 20, 4, 'Cook garlic in skillet until fragrent, approx 1 minute. Add cooked spaghetti and toss until fully coated. Remove from heat.');
INSERT INTO team_14.RecipeSteps (id, recipe_id, step_num, step_text) VALUES (124, 20, 5, 'Pour in egg and cheese and stir until creamy. Add a couple of tablespoons of pasta water if it gets too thick.');
INSERT INTO team_14.RecipeSteps (id, recipe_id, step_num, step_text) VALUES (125, 20, 6, 'Season with salt and pepper and stir in crumbled bacon. Garnish with parsley if desired.');
INSERT INTO team_14.RecipeSteps (id, recipe_id, step_num, step_text) VALUES (126, 18, 1, 'Preheat oven to 250');
INSERT INTO team_14.RecipeSteps (id, recipe_id, step_num, step_text) VALUES (127, 18, 2, 'Cube chicken breast, place in casserole dish');
INSERT INTO team_14.RecipeSteps (id, recipe_id, step_num, step_text) VALUES (128, 18, 3, 'Stir together soup and sour cream. Pour over chicken
');
INSERT INTO team_14.RecipeSteps (id, recipe_id, step_num, step_text) VALUES (129, 18, 4, 'Crush ritz crackers, stir into melted butter. Sprinkle over chicken and sauce, then sprinkle poppyseeds over top.');
INSERT INTO team_14.RecipeSteps (id, recipe_id, step_num, step_text) VALUES (130, 18, 5, 'Bake for 25 minutes. Enjoy!');
INSERT INTO team_14.RecipeSteps (id, recipe_id, step_num, step_text) VALUES (131, 21, 1, 'Cook macaroni al dente according to instructions and drain with cold water');
INSERT INTO team_14.RecipeSteps (id, recipe_id, step_num, step_text) VALUES (132, 21, 2, 'Preheat oven to 350F');
INSERT INTO team_14.RecipeSteps (id, recipe_id, step_num, step_text) VALUES (133, 21, 3, 'In a medium bowl combine cottage cheese, cheese, sour cream, egg, and salt. Fold in macaroni.');
INSERT INTO team_14.RecipeSteps (id, recipe_id, step_num, step_text) VALUES (134, 21, 4, 'Grease a 2-Quart casserole dish with coconut oil');
INSERT INTO team_14.RecipeSteps (id, recipe_id, step_num, step_text) VALUES (135, 21, 5, 'Spoon into dish and sprinkle with cheese and paprika');
INSERT INTO team_14.RecipeSteps (id, recipe_id, step_num, step_text) VALUES (136, 21, 6, 'Bake for 45 minutes');
INSERT INTO team_14.RecipeSteps (id, recipe_id, step_num, step_text) VALUES (137, 21, 7, 'Enjoy!');
INSERT INTO team_14.RecipeSteps (id, recipe_id, step_num, step_text) VALUES (138, 1, 3, 'Heat a large skillet over medium heat, and coat with cooking spray. Pour 1/4 cupfuls of batter onto the skillet, and cook until bubbles appear on the surface. Flip with a spatula, and cook until browned on the other side. ');