CREATE TABLE recipe_ingredients(
  id INTEGER PRIMARY KEY,
  quantity TEXT,
  recipe_id INTEGER,
  ingredient_id INTEGER
);