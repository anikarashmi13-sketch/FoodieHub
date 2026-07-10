package com.tap.model;

public class CartItem {

    private int menuId;
    private String itemName;
    private double price;
    private int quantity;
    private String imagePath;
    private String description;
    private float rating;
    private String restaurantName;
  
    public CartItem() {

    }

    public CartItem(int menuId,
                    String itemName,
                    double price,
                    int quantity,
                    String imagePath,
                    String description,
                    String restaurantName,
                    float rating) {

        this.menuId = menuId;
        this.itemName = itemName;
        this.price = price;
        this.quantity = quantity;
        this.imagePath = imagePath;
        this.description = description;
        this.restaurantName = restaurantName;
        this.rating = rating;
    }

    public int getMenuId() {
        return menuId;
    }

    public void setMenuId(int menuId) {
        this.menuId = menuId;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    
    public String getRestaurantName() {
        return restaurantName;
    }

    public void setRestaurantName(String restaurantName) {
        this.restaurantName = restaurantName;
    }
    
    public float getRating() {
        return rating;
    }

    public void setRating(float rating) {
        this.rating = rating;
    }

}