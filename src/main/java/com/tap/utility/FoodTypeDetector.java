package com.tap.utility;

public class FoodTypeDetector {

    public static String detectFoodType(String itemName, String description) {

        String text = (itemName + " " + description).toLowerCase();

        String[] nonVegItems = {
        	    "chicken",
        	    "mutton",
        	    "fish",
        	    "egg",
        	    "prawn",
        	    "shrimp",
        	    "crab",
        	    "beef",
        	    "pork",
        	    "bacon",
        	    "ham",
        	    "sausage",
        	    "pepperoni",
        	    "turkey",
        	    "seafood",
        	    "lamb",
        	    "keema",
        	    "tuna",
        	    "salmon",
        	    "anchovy"
        	};

        for (String item : nonVegItems) {

            if (text.contains(item)) {

                return "Non-Veg";
            }
        }

        return "Veg";
    }
}