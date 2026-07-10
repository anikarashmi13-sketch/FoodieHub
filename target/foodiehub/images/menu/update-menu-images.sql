-- ============================================================
-- FoodieHub - Update Menu Images
-- Run this in MySQL Workbench on the sweet_app database
-- ============================================================
-- Update imagePath for each menu item based on itemName.
-- Adjust the WHERE clause to match your actual item names.
-- ============================================================

-- PIZZAS
UPDATE menu SET imagePath = 'images/menu/veg-pizza.jpg' WHERE LOWER(itemName) LIKE '%veg%pizza%' AND LOWER(itemName) NOT LIKE '%paneer%' AND LOWER(itemName) NOT LIKE '%chicken%' AND LOWER(itemName) NOT LIKE '%margherita%';
UPDATE menu SET imagePath = 'images/menu/paneer-pizza.jpg' WHERE LOWER(itemName) LIKE '%paneer%pizza%';
UPDATE menu SET imagePath = 'images/menu/chicken-pizza.jpg' WHERE LOWER(itemName) LIKE '%chicken%pizza%';
UPDATE menu SET imagePath = 'images/menu/margherita-pizza.jpg' WHERE LOWER(itemName) LIKE '%margherita%';

-- BURGERS
UPDATE menu SET imagePath = 'images/menu/veg-burger.jpg' WHERE LOWER(itemName) LIKE '%veg%burger%';
UPDATE menu SET imagePath = 'images/menu/chicken-burger.jpg' WHERE LOWER(itemName) LIKE '%chicken%burger%';

-- CHICKEN
UPDATE menu SET imagePath = 'images/menu/chicken-bucket.jpg' WHERE LOWER(itemName) LIKE '%chicken%bucket%';
UPDATE menu SET imagePath = 'images/menu/fried-chicken.jpg' WHERE LOWER(itemName) LIKE '%fried%chicken%';
UPDATE menu SET imagePath = 'images/menu/chicken-wings.jpg' WHERE LOWER(itemName) LIKE '%chicken%wing%';

-- BIRYANI
UPDATE menu SET imagePath = 'images/menu/veg-biryani.jpg' WHERE LOWER(itemName) LIKE '%veg%biryani%';
UPDATE menu SET imagePath = 'images/menu/chicken-biryani.jpg' WHERE LOWER(itemName) LIKE '%chicken%biryani%';
UPDATE menu SET imagePath = 'images/menu/mutton-biryani.jpg' WHERE LOWER(itemName) LIKE '%mutton%biryani%';

-- SIDES
UPDATE menu SET imagePath = 'images/menu/french-fries.jpg' WHERE LOWER(itemName) LIKE '%french%fries%' OR LOWER(itemName) LIKE '%fries%';
UPDATE menu SET imagePath = 'images/menu/garlic-bread.jpg' WHERE LOWER(itemName) LIKE '%garlic%bread%';
UPDATE menu SET imagePath = 'images/menu/pasta.jpg' WHERE LOWER(itemName) LIKE '%pasta%';
UPDATE menu SET imagePath = 'images/menu/noodles.jpg' WHERE LOWER(itemName) LIKE '%noodle%';

-- DRINKS
UPDATE menu SET imagePath = 'images/menu/coke.jpg' WHERE LOWER(itemName) LIKE '%coke%' OR LOWER(itemName) LIKE '%coca%cola%';
UPDATE menu SET imagePath = 'images/menu/pepsi.jpg' WHERE LOWER(itemName) LIKE '%pepsi%';
UPDATE menu SET imagePath = 'images/menu/sprite.jpg' WHERE LOWER(itemName) LIKE '%sprite%';
UPDATE menu SET imagePath = 'images/menu/fanta.jpg' WHERE LOWER(itemName) LIKE '%fanta%';

-- DESSERTS
UPDATE menu SET imagePath = 'images/menu/chocolate-cake.jpg' WHERE LOWER(itemName) LIKE '%chocolate%cake%' OR LOWER(itemName) LIKE '%choco%cake%';
UPDATE menu SET imagePath = 'images/menu/brownie.jpg' WHERE LOWER(itemName) LIKE '%brownie%';
UPDATE menu SET imagePath = 'images/menu/ice-cream.jpg' WHERE LOWER(itemName) LIKE '%ice%cream%' OR LOWER(itemName) LIKE '%icecream%';

-- FALLBACK: Set a default image for any remaining menu items without an image
UPDATE menu SET imagePath = 'images/menu/veg-pizza.jpg' WHERE imagePath IS NULL OR imagePath = '';

-- Verify the updates
SELECT menuId, itemName, imagePath FROM menu;
