-- Create recipes

INSERT INTO recipes(name, cook_time_in_minutes, prep_time_in_minutes)
VALUES('Pizza', 8, 20);
INSERT INTO recipes(name, cook_time_in_minutes, prep_time_in_minutes)
VALUES('Chocolate Cake', 30, 20);

-- Create ingredients

INSERT INTO ingredients(name) VALUES('Tomato Sauce');
INSERT INTO ingredients(name) VALUES('Cheese');
INSERT INTO ingredients(name) VALUES('Flour');
INSERT INTO ingredients(name) VALUES("Baker's Chocolate");
INSERT INTO ingredients(name) VALUES('Butter');

-- Create recipe_ingredients

INSERT INTO recipe_ingredients(quantity, recipe_id, ingredient_id) 
VALUES('1 28oz can', 1, 1);
INSERT INTO recipe_ingredients(quantity, recipe_id, ingredient_id) 
VALUES('2 cups', 1, 2);
INSERT INTO recipe_ingredients(quantity, recipe_id, ingredient_id) 
VALUES('7 cups', 1, 3);
INSERT INTO recipe_ingredients(quantity, recipe_id, ingredient_id) 
VALUES('4 cups', 2, 3);
INSERT INTO recipe_ingredients(quantity, recipe_id, ingredient_id) 
VALUES('2 cups', 2, 4);
INSERT INTO recipe_ingredients(quantity, recipe_id, ingredient_id) 
VALUES('1 stick', 2, 5);