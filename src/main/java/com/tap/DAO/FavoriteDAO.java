package com.tap.DAO;

import java.util.List;

import com.tap.model.Restaurant;

public interface FavoriteDAO {

    boolean addFavorite(int userId, int restaurantId);

    boolean removeFavorite(int userId, int restaurantId);

    boolean isFavorite(int userId, int restaurantId);

    List<Restaurant> getFavoritesByUserId(int userId);

}