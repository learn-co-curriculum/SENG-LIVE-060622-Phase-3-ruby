## DB Config - Adding Dependencies

### Add sqlite3 gem to Gemfile

```bash
bundle add sqlite3
```

## DB Config - Loading dependencies

#### Add database configuration to config/environment.rb

Add these lines above the `require_all "lib"`

```rb
require "sqlite3" 

DOGS_DB = SQLite3::Database.new("db/dog_walker/dog_walker.db")
DOGS_DB.results_as_hash = true

APPTS_DB = SQLite3::Database.new("db/appointments/appointments.db")
APPTS_DB.results_as_hash = true

RECIPES_DB = SQLite3::Database.new("db/recipes/recipes.db")
RECIPES_DB.results_as_hash = true
```


## DB Config - Creating Tables

#### Create the Tables for the dog walker app

```sql
# db/dog_walker/migrate/01_create_dogs.sql
CREATE TABLE dogs(
  id INTEGER PRIMARY KEY,
  name TEXT,
  birthdate DATE,
  breed TEXT,
  favorite_treats TEXT,
  last_fed_at DATETIME,
  last_walked_at DATETIME
);
```

```sql
# db/dog_walker/migrate/02_create_feedings.sql
CREATE TABLE feedings(
  id INTEGER PRIMARY KEY,
  time DATETIME,
  food TEXT,
  dog_id INTEGER
);
```

```sql
# db/dog_walker/migrate/03_create_walks.sql
CREATE TABLE walks(
  id INTEGER PRIMARY KEY,
  time DATETIME
);
```

```sql
# db/dog_walker/migrate/03_create_walks.sql
CREATE TABLE dog_walks(
  id INTEGER PRIMARY KEY,
  dog_id INTEGER,
  walk_id INTEGER
);
```



## Running Migration files on Database

Run the following command to create the  tables:

```bash
sqlite3 db/dog_walker/dog_walker.db < db/dog_walker/migrate/01_create_dogs.sql
sqlite3 db/dog_walker/dog_walker.db < db/dog_walker/migrate/02_create_feedings.sql
sqlite3 db/dog_walker/dog_walker.db < db/dog_walker/migrate/03_create_walks.sql
sqlite3 db/dog_walker/dog_walker.db < db/dog_walker/migrate/04_create_dog_walks.sql
```

## Creating Seeds
And insert rows in the table by running the following sql file:

```sql
-- # db/dog_walker/seeds.sql
-- Create dogs
INSERT INTO dogs(name, birthdate, breed, image_url) 
VALUES ('Olivia', '2018-03-31 00:00:00', 'Terrier', 'https://res.cloudinary.com/dnocv6uwb/image/upload/v1631229064/zx6CPsp_d_utkmww.webp');
INSERT INTO dogs(name, birthdate, breed, image_url) 
VALUES ('Molly', '2019-06-21 00:00:00', 'Terrier / Chihuahua', 'https://res.cloudinary.com/dnocv6uwb/image/upload/v1631229038/EEE90-E50-25-F0-4-DF0-98-B2-0-E0-B6-F9-BAA89_menwgg.jpg');
INSERT INTO dogs(name, birthdate, breed, image_url) 
VALUES ('Kaya', '2017-09-27 00:00:00', 'Blueheeler', 'https://res.cloudinary.com/dnocv6uwb/image/upload/v1631229011/8136c615d670e214f80de4e7fcdf8607--cattle-dogs-mans_vgyqqa.jpg');
INSERT INTO dogs(name, birthdate, breed, image_url) 
VALUES ('Chop', '2020-07-31 00:00:00', 'German Shorthaired Pointer', 'https://res.cloudinary.com/dnocv6uwb/image/upload/v1629822267/cdbd77592e3ef91e8cc1cf67d936f94f_fkozjt.jpg');
INSERT INTO dogs(name, birthdate, breed, image_url) 
VALUES ('Baron', '2012-12-23 00:00:00', 'GSD/English Lab mix', 'https://res.cloudinary.com/dnocv6uwb/image/upload/v1629567379/baron_x0s6ai.jpg');
INSERT INTO dogs(name, birthdate, breed, image_url) 
VALUES ('Lennon Snow', '2021-06-18 18:12:38', 'Pomeranian', 'https://res.cloudinary.com/dnocv6uwb/image/upload/v1627585625/lennon-with-tennis-ball_slg2zn.jpg');
INSERT INTO dogs(name, birthdate, breed, image_url) 
VALUES ('Ash', '2020-05-18 18:12:38', 'Husky', 'https://res.cloudinary.com/dnocv6uwb/image/upload/v1631229192/photo-1568572933382-74d440642117_p6mrgm.jpg');
INSERT INTO dogs(name, birthdate, breed, image_url) 
VALUES ('DJ', '2020-05-18 18:12:38', 'Dachsund Mix', 'https://res.cloudinary.com/dnocv6uwb/image/upload/v1629822169/365758759_qyupo8.jpg');
INSERT INTO dogs(name, birthdate, breed, image_url) 
VALUES ('Winter', '2013-05-18 18:12:38', 'Husky Mix', 'https://res.cloudinary.com/dnocv6uwb/image/upload/v1629822144/561229495_lldnll.jpg');
INSERT INTO dogs(name, birthdate, breed, image_url) 
VALUES ('CeCe', '2019-05-18 18:12:38', 'Lab mix', 'https://res.cloudinary.com/dnocv6uwb/image/upload/v1629821709/ee7eee7ee62c9c2b053e65dc9c9e1a55_iwjweh.jpg');
INSERT INTO dogs(name, birthdate, breed, image_url) 
VALUES ('Kane', '2021-05-18 18:12:38', 'Terrier Mix', 'https://res.cloudinary.com/dnocv6uwb/image/upload/v1629821681/2_lu9ccw.jpg');
INSERT INTO dogs(name, birthdate, breed, image_url) 
VALUES ('Nutmeg', '2022-01-18 18:12:38', 'Lab Mix', 'https://res.cloudinary.com/dnocv6uwb/image/upload/v1629822016/Nutmegupdate97_kyqlqo.jpg');
INSERT INTO dogs(name, birthdate, breed, image_url) 
VALUES ('Sadie', '2021-09-18 18:12:38', 'Lab/Terrier Mix', 'https://res.cloudinary.com/dnocv6uwb/image/upload/v1629822095/55860f51e40159e2c34766352b214c36_g3plyx.jpg');
INSERT INTO dogs(name, birthdate, breed, image_url) 
VALUES ('Sal', '2020-05-18 18:12:38', 'Lab Mix', 'https://res.cloudinary.com/dnocv6uwb/image/upload/v1629822067/83c97c9fe7d2d82ce90c1d8ca9fde44c_zckdjy.jpg');
INSERT INTO dogs(name, birthdate, breed, image_url) 
VALUES ('Sinton', '2020-05-18 18:12:38', 'Terrier Mix', 'https://res.cloudinary.com/dnocv6uwb/image/upload/v1629821474/4_bbgw1p.jpg');
INSERT INTO dogs(name, birthdate, breed, image_url) 
VALUES ('Cupcake', '2022-03-18 18:12:38', '???', 'https://res.cloudinary.com/dnocv6uwb/image/upload/v1631229142/it-s-national-dog-day-dogs-41538267-400-400_fvq8wk.jpg');
INSERT INTO dogs(name, birthdate, breed, image_url) 
VALUES ('Luci', '2020-05-18 18:12:38', 'Samoyed', 'https://res.cloudinary.com/dnocv6uwb/image/upload/v1629822371/f6p9jE2_acndnl.jpg');
INSERT INTO dogs(name, birthdate, breed, image_url) 
VALUES ('Simon', '2015-08-23 00:00:00', 'Shiba Inu', 'https://res.cloudinary.com/dnocv6uwb/image/upload/v1629822438/B3-FAF888-5656-4746-BE22-597185404078_bpbvvs.jpg');
INSERT INTO dogs(name, birthdate, breed, image_url) 
VALUES ('Snoopy', '1990-01-01 00:00:00', 'Snooop', 'https://res.cloudinary.com/dnocv6uwb/image/upload/v1629822337/sn-color_qesmhx.jpg');


-- Create Walks

INSERT INTO walks(time) VALUES ('2022-06-20 18:05:00');
INSERT INTO walks(time) VALUES ('2022-06-21 11:25:00');
INSERT INTO walks(time) VALUES ('2022-06-22 08:55:00');

-- Create DogWalks

INSERT INTO dog_walks(dog_id, walk_id) VALUES(1,1);
INSERT INTO dog_walks(dog_id, walk_id) VALUES(1,3);
INSERT INTO dog_walks(dog_id, walk_id) VALUES(2,1);
INSERT INTO dog_walks(dog_id, walk_id) VALUES(4,1);
INSERT INTO dog_walks(dog_id, walk_id) VALUES(4,2);

-- Create Feedings

INSERT INTO feedings(time, food, dog_id) 
VALUES('2022-06-22 11:00:00', 'Bacon', 1);
INSERT INTO feedings(time, food, dog_id) 
VALUES('2022-06-22 11:30:00', 'Carrots', 2);
INSERT INTO feedings(time, food, dog_id) 
VALUES('2022-06-22 15:15:00', 'Cheese', 2);
```

## Seeding a Database
```bash
sqlite3 db/dog_walker/dog_walker.db < db/dog_walker/seeds.sql
```

# Appointments Database

Migrations:

```sql
-- db/appointments/migrate/01_create_doctors.sql
CREATE TABLE doctors(
  id INTEGER PRIMARY KEY,
  name TEXT,
  specialty TEXT,
  hospital TEXT,
  gives_lollipop BOOLEAN
);
-- db/appointments/migrate/02_create_patients.sql
CREATE TABLE patients(
  id INTEGER PRIMARY KEY,
  name TEXT,
  insurance_provider TEXT,
  birthdate DATE,
  is_insured BOOLEAN,
  is_alive BOOLEAN,
  is_organ_donor BOOLEAN
);
-- db/appointments/migrate/03_create_appointments.sql
CREATE TABLE appointments(
  id INTEGER PRIMARY KEY,
  starts_at DATETIME,
  patient_notes TEXT,
  doctor_notes TEXT,
  no_show BOOLEAN,
  receptionist_notes TEXT,
  patient_id INTEGER,
  doctor_id INTEGER
);
```

## Running Migration files on Database

Run the following command to create the  tables:

```bash
sqlite3 db/appointments/appointments.db < db/appointments/migrate/01_create_doctors.sql
sqlite3 db/appointments/appointments.db < db/appointments/migrate/02_create_patients.sql
sqlite3 db/appointments/appointments.db < db/appointments/migrate/03_create_appointments.sql
```

## Creating Seeds
And insert rows in the table by running the following sql file:

```sql
-- # db/appointments/seeds.sql
-- Create doctors

INSERT INTO doctors(name, specialty, hospital, gives_lollipop)
VALUES('Dr. Who', 'Time Travel', "St. John's Bonaventure", 1);
INSERT INTO doctors(name, specialty, hospital, gives_lollipop)
VALUES('Dr. Strange', 'Sorcery', "St. John's Bonaventure", 1);

-- Create patients
INSERT INTO patients(name, insurance_provider, birthdate, is_insured, is_alive, is_organ_donor)
VALUES('Cindy', 'Anthem Blue Shield', '1973-03-12', 1, 1, 1);
INSERT INTO patients(name, insurance_provider, birthdate, is_insured, is_alive, is_organ_donor)
VALUES('Allie', 'Kaiser Permanente', '1986-09-19', 1, 1, 1);
INSERT INTO patients(name, insurance_provider, birthdate, is_insured, is_alive, is_organ_donor)
VALUES('Megan', NULL, '1973-03-12', 0, 1, 1);

-- Create appointments
INSERT INTO appointments(starts_at, patient_notes, doctor_notes, receptionist_notes, no_show, patient_id, doctor_id)
VALUES('2022-06-18 11:00:00', NULL, NULL, NULL, 0, 1, 1);
INSERT INTO appointments(starts_at, patient_notes, doctor_notes, receptionist_notes, no_show, patient_id, doctor_id)
VALUES('2022-06-20 13:00:00', NULL, NULL, NULL, 0, 2, 1);
INSERT INTO appointments(starts_at, patient_notes, doctor_notes, receptionist_notes, no_show, patient_id, doctor_id)
VALUES('2022-06-18 14:30:00', NULL, NULL, NULL, 0, 3, 2);
```

## Seeding a Database
```bash
sqlite3 db/appointments/appointments.db < db/appointments/seeds.sql
```


# Appointments Database

Migrations:

```sql
-- db/recipes/migrate/01_create_recipes.sql
CREATE TABLE recipes(
  id INTEGER PRIMARY KEY,
  name TEXT,
  cook_time_in_minutes INTEGER,
  prep_time_in_minutes INTEGER
);
-- db/recipes/migrate/02_create_ingredients.sql
CREATE TABLE ingredients(
  id INTEGER PRIMARY KEY,
  name TEXT
);
-- db/recipes/migrate/03_create_recipe_ingredients.sql
CREATE TABLE recipe_ingredients(
  id INTEGER PRIMARY KEY,
  quantity TEXT,
  recipe_id INTEGER,
  ingredient_id INTEGER
);
```

## Running Migration files on Database

Run the following command to create the  tables:

```bash
sqlite3 db/recipes/recipes.db < db/recipes/migrate/01_create_recipes.sql
sqlite3 db/recipes/recipes.db < db/recipes/migrate/02_create_ingredients.sql
sqlite3 db/recipes/recipes.db < db/recipes/migrate/03_create_recipe_ingredients.sql
```

## Creating Seeds
And insert rows in the table by running the following sql file:

```sql
-- # db/recipes/seeds.sql
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

```

## Seeding a Database
```bash
sqlite3 db/recipes/recipes.db < db/recipes/seeds.sql
```