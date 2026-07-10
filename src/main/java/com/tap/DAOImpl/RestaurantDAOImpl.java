package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.RestaurantDAO;
import com.tap.model.Restaurant;
import com.tap.utility.DBConnection;

public class RestaurantDAOImpl implements RestaurantDAO {

    private Connection con = DBConnection.getConnection();
    private PreparedStatement pstmt;
    private ResultSet res;

    @Override
    public List<Restaurant> getAllRestaurants() {

        List<Restaurant> restaurantList = new ArrayList<>();

        try {

            String query = "SELECT * FROM restaurant";

            pstmt = con.prepareStatement(query);

            res = pstmt.executeQuery();

            while(res.next()) {

                Restaurant restaurant = new Restaurant();

                restaurant.setRestaurantId(
                        res.getInt("restaurantId"));

                restaurant.setName(
                        res.getString("name"));

                restaurant.setImagePath(
                        res.getString("imagePath"));

                restaurant.setRating(
                        res.getFloat("rating"));

                restaurant.setEta(
                        res.getString("eta"));

                restaurant.setCuisineType(
                        res.getString("cuisineType"));

                restaurant.setAddress(
                        res.getString("address"));

                restaurant.setActive(
                        res.getBoolean("isActive"));

                restaurantList.add(restaurant);
            }

        }
        catch(Exception e) {
            e.printStackTrace();
        }

        return restaurantList;
    }

    @Override
    public Restaurant getRestaurantById(int restaurantId) {

        Restaurant restaurant = null;

        try {

            System.out.println("Searching Restaurant ID : " + restaurantId);

            String query =
                    "SELECT * FROM restaurant WHERE restaurantId=?";

            pstmt = con.prepareStatement(query);

            pstmt.setInt(1, restaurantId);

            res = pstmt.executeQuery();

            if(res.next()) {

                System.out.println("Restaurant Found : "
                        + res.getString("name"));

                restaurant = new Restaurant();

                restaurant.setRestaurantId(
                        res.getInt("restaurantId"));

                restaurant.setName(
                        res.getString("name"));

                restaurant.setImagePath(
                        res.getString("imagePath"));

                restaurant.setRating(
                        res.getFloat("rating"));

                restaurant.setEta(
                        res.getString("eta"));

                restaurant.setCuisineType(
                        res.getString("cuisineType"));

                restaurant.setAddress(
                        res.getString("address"));

                restaurant.setActive(
                        res.getBoolean("isActive"));
            }
            else {

                System.out.println("Restaurant NOT FOUND");
            }

        }
        catch(Exception e) {
            e.printStackTrace();
        }

        return restaurant;
    }
    
    @Override
    public List<Restaurant> searchRestaurants(String keyword) {

        List<Restaurant> restaurantList = new ArrayList<>();

        try {

            con = DBConnection.getConnection();

            String query =
            		"SELECT * FROM restaurant WHERE LOWER(name) LIKE LOWER(?) OR LOWER(cuisineType) LIKE LOWER(?)";
            pstmt = con.prepareStatement(query);

            pstmt.setString(1, "%" + keyword + "%");
            pstmt.setString(2, "%" + keyword + "%");

            res = pstmt.executeQuery();

            while(res.next()) {

                Restaurant restaurant = new Restaurant();

                restaurant.setRestaurantId(
                        res.getInt("restaurantId"));

                restaurant.setName(
                        res.getString("name"));

                restaurant.setImagePath(
                        res.getString("imagePath"));

                restaurant.setRating(
                        res.getFloat("rating"));

                restaurant.setEta(
                        res.getString("eta"));

                restaurant.setCuisineType(
                        res.getString("cuisineType"));

                restaurant.setAddress(
                        res.getString("address"));

                restaurant.setActive(
                        res.getBoolean("isActive"));

                restaurantList.add(restaurant);
            }

        }
        catch(Exception e) {

            e.printStackTrace();
        }

        return restaurantList;
    }
    @Override
    public boolean addRestaurant(Restaurant restaurant) {
        boolean status = false;
        try {
            con = DBConnection.getConnection();
            String query = "INSERT INTO restaurant (name, imagePath, rating, eta, cuisineType, address, isActive) VALUES (?, ?, ?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, restaurant.getName());
            pstmt.setString(2, restaurant.getImagePath());
            pstmt.setFloat(3, restaurant.getRating());
            pstmt.setString(4, restaurant.getEta());
            pstmt.setString(5, restaurant.getCuisineType());
            pstmt.setString(6, restaurant.getAddress());
            pstmt.setBoolean(7, restaurant.isActive());
            
            int rows = pstmt.executeUpdate();
            if (rows > 0) status = true;
        } catch (Exception e) { e.printStackTrace(); }
        return status;
    }

    @Override
    public boolean updateRestaurant(Restaurant restaurant) {
        boolean status = false;
        try {
            con = DBConnection.getConnection();
            String query = "UPDATE restaurant SET name=?, imagePath=?, rating=?, eta=?, cuisineType=?, address=?, isActive=? WHERE restaurantId=?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, restaurant.getName());
            pstmt.setString(2, restaurant.getImagePath());
            pstmt.setFloat(3, restaurant.getRating());
            pstmt.setString(4, restaurant.getEta());
            pstmt.setString(5, restaurant.getCuisineType());
            pstmt.setString(6, restaurant.getAddress());
            pstmt.setBoolean(7, restaurant.isActive());
            pstmt.setInt(8, restaurant.getRestaurantId());
            
            int rows = pstmt.executeUpdate();
            if (rows > 0) status = true;
        } catch (Exception e) { e.printStackTrace(); }
        return status;
    }

    @Override
    public boolean deleteRestaurant(int id) {
        boolean status = false;
        try {
            con = DBConnection.getConnection();
            String query = "DELETE FROM restaurant WHERE restaurantId=?";
            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, id);
            
            int rows = pstmt.executeUpdate();
            if (rows > 0) status = true;
        } catch (Exception e) { e.printStackTrace(); }
        return status;
    }
    
    public int getRestaurantCount() {

        int count = 0;

        try {

            con = DBConnection.getConnection();

            String query = "SELECT COUNT(*) FROM restaurant";

            pstmt = con.prepareStatement(query);

            res = pstmt.executeQuery();

            if (res.next()) {

                count = res.getInt(1);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return count;
    }
}