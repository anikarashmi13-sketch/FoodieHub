package com.tap.DAO;

import java.util.List;
import com.tap.model.Restaurant;

public interface RestaurantDAO {

    List<Restaurant> getAllRestaurants();

    Restaurant getRestaurantById(int id);
    List<Restaurant> searchRestaurants(String keyword);

    boolean addRestaurant(Restaurant restaurant);

    boolean updateRestaurant(Restaurant restaurant);

    boolean deleteRestaurant(int id);
}