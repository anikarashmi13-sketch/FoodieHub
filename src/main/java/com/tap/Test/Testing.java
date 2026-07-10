package com.tap.Test;

import java.util.List;

import com.tap.DAOImpl.RestaurantDAOImpl;
import com.tap.model.Restaurant;

public class Testing {

    public static void main(String[] args) {

        RestaurantDAOImpl dao = new RestaurantDAOImpl();

        List<Restaurant> list = dao.getAllRestaurants();

        for (Restaurant r : list) {

            System.out.println(r);
        }
    }
}