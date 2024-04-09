CREATE EXTENSION pgcrypto;

CREATE ROLE chef;
GRANT SELECT, INSERT, DELETE ON Pantry, Recipes to chef;
GRANT SELECT ON Foods to chef;

CREATE ROLE customer;
GRANT SELECT, INSERT, DELETE ON Pantry to customer;
GRANT INSERT ON Reports to customer;

INSERT INTO Foods(food_name, food_type) VALUES
('Apple','Fruit'),
('Apricot', 'Fruit'),
('Blackberries','Fruit'),
('Banana', 'Fruit'),
('Orange', 'Fruit'),
('Blueberries', 'Fruit'),
('Strawberries', 'Fruit'),
('Cantaloupe','Fruit'),
('Cherry','Fruit'),
('Clementine','Fruit'),
('Cranberry','Fruit'),
('Dates','Fruit'),
('Dragon Fruit','Fruit'),
('Durian','Fruit'),
('Figs','Fruit'),
('Grapes','Fruit'),
('Grapefruit','Fruit'),
('Guava','Fruit'),
('Honeydew Melon','Fruit'),
('Jack Fruit', 'Fruit'),
('Jujube','Fruit'),
('Kiwi', 'Fruit'),
('Kumquat','Fruit'),
('Lemon','Fruit'),
('Lime','Fruit'),
('Lychee','Fruit'),
('Mandarin','Fruit'),
('Mango','Fruit'),
('Nectarine','Fruit'),
('Blood Orange', 'Fruit'),
('Papaya','Fruit'),
('Passion Fruit', 'Fruit'),
('Peach','Fruit'),
('Pear','Fruit'),
('Tomato','Fruit'),
('Permission','Fruit'),
('Pineapple', 'Fruit'),
('Plum','Fruit'),
('Pomegranate','Fruit'),
('Prickly Pear', 'Fruit'),
('Pommelo','Fruit'),
('Pulsan','Fruit'),
('Quince', 'Fruit'),
('Raspberry', 'Fruit'),
('Red Currant', 'Fruit'),
('Rambutan', 'Fruit'),
('Sapodilla', 'Fruit'),
('Sapote', 'Fruit'),
('Soursop', 'Fruit'),
('Star Apple', 'Fruit'),
('Star Fruit', 'Fruit'),
('Strawberry', 'Fruit'),
('Tamarillo', 'Fruit'),
('Tamarind', 'Fruit'),
('Tangerine', 'Fruit'),
('Ugli Fruit', 'Fruit'),
('Watermelon', 'Fruit'),
('White Currant', 'Fruit'),
('Yellow Watermelon', 'Fruit'),
('Artichoke', 'Vegetable'),
('Arugula', 'Vegetable'),
('Asparagus', 'Vegetable'),
('Aubergine', 'Vegetable'),
('Bamboo Shoots', 'Vegetable'),
('Beetroot', 'Vegetable'),
('Bell Pepper', 'Vegetable'),
('Black Bean', 'Vegetable'),
('Broccoli', 'Vegetable'),
('Brussels Sprouts', 'Vegetable'),
('Cabbage', 'Vegetable'),
('Carrot', 'Vegetable'),
('Cauliflower', 'Vegetable'),
('Celery', 'Vegetable'),
('Chard', 'Vegetable'),
('Chickpeas', 'Vegetable'),
('Collard Greens', 'Vegetable'),
('Corn', 'Vegetable'),
('Cucumber', 'Vegetable'),
('Daikon', 'Vegetable'),
('Dandelion Greens', 'Vegetable'),
('Eggplant', 'Vegetable'),
('Tofu','Vegetable'),
('Endive', 'Vegetable'),
('Fennel', 'Vegetable'),
('Garlic', 'Vegetable'),
('Ginger', 'Vegetable'),
('Green Bean', 'Vegetable'),
('Horseradish', 'Vegetable'),
('Kale', 'Vegetable'),
('Leek', 'Vegetable'),
('Lettuce', 'Vegetable'),
('Mushroom', 'Vegetable'),
('Mustard Greens', 'Vegetable'),
('Okra', 'Vegetable'),
('Onion', 'Vegetable'),
('Parsnip', 'Vegetable'),
('Pea', 'Vegetable'),
('Peanut', 'Vegetable'),
('Pepper', 'Vegetable'),
('Potato', 'Vegetable'),
('Pumpkin', 'Vegetable'),
('Radish', 'Vegetable'),
('Rhubarb', 'Vegetable'),
('Rutabaga', 'Vegetable'),
('Salsify', 'Vegetable'),
('Scallion', 'Vegetable'),
('Shallot', 'Vegetable'),
('Spinach', 'Vegetable'),
('Squash', 'Vegetable'),
('Sweet Potato', 'Vegetable'),
('Taro', 'Vegetable'),
('Tomatillo', 'Vegetable'),
('Turnip', 'Vegetable'),
('Watercress', 'Vegetable'),
('Yam', 'Vegetable'),
('Zucchini', 'Vegetable'),
('Acorn Squash', 'Vegetable'),
('Butternut Squash', 'Vegetable'),
('Chayote', 'Vegetable'),
('Delicata', 'Vegetable'),
('Hubbard Squash', 'Vegetable'),
('Spaghetti Squash', 'Vegetable'),
('Turban Squash', 'Vegetable'),
('Bok Choy', 'Vegetable'),
('Napa Cabbage', 'Vegetable'),
('Kohlrabi', 'Vegetable'),
('Mizuna', 'Vegetable'),
('Tatsoi', 'Vegetable'),
('Chicken Breast', 'Meat'),
('Chicken Thigh', 'Meat'),
('Chicken Drumstick', 'Meat'),
('Chicken Wing', 'Meat'),
('Turkey Breast', 'Meat'),
('Ground Turkey', 'Meat'),
('Duck Breast', 'Meat'),
('Quail', 'Meat'),
('Pheasant', 'Meat'),
('Beef Ribeye Steak', 'Meat'),
('Beef Tenderloin', 'Meat'),
('Ground Beef', 'Meat'),
('Beef Brisket', 'Meat'),
('Beef Ribs', 'Meat'),
('Pork Chops', 'Meat'),
('Pork Belly', 'Meat'),
('Pork Tenderloin', 'Meat'),
('Ground Pork', 'Meat'),
('Bacon', 'Meat'),
('Ham', 'Meat'),
('Lamb Chops', 'Meat'),
('Lamb Shank', 'Meat'),
('Ground Lamb', 'Meat'),
('Lamb Loin', 'Meat'),
('Venison Steaks', 'Meat'),
('Rabbit', 'Meat'),
('Goat Meat', 'Meat'),
('Buffalo Meat', 'Meat'),
('Elk Meat', 'Meat'),
('Moose Meat', 'Meat'),
('Ostrich Steak', 'Meat'),
('Alligator Meat', 'Meat'),
('Wild Boar Meat', 'Meat'),
('Kangaroo Meat', 'Meat'),
('Guinea Fowl', 'Meat'),
('Cornish Hen', 'Meat'),
('Partridge', 'Meat'),
('Squab', 'Meat'),
('Emu Meat', 'Meat'),
('Duck Foie Gras', 'Meat'),
('Beef Liver', 'Meat'),
('Chicken Sausages', 'Meat'),
('Pork Sausages', 'Meat'),
('Beef Jerky', 'Meat'),
('Pork Ribs', 'Meat'),
('Beef T-Bone Steak', 'Meat'),
('Pork Loin Roast', 'Meat'),
('Lamb Ribs', 'Meat'),
('Beef Chuck Roast', 'Meat'),
('Pork Shoulder', 'Meat'),
('Lamb Leg', 'Meat'),
('Mutton Shoulder', 'Meat'),
('Mutton Chops', 'Meat'),
('Salted Beef', 'Meat'),
('Corned Beef', 'Meat'),
('Pastrami', 'Meat'),
('Pulled Pork', 'Meat'),
('Smoked Turkey', 'Meat'),
('Venison Jerky', 'Meat'),
('Dried Duck Breast', 'Meat'),
('Beef Paillard', 'Meat'),
('Pork Knuckle', 'Meat'),
('Beef Heart', 'Meat'),
('Pork Liver', 'Meat'),
('Chicken Liver', 'Meat'),
('Turkey Legs', 'Meat'),
('Duck Legs', 'Meat'),
('Spare Ribs', 'Meat'),
('Sirloin Steak', 'Meat'),
('Skirt Steak', 'Meat'),
('Flank Steak', 'Meat'),
('Hanger Steak', 'Meat'),
('Picanha', 'Meat'),
('Tri-Tip', 'Meat'),
('Beef Tongue', 'Meat'),
('Pork Cheeks', 'Meat'),
('Lamb Heart', 'Meat'),
('Lamb Tongue', 'Meat'),
('Bison Steak', 'Meat'),
('Rack of Lamb', 'Meat'),
('Lamb Liver', 'Meat'),
('Goose Breast', 'Meat'),
('Snail Meat', 'Meat'),
('Frog Legs', 'Meat'),
('Rattlesnake Meat', 'Meat'),
('Turtle Meat', 'Meat'),
('Pheasant Breast', 'Meat'),
('Wheat', 'Grain'),
('Whole Wheat Flour', 'Grain'),
('White Rice', 'Grain'),
('Brown Rice', 'Grain'),
('Basmati Rice', 'Grain'),
('Jasmine Rice', 'Grain'),
('Wild Rice', 'Grain'),
('Black Rice', 'Grain'),
('Red Rice', 'Grain'),
('Quinoa', 'Grain'),
('Amaranth', 'Grain'),
('Buckwheat', 'Grain'),
('Millet', 'Grain'),
('Sorghum', 'Grain'),
('Teff', 'Grain'),
('Barley', 'Grain'),
('Pearled Barley', 'Grain'),
('Oats', 'Grain'),
('Steel-Cut Oats', 'Grain'),
('Rolled Oats', 'Grain'),
('Instant Oats', 'Grain'),
('Popcorn', 'Grain'),
('Polenta', 'Grain'),
('Cornmeal', 'Grain'),
('Rye', 'Grain'),
('Rye Flour', 'Grain'),
('Spelt', 'Grain'),
('Spelt Flour', 'Grain'),
('Kamut', 'Grain'),
('Farro', 'Grain'),
('Bulgur Wheat', 'Grain'),
('Couscous', 'Grain'),
('Semolina', 'Grain'),
('Durum Wheat', 'Grain'),
('Triticale', 'Grain'),
('Rice Flour', 'Grain'),
('Chickpea Flour', 'Grain'),
('Buckwheat Flour', 'Grain'),
('Corn Flour', 'Grain'),
('Oat Flour', 'Grain'),
('Rye Bread', 'Grain'),  
('Pita Bread', 'Grain'),
('Sourdough Bread', 'Grain'),
('Baguette', 'Grain'),
('Multigrain Bread', 'Grain'),
('Rice Noodles', 'Grain'),
('Whole Wheat Pasta', 'Grain'),
('Rice Paper', 'Grain'),
('Matzo', 'Grain'),
('Bread Crumbs','Grain'),
('Panko','Grain'),
('Tortellini','Grain'),
('Ravioli','Grain'),
('Fettuccine','Grain'),
('Spaghetti','Grain'),
('Cavatappi','Grain'),
('Angel Hair','Grain'),
('Farfalle','Grain'),
('Penne','Grain'),
('Ditalini','Grain'),
('Orzo','Grain'),
('Pastina','Grain'),
('Egg Noodle','Grain'),
('Macaroni','Grain'),
('Lasagna','Grain'),
('Gnocchi','Grain'),
('Linguine','Grain'),
('Manicotti','Grain'),
('Orecchiette','Grain'),
('Pappardelle','Grain'),
('Bucatini','Grain'),
('Rigatoni','Grain'),
('Rotini','Grain'),
('Ziti','Grain'),
('Ketchup', 'Condiment'),
('Mustard', 'Condiment'),
('Mayonnaise', 'Condiment'),
('Soy Sauce', 'Condiment'),
('Hot Sauce', 'Condiment'),
('Barbecue Sauce', 'Condiment'),
('Sriracha', 'Condiment'),
('Horseradish Sauce', 'Condiment'),
('Tartar Sauce', 'Condiment'),
('Balsamic Vinegar', 'Condiment'),
('Apple Cider Vinegar', 'Condiment'),
('Honey Mustard', 'Condiment'),
('Salsa', 'Condiment'),
('Guacamole', 'Condiment'),
('Hummus', 'Condiment'),
('Pesto', 'Condiment'),
('Relish', 'Condiment'),
('Chutney', 'Condiment'),
('Fish Sauce', 'Condiment'),
('Teriyaki Sauce', 'Condiment'),
('Hoisin Sauce', 'Condiment'),
('Oyster Sauce', 'Condiment'),
('Worcestershire Sauce', 'Condiment'),
('Aioli', 'Condiment'),
('Tzatziki', 'Condiment'),
('Harissa', 'Condiment'),
('Chimichurri', 'Condiment'),
('Marmite', 'Condiment'),
('Vegemite', 'Condiment'),
('Tapenade', 'Condiment'),
('Cocktail Sauce', 'Condiment'),
('Buffalo Sauce', 'Condiment'),
('Gochujang', 'Condiment'),
('Ssamjang', 'Condiment'),
('Tahini', 'Condiment'),
('Soybean Paste', 'Condiment'),
('Miso', 'Condiment'),
('Dijon Mustard', 'Condiment'),
('Creole Mustard', 'Condiment'),
('Sweet Chili Sauce', 'Condiment'),
('Curry Paste', 'Condiment'),
('Anchovy Paste', 'Condiment'),
('Pickle Relish', 'Condiment'),
('Cranberry Sauce', 'Condiment'),
('Allspice', 'Spice'),
('Salt','Spice'),
('Anise Seed', 'Spice'),
('Asafoetida', 'Spice'),
('Basil', 'Spice'),
('Bay Leaves', 'Spice'),
('Black Pepper', 'Spice'),
('Cardamom', 'Spice'),
('Cayenne Pepper', 'Spice'),
('Celery Seed', 'Spice'),
('Chili Powder', 'Spice'),
('Cinnamon', 'Spice'),
('Cloves', 'Spice'),
('Coriander Seed', 'Spice'),
('Cumin', 'Spice'),
('Curry Powder', 'Spice'),
('Dill Seed', 'Spice'),
('Fennel Seed', 'Spice'),
('Fenugreek', 'Spice'),
('Garlic Powder', 'Spice'),
('Mustard Seed', 'Spice'),
('Nutmeg', 'Spice'),
('Onion Powder', 'Spice'),
('Oregano', 'Spice'),
('Paprika', 'Spice'),
('Parsley', 'Spice'),
('Peppercorn', 'Spice'),
('Poppy Seed', 'Spice'),
('Red Pepper Flakes', 'Spice'),
('Rosemary', 'Spice'),
('Saffron', 'Spice'),
('Sage', 'Spice'),
('Savory', 'Spice'),
('Star Anise', 'Spice'),
('Sumac', 'Spice'),
('Tarragon', 'Spice'),
('Thyme', 'Spice'),
('Turmeric', 'Spice'),
('Vanilla Bean', 'Spice'),
('White Pepper', 'Spice'),
('Caraway Seed', 'Spice'),
('Chervil', 'Spice'),
('Chive', 'Spice'),
('Cilantro', 'Spice'),
('Juniper Berries', 'Spice'),
('Lavender', 'Spice'),
('Lemongrass', 'Spice'),
('Marjoram', 'Spice'),
('Mint', 'Spice'),
('Olive Oil', 'Oil'),
('Extra Virgin Olive Oil', 'Oil'),
('Coconut Oil', 'Oil'),
('Avocado Oil', 'Oil'),
('Palm Oil', 'Oil'),
('Canola Oil', 'Oil'),
('Vegetable Oil', 'Oil'),
('Sunflower Oil', 'Oil'),
('Safflower Oil', 'Oil'),
('Corn Oil', 'Oil'),
('Peanut Oil', 'Oil'),
('Sesame Oil', 'Oil'),
('Grapeseed Oil', 'Oil'),
('Soybean Oil', 'Oil'),
('Rice Bran Oil', 'Oil'),
('Walnut Oil', 'Oil'),
('Almond Oil', 'Oil'),
('Hazelnut Oil', 'Oil'),
('Macadamia Nut Oil', 'Oil'),
('Pistachio Oil', 'Oil'),
('Pumpkin Seed Oil', 'Oil'),
('Flaxseed Oil', 'Oil'),
('Hemp Seed Oil', 'Oil'),
('Mustard Oil', 'Oil'),
('Black Seed Oil', 'Oil'),
('Apricot Kernel Oil', 'Oil'),
('Argan Oil', 'Oil'),
('Borage Oil', 'Oil'),
('Camellia Oil', 'Oil'),
('Castor Oil', 'Oil'),
('Chili Oil', 'Oil'),
('Clove Oil', 'Oil'),
('Cod Liver Oil', 'Oil'),
('Evening Primrose Oil', 'Oil'),
('Fenugreek Oil', 'Oil'),
('Fish Oil', 'Oil'),
('Garlic Oil', 'Oil'),
('Ginger Oil', 'Oil'),
('Jojoba Oil', 'Oil'),
('Kukui Nut Oil', 'Oil'),
('Lavender Oil', 'Oil'),
('Lemon Oil', 'Oil'),
('Moringa Oil', 'Oil'),
('Neem Oil', 'Oil'),
('Oregano Oil', 'Oil'),
('Peppermint Oil', 'Oil'),
('Pomegranate Seed Oil', 'Oil'),
('Rosehip Oil', 'Oil'),
('Sea Buckthorn Oil', 'Oil'),
('Tea Tree Oil', 'Oil'),
('Whole Milk', 'Dairy'),
('Skim Milk', 'Dairy'),
('Buttermilk', 'Dairy'),
('Heavy Cream', 'Dairy'),
('Sour Cream', 'Dairy'),
('Cottage Cheese', 'Dairy'),
('Cream Cheese', 'Dairy'),
('Yogurt', 'Dairy'),
('Greek Yogurt', 'Dairy'),
('Butter', 'Dairy'),
('Ghee', 'Dairy'),
('Cheddar Cheese', 'Dairy'),
('Mozzarella Cheese', 'Dairy'),
('Parmesan Cheese', 'Dairy'),
('Feta Cheese', 'Dairy'),
('Gouda Cheese', 'Dairy'),
('Brie Cheese', 'Dairy'),
('Camembert Cheese', 'Dairy'),
('Blue Cheese', 'Dairy'),
('Roquefort Cheese', 'Dairy'),
('Monterey Jack', 'Dairy'),
('Swiss Cheese', 'Dairy'),
('Emmental Cheese', 'Dairy'),
('Ricotta Cheese', 'Dairy'),
('Mascarpone', 'Dairy'),
('Paneer', 'Dairy'),
('Halloumi', 'Dairy'),
('Provolone Cheese', 'Dairy'),
('Colby Cheese', 'Dairy'),
('Manchego Cheese', 'Dairy'),
('Edam Cheese', 'Dairy'),
('Gorgonzola Cheese', 'Dairy'),
('Havarti Cheese', 'Dairy'),
('Stilton Cheese', 'Dairy'),
('Chèvre (Goat Cheese)', 'Dairy'),
('Pecorino Romano', 'Dairy'),
('Quark', 'Dairy'),
('Kefir', 'Dairy'),
('Clotted Cream', 'Dairy'),
('Crème Fraîche', 'Dairy'),
('Ice Cream', 'Dairy'),
('Gelato', 'Dairy'),
('Sherbet', 'Dairy'),
('Frozen Yogurt', 'Dairy'),
('Whey Protein', 'Dairy'),
('Condensed Milk', 'Dairy'),
('Evaporated Milk', 'Dairy'),
('Powdered Milk', 'Dairy'),
('Lactose-Free Milk', 'Dairy'),
('Oat Milk', 'Dairy'),
('Almond Milk', 'Dairy'),
('Soy Milk','Dairy'),
('Salmon', 'Seafood'),
('Tuna', 'Seafood'),
('Trout', 'Seafood'),
('Halibut', 'Seafood'),
('Cod', 'Seafood'),
('Haddock', 'Seafood'),
('Sardines', 'Seafood'),
('Mackerel', 'Seafood'),
('Anchovies', 'Seafood'),
('Herring', 'Seafood'),
('Sea Bass', 'Seafood'),
('Swordfish', 'Seafood'),
('Mahi Mahi', 'Seafood'),
('Grouper', 'Seafood'),
('Snapper', 'Seafood'),
('Shrimp', 'Seafood'),
('Lobster', 'Seafood'),
('Crab', 'Seafood'),
('Clams', 'Seafood'),
('Oysters', 'Seafood'),
('Mussels', 'Seafood'),
('Squid', 'Seafood'),
('Octopus', 'Seafood'),
('Scallops', 'Seafood'),
('Caviar', 'Seafood'),
('Almonds', 'Nut'),
('Walnuts', 'Nut'),
('Cashews', 'Nut'),
('Pistachios', 'Nut'),
('Hazelnuts', 'Nut'),
('Brazil Nuts', 'Nut'),
('Pecans', 'Nut'),
('Macadamia Nuts', 'Nut'),
('Pine Nuts', 'Nut'),
('Peanuts', 'Nut'),
('Peanut Butter','Nut'),
('Chestnuts', 'Nut'),
('Almond Butter', 'Nut'),
('Cashew Butter', 'Nut'),
('Roasted Almonds', 'Nut'),
('Salted Cashews', 'Nut'),
('Chocolate-covered Hazelnuts', 'Nut'),
('Candied Walnuts', 'Nut'),
('Spiced Pecans', 'Nut'),
('Honey Roasted Peanuts', 'Nut'),
('Pistachio Paste', 'Nut'),
('Peanut Flour', 'Nut'),
('Almond Flour', 'Nut'),
('Sunflower Seeds', 'Seed'),
('Pumpkin Seeds', 'Seed'),
('Chia Seeds', 'Seed'),
('Sesame Seeds', 'Seed'),
('Flaxseeds', 'Seed'),
('Hemp Seeds', 'Seed'),
('Poppy Seeds', 'Seed'),
('Pomegranate Seeds', 'Seed'),
('Grape Seeds', 'Seed'),
('Mustard Seeds', 'Seed'),
('Fennel Seeds', 'Seed'),
('Coriander Seeds', 'Seed'),
('Cumin Seeds', 'Seed'),
('Caraway Seeds', 'Seed'),
('Anise Seeds', 'Seed'),
('Dill Seeds', 'Seed'),
('Cardamom Seeds', 'Seed'),
('Black Sesame Seeds', 'Seed'),
('Watermelon Seeds', 'Seed'),
('Sugar', 'Sweetener'),
('Honey', 'Sweetener'),
('Maple Syrup', 'Sweetener'),
('Agave Nectar', 'Sweetener'),
('Stevia', 'Sweetener'),
('Aspartame', 'Sweetener'),
('Sucralose', 'Sweetener'),
('Saccharin', 'Sweetener'),
('Xylitol', 'Sweetener'),
('Erythritol', 'Sweetener'),
('Monk Fruit Sweetener', 'Sweetener'),
('Sorbitol', 'Sweetener'),
('Mannitol', 'Sweetener'),
('Molasses', 'Sweetener'),
('Coconut Sugar', 'Sweetener'),
('Date Sugar', 'Sweetener'),
('Brown Sugar', 'Sweetener'),
('Powdered Sugar', 'Sweetener'),
('Corn Syrup', 'Sweetener'),
('High Fructose Corn Syrup', 'Sweetener'),
('Barley Malt Syrup', 'Sweetener'),
('Rice Syrup', 'Sweetener'),
('Dextrose', 'Sweetener'),
('Fructose', 'Sweetener'),
('Lactose', 'Sweetener'),
('Apple Juice', 'Juice'),
('Orange Juice', 'Juice'),
('Carrot Juice', 'Juice'),
('Beet Juice', 'Juice'),
('Grape Juice', 'Juice'),
('Tomato Juice', 'Juice'),
('Pineapple Juice', 'Juice'),
('Cranberry Juice', 'Juice'),
('Pomegranate Juice', 'Juice'),
('Lemon Juice', 'Juice'),
('Lime Juice', 'Juice'),
('Grapefruit Juice', 'Juice'),
('Mango Juice', 'Juice'),
('Papaya Juice', 'Juice'),
('Watermelon Juice', 'Juice'),
('Peach Juice', 'Juice'),
('Pear Juice', 'Juice'),
('Blackberry Juice', 'Juice'),
('Raspberry Juice', 'Juice'),
('Blueberry Juice', 'Juice'),
('Kiwi Juice', 'Juice'),
('Strawberry Juice', 'Juice'),
('Cucumber Juice', 'Juice'),
('Celery Juice', 'Juice'),
('Spinach Juice', 'Juice'),
('Ranch Dressing', 'Dressing'),
('Italian Dressing', 'Dressing'),
('Blue Cheese Dressing', 'Dressing'),
('French Dressing', 'Dressing'),
('Thousand Island Dressing', 'Dressing'),
('Caesar Dressing', 'Dressing'),
('Greek Dressing', 'Dressing'),
('Balsamic Vinaigrette', 'Dressing'),
('Apple Cider Vinaigrette', 'Dressing'),
('Honey Mustard Dressing', 'Dressing'),
('Sesame Ginger Dressing', 'Dressing'),
('Poppy Seed Dressing', 'Dressing'),
('Raspberry Vinaigrette', 'Dressing'),
('Cilantro Lime Dressing', 'Dressing'),
('Lemon Herb Dressing', 'Dressing'),
('Creamy Avocado Dressing', 'Dressing'),
('Tahini Dressing', 'Dressing'),
('Asian Sesame Dressing', 'Dressing'),
('Chipotle Dressing', 'Dressing'),
('Miso Dressing', 'Dressing'),
('Roasted Garlic Dressing', 'Dressing'),
('Buttermilk Herb Dressing', 'Dressing'),
('Chimichurri Sauce', 'Dressing'),
('Pesto Dressing', 'Dressing'),
('Sriracha Mayo Dressing', 'Dressing'),
('Baking Powder','Other'),
('Baking Soda', 'Other'),
('Cornstarch','Other'),
('Gelatin','Other'),
('Vanilla Extract','Other')
ON CONFLICT (food_name) 
DO NOTHING;

--INSERT INTO Recipes (recipe_name, time_added, author) 
--VALUES ('Tomato Basil Pasta', CURRENT_DATE, 'no21b');

--INSERT INTO Recipes (recipe_name, time_added, author) 
--VALUES ('Sphagetti Bolognese', CURRENT_DATE, 'no21b');

--INSERT INTO Recipe_Foods (recipe_id, food_name)
--VALUES
--(1, 'Tomato'),
--(1, 'Basil'),
--(1, 'Gnocchi'),
--(1, 'Olive Oil'),
--(1, 'Garlic'),
--(1, 'Salt'),
--(1, 'Pepper');

--INSERT INTO Recipe_Foods (recipe_id, food_name)
--VALUES 
--(2, 'Penne'),
--(2, 'Salted Beef'),
--(2, 'Olive Oil'),
--(2, 'Garlic'),
--(2, 'Salt'),
--(2, 'Pepper');

--INSERT INTO Recipe_Ingredients (recipe_id, ing_name, quantity, measurement) VALUES
--(1, 'Tomato', 2, 'cups'),
--(1, 'Basil', 0.5, 'cup'),
--(1, 'Gnocchi', 8, 'ounces'),
--(1, 'Olive Oil', 2, 'table'),
--(1, 'Garlic', 2, 'cloves'),
--(1, 'Salt', 1, 'teaspoon'),
--(1, 'Pepper', 0.5, 'teaspoon');

--INSERT INTO Recipe_Ingredients (recipe_id, ing_name, quantity, measurement) VALUES
--(2, 'Penne', 2, 'cups'),
--(2, 'Salted Beef', 0.5, 'cup'),
--(2, 'Olive Oil', 2, 'table'),
--(2, 'Garlic', 2, 'cloves'),
--(2, 'Salt', 1, 'teaspoon'),
--(2, 'Pepper', 0.5, 'teaspoon');

--INSERT INTO Steps (recipe_id, step_description, step_number) VALUES
--(1, 'Boil water in a large pot.', 1),
--(1, 'Add gnocchi and cook according to the package instructions.', 2),
--(1, 'Heat olive oil in a pan. Add garlic and sauté until golden.', 3),
--(1, 'Add chopped tomatoes and basil to the pan. Season with salt and pepper.', 4),
--(1, 'Drain gnocchi and add to the pan. Toss to coat.', 5),
--(1, 'Serve hot, garnished with more fresh basil.', 6);


--INSERT INTO Steps (recipe_id, step_description, step_number) VALUES
--(2, 'Cook penne pasta in boiling water until al dente. Drain and set aside.', 1),
--(2, 'In a separate pan, heat olive oil and cook garlic until fragrant.', 2),
--(2, 'Add salted beef and cook until browned.', 3),
--(2, 'Combine cooked penne with beef mixture in a pot.', 4),
--(2, 'Serve warm with a sprinkle of pepper.', 5);
