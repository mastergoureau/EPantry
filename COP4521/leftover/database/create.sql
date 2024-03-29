DROP TABLE IF EXISTS Users;
CREATE TABLE Users(
    username VARCHAR(255) PRIMARY KEY,
    email_address VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    user_password VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS Roles;
CREATE TABLE Roles(
    role_id SERIAL PRIMARY KEY,
    role_name VARCHAR(20) NOT NULL
);

DROP TABLE IF EXISTS User_Roles CASCADE;
CREATE TABLE User_Roles(
    user_id varchar(255),           
    role_id SERIAL, 
    FOREIGN KEY (user_id) REFERENCES Users(username),
    FOREIGN KEY (role_id) REFERENCES Roles(role_id)
);

DROP TABLE IF EXISTS Foods;
CREATE TABLE Foods(
    food_name VARCHAR(255) NOT NULL,
    food_type VARCHAR(255) NOT NULL,
    PRIMARY KEY (food_name, food_type)
);

DROP TABLE IF EXISTS Recipes;
CREATE TABLE Recipes(
    recipe_id SERIAL PRIMARY KEY,
    recipe_name VARCHAR(255),
    time_added DATE NOT NULL,
    author varchar,
    FOREIGN KEY (author) REFERENCES Users(username)
);

DROP TABLE IF EXISTS Recipe_Foods;
CREATE TABLE Recipe_Foods(
    recipe_id SERIAL,
    food_name VARCHAR(255) NOT NULL,
    CONSTRAINT recipe_foods_unique_food_name UNIQUE (food_name),
    FOREIGN KEY (recipe_id) REFERENCES Recipes(recipe_id),
    FOREIGN KEY (food_name) REFERENCES Foods(food_name)
);

DROP TABLE IF EXISTS Recipe_Ingredients;
CREATE TABLE Recipe_Ingredients(
    recipe_id SERIAL ,
    ing_name VARCHAR(255) NOT NULL,
    quantity FLOAT NOT NULL,
    measurement varchar(8) NULL,
    FOREIGN KEY (recipe_id) REFERENCES Recipes(recipe_id),
    FOREIGN KEY (ing_name) REFERENCES Recipe_Foods(food_name)
);

DROP TABLE IF EXISTS Steps;
CREATE TABLE Steps(
    step_id SERIAL PRIMARY KEY,
    recipe_id SERIAL,
    step_description TEXT NOT NULL,
    step_number INT NOT NULL,
    FOREIGN KEY (recipe_id) REFERENCES Recipes(recipe_id)
);

DROP TABLE IF EXISTS Pantry;
CREATE TABLE Pantry(
    pantry_id SERIAL PRIMARY KEY,
    ownername VARCHAR(255),
    FOREIGN KEY (ownername) REFERENCES Users(username)
);

DROP TABLE IF EXISTS Pantry_Food;
CREATE TABLE Pantry_Food(
    pantry_id SERIAL,
    food_name VARCHAR(255),
    CONSTRAINT pantry_food_unique_food_name UNIQUE(food_name),
    FOREIGN KEY (pantry_id) REFERENCES Pantry(pantry_id),
    FOREIGN KEY (food_name) REFERENCES Foods(food_name)
);

DROP TABLE IF EXISTS Pantry_Ingredients;
CREATE TABLE Pantry_Ingredients(
    pantry_id SERIAL,
    ing_name VARCHAR(255) NOT NULL,
    quantity FLOAT NOT NULL,
    measurement VARCHAR(8) NULL,
    FOREIGN KEY (pantry_id) REFERENCES Pantry(pantry_id),
    FOREIGN KEY (ing_name) REFERENCES Pantry_Food(food_name)
);

