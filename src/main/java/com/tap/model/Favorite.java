package com.tap.model;

public class Favorite {

    private int favoriteId;
    private int userId;
    private int restaurantId;

    public Favorite() {

    }

    public Favorite(int userId, int restaurantId) {
        this.userId = userId;
        this.restaurantId = restaurantId;
    }

    public int getFavoriteId() {
        return favoriteId;
    }

    public void setFavoriteId(int favoriteId) {
        this.favoriteId = favoriteId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getRestaurantId() {
        return restaurantId;
    }

    public void setRestaurantId(int restaurantId) {
        this.restaurantId = restaurantId;
    }

}