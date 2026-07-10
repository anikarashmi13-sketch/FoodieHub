-- SQL Script to insert missing menus for restaurants 4 to 10

-- Burger King (Rest ID: 4)
INSERT INTO menu (restaurantId, itemName, price, description, isAvailable, imagePath, rating, foodType) VALUES
(4, 'Veg Whopper', 149.00, 'Our signature Whopper with a crispy veg patty, fresh onions, tomatoes, and mayo.', 1, 'images/menu/veg-burger.jpg', 4.5, 'Veg'),
(4, 'Chicken Whopper', 179.00, 'Flame-grilled chicken patty with fresh lettuce, tomatoes, and creamy mayo.', 1, 'images/menu/chicken-burger.jpg', 4.7, 'Non-Veg'),
(4, 'Crispy Veg Burger', 79.00, 'Crispy veg patty in a soft bun with fresh onions and mayo.', 1, 'images/menu/veg-burger.jpg', 4.2, 'Veg'),
(4, 'Fiery Chicken Burger', 159.00, 'Spicy crispy chicken patty for those who love the heat.', 1, 'images/menu/chicken-burger.jpg', 4.6, 'Non-Veg'),
(4, 'King Fries (Large)', 99.00, 'Golden, crispy, and perfectly salted french fries.', 1, 'images/menu/french-fries.jpg', 4.8, 'Veg'),
(4, 'Chicken Wings (4 pcs)', 149.00, 'Juicy and spicy chicken wings.', 1, 'images/menu/chicken-wings.jpg', 4.4, 'Non-Veg'),
(4, 'Coke (Medium)', 79.00, 'Refreshing Coca-Cola.', 1, 'images/menu/coke.jpg', 4.5, 'Veg'),
(4, 'Chocolate Brownie', 109.00, 'Rich and gooey chocolate brownie.', 1, 'images/menu/brownie.jpg', 4.8, 'Veg');

-- McDonalds (Rest ID: 5)
INSERT INTO menu (restaurantId, itemName, price, description, isAvailable, imagePath, rating, foodType) VALUES
(5, 'McAloo Tikki Burger', 59.00, 'The classic McAloo Tikki with a balanced spice mix and sweet tomato mayo.', 1, 'images/menu/veg-burger.jpg', 4.6, 'Veg'),
(5, 'McSpicy Chicken Burger', 189.00, 'Tender and juicy chicken patty coated in spicy, crispy batter.', 1, 'images/menu/chicken-burger.jpg', 4.8, 'Non-Veg'),
(5, 'McSpicy Paneer Burger', 179.00, 'Crispy, spicy paneer patty with creamy sauce.', 1, 'images/menu/veg-burger.jpg', 4.5, 'Veg'),
(5, 'McChicken', 129.00, 'Classic chicken burger with lettuce and mayo.', 1, 'images/menu/chicken-burger.jpg', 4.4, 'Non-Veg'),
(5, 'Medium Fries', 109.00, 'World famous crispy french fries.', 1, 'images/menu/french-fries.jpg', 4.9, 'Veg'),
(5, 'Chicken Nuggets (6 pcs)', 149.00, 'Bite-sized pieces of crispy chicken.', 1, 'images/menu/fried-chicken.jpg', 4.7, 'Non-Veg'),
(5, 'Sprite (Medium)', 79.00, 'Lemon-lime flavored cold beverage.', 1, 'images/menu/sprite.jpg', 4.3, 'Veg'),
(5, 'McFlurry Oreo', 119.00, 'Vanilla soft serve with crushed Oreo cookies.', 1, 'images/menu/ice-cream.jpg', 4.8, 'Veg');

-- Subway (Rest ID: 6)
INSERT INTO menu (restaurantId, itemName, price, description, isAvailable, imagePath, rating, foodType) VALUES
(6, 'Veggie Delite Sub', 169.00, 'A fresh mix of lettuce, tomatoes, green peppers, and onions.', 1, 'images/menu/veg-burger.jpg', 4.3, 'Veg'),
(6, 'Paneer Tikka Sub', 219.00, 'Marinated paneer chunks with veggies and your choice of sauces.', 1, 'images/menu/paneer-pizza.jpg', 4.6, 'Veg'),
(6, 'Roasted Chicken Sub', 229.00, 'Tender roasted chicken breast strips.', 1, 'images/menu/chicken-burger.jpg', 4.5, 'Non-Veg'),
(6, 'Chicken Teriyaki Sub', 249.00, 'Chicken strips in a sweet and savory teriyaki glaze.', 1, 'images/menu/chicken-burger.jpg', 4.7, 'Non-Veg'),
(6, 'Oatmeal Raisin Cookie', 69.00, 'Freshly baked oatmeal raisin cookie.', 1, 'images/menu/chocolate-cake.jpg', 4.2, 'Veg'),
(6, 'Potato Chips', 40.00, 'Crunchy potato chips.', 1, 'images/menu/french-fries.jpg', 4.0, 'Veg'),
(6, 'Pepsi', 60.00, 'Chilled Pepsi.', 1, 'images/menu/pepsi.jpg', 4.1, 'Veg'),
(6, 'Chicken Slice Wrap', 149.00, 'Chicken slices with fresh veggies wrapped in a soft tortilla.', 1, 'images/menu/chicken-burger.jpg', 4.4, 'Non-Veg');

-- Meghana Foods (Rest ID: 7)
INSERT INTO menu (restaurantId, itemName, price, description, isAvailable, imagePath, rating, foodType) VALUES
(7, 'Chicken Boneless Biryani', 299.00, 'Signature biryani with boneless chicken pieces and aromatic spices.', 1, 'images/menu/chicken-biryani.jpg', 4.9, 'Non-Veg'),
(7, 'Mutton Biryani', 349.00, 'Rich and flavorful mutton biryani cooked to perfection.', 1, 'images/menu/mutton-biryani.jpg', 4.8, 'Non-Veg'),
(7, 'Meghana Special Biryani', 329.00, 'Our special biryani with a unique blend of spices.', 1, 'images/menu/chicken-biryani.jpg', 4.9, 'Non-Veg'),
(7, 'Paneer Biryani', 269.00, 'Fragrant basmati rice cooked with spicy paneer chunks.', 1, 'images/menu/veg-biryani.jpg', 4.6, 'Veg'),
(7, 'Chilli Chicken', 249.00, 'Spicy and tangy chicken starter.', 1, 'images/menu/chicken-wings.jpg', 4.5, 'Non-Veg'),
(7, 'Chicken 65', 239.00, 'Deep fried spicy chicken bites.', 1, 'images/menu/fried-chicken.jpg', 4.7, 'Non-Veg'),
(7, 'Sprite', 50.00, 'Cold beverage.', 1, 'images/menu/sprite.jpg', 4.0, 'Veg'),
(7, 'Vanilla Ice Cream', 90.00, 'Classic vanilla ice cream.', 1, 'images/menu/ice-cream.jpg', 4.4, 'Veg');

-- Empire Restaurant (Rest ID: 8)
INSERT INTO menu (restaurantId, itemName, price, description, isAvailable, imagePath, rating, foodType) VALUES
(8, 'Empire Special Chicken Biryani', 279.00, 'The famous Empire biryani loved by Bangaloreans.', 1, 'images/menu/chicken-biryani.jpg', 4.7, 'Non-Veg'),
(8, 'Mutton Biryani', 319.00, 'Traditional style mutton biryani.', 1, 'images/menu/mutton-biryani.jpg', 4.6, 'Non-Veg'),
(8, 'Tandoori Chicken (Half)', 299.00, 'Juicy chicken roasted in a traditional tandoor.', 1, 'images/menu/fried-chicken.jpg', 4.8, 'Non-Veg'),
(8, 'Butter Chicken', 289.00, 'Chicken cooked in a rich and creamy tomato sauce.', 1, 'images/menu/chicken-bucket.jpg', 4.8, 'Non-Veg'),
(8, 'Garlic Naan', 65.00, 'Soft Indian bread flavored with garlic and butter.', 1, 'images/menu/garlic-bread.jpg', 4.7, 'Veg'),
(8, 'Paneer Butter Masala', 249.00, 'Cottage cheese in a creamy tomato gravy.', 1, 'images/menu/paneer-pizza.jpg', 4.5, 'Veg'),
(8, 'Chicken Kabab', 219.00, 'Crispy and spicy chicken kababs.', 1, 'images/menu/chicken-wings.jpg', 4.6, 'Non-Veg'),
(8, 'Coke', 50.00, 'Chilled Coca-Cola.', 1, 'images/menu/coke.jpg', 4.2, 'Veg');

-- Udupi Palace (Rest ID: 9)
INSERT INTO menu (restaurantId, itemName, price, description, isAvailable, imagePath, rating, foodType) VALUES
(9, 'Masala Dosa', 95.00, 'Crispy crepe filled with spiced potato curry.', 1, 'images/menu/veg-pizza.jpg', 4.8, 'Veg'),
(9, 'Idli Vada Combo', 75.00, 'Two soft idlis and one crispy vada with chutney and sambar.', 1, 'images/menu/garlic-bread.jpg', 4.7, 'Veg'),
(9, 'South Indian Meals', 150.00, 'Complete traditional South Indian thali meal.', 1, 'images/menu/veg-biryani.jpg', 4.6, 'Veg'),
(9, 'Paneer Dosa', 120.00, 'Dosa filled with spiced paneer filling.', 1, 'images/menu/paneer-pizza.jpg', 4.5, 'Veg'),
(9, 'Veg Hakka Noodles', 160.00, 'Indo-Chinese style noodles with fresh vegetables.', 1, 'images/menu/noodles.jpg', 4.4, 'Veg'),
(9, 'Veg Fried Rice', 150.00, 'Stir-fried rice with mixed vegetables.', 1, 'images/menu/veg-biryani.jpg', 4.3, 'Veg'),
(9, 'Filter Coffee', 45.00, 'Authentic South Indian filter coffee.', 1, 'images/menu/coke.jpg', 4.9, 'Veg'),
(9, 'Gulaab Jamun', 60.00, 'Sweet milk solids soaked in sugar syrup.', 1, 'images/menu/brownie.jpg', 4.8, 'Veg');

-- Barbeque Nation (Rest ID: 10)
INSERT INTO menu (restaurantId, itemName, price, description, isAvailable, imagePath, rating, foodType) VALUES
(10, 'Chicken Tikka Skewers', 349.00, 'Spicy and smoky chicken tikka cooked on a grill.', 1, 'images/menu/chicken-wings.jpg', 4.8, 'Non-Veg'),
(10, 'Mutton Seekh Kebab', 399.00, 'Minced mutton spiced and grilled on skewers.', 1, 'images/menu/fried-chicken.jpg', 4.7, 'Non-Veg'),
(10, 'Paneer Tikka', 299.00, 'Cottage cheese cubes marinated and grilled.', 1, 'images/menu/paneer-pizza.jpg', 4.6, 'Veg'),
(10, 'Crispy Corn', 199.00, 'A Barbeque Nation special crispy sweet corn.', 1, 'images/menu/french-fries.jpg', 4.9, 'Veg'),
(10, 'BBQ Chicken Pizza', 399.00, 'Pizza topped with BBQ chicken and cheese.', 1, 'images/menu/chicken-pizza.jpg', 4.5, 'Non-Veg'),
(10, 'Veg Hakka Noodles', 249.00, 'Wok-tossed noodles with veggies.', 1, 'images/menu/noodles.jpg', 4.4, 'Veg'),
(10, 'Chicken Dum Biryani', 349.00, 'Aromatic biryani cooked in dum style.', 1, 'images/menu/chicken-biryani.jpg', 4.7, 'Non-Veg'),
(10, 'Brownie with Ice Cream', 199.00, 'Warm brownie served with vanilla ice cream.', 1, 'images/menu/brownie.jpg', 4.8, 'Veg'),
(10, 'Pepsi', 99.00, 'Chilled beverage.', 1, 'images/menu/pepsi.jpg', 4.1, 'Veg');
