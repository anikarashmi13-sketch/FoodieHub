package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.tap.model.Restaurant;

import com.tap.DAO.FavoriteDAO;
import com.tap.utility.DBConnection;

public class FavoriteDAOImpl implements FavoriteDAO {

    Connection con;
    PreparedStatement pstmt;
    ResultSet rs;

    @Override
    public boolean addFavorite(int userId, int restaurantId) {

        try {

            System.out.println("Adding Favorite...");
            System.out.println("User ID = " + userId);
            System.out.println("Restaurant ID = " + restaurantId);

            con = DBConnection.getConnection();

            String query =
                    "INSERT INTO favorite(userId,restaurantId) VALUES(?,?)";

            pstmt = con.prepareStatement(query);

            pstmt.setInt(1, userId);
            pstmt.setInt(2, restaurantId);

            int x = pstmt.executeUpdate();

            System.out.println("Rows Inserted = " + x);

            return x > 0;

        }
        catch(Exception e) {

            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean removeFavorite(int userId, int restaurantId) {

        try {

            con = DBConnection.getConnection();

            String query =
                    "DELETE FROM favorite WHERE userId=? AND restaurantId=?";

            pstmt = con.prepareStatement(query);

            pstmt.setInt(1, userId);
            pstmt.setInt(2, restaurantId);

            return pstmt.executeUpdate() > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean isFavorite(int userId, int restaurantId) {

        try {

            con = DBConnection.getConnection();

            String query =
                    "SELECT * FROM favorite WHERE userId=? AND restaurantId=?";

            pstmt = con.prepareStatement(query);

            pstmt.setInt(1, userId);
            pstmt.setInt(2, restaurantId);

            rs = pstmt.executeQuery();

            return rs.next();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return false;
    }
    
    @Override
    public List<Restaurant> getFavoritesByUserId(int userId) {

        List<Restaurant> restaurantList = new ArrayList<>();

        try {

            con = DBConnection.getConnection();

            String query =
                    "SELECT r.* FROM restaurant r "
                  + "JOIN favorite f ON r.restaurantId = f.restaurantId "
                  + "WHERE f.userId=?";

            pstmt = con.prepareStatement(query);

            pstmt.setInt(1, userId);

            rs = pstmt.executeQuery();

            while (rs.next()) {

                Restaurant restaurant = new Restaurant();

                restaurant.setRestaurantId(
                        rs.getInt("restaurantId"));

                restaurant.setName(
                        rs.getString("name"));

                restaurant.setImagePath(
                        rs.getString("imagePath"));

                restaurant.setCuisineType(
                        rs.getString("cuisineType"));

                restaurant.setAddress(
                        rs.getString("address"));

                restaurant.setRating(
                        rs.getFloat("rating"));

                restaurant.setEta(
                        rs.getString("eta"));

                restaurantList.add(restaurant);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return restaurantList;
    }

}