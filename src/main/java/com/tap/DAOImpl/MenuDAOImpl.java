package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.MenuDAO;
import com.tap.model.Menu;
import com.tap.utility.DBConnection;

public class MenuDAOImpl implements MenuDAO {

    Connection con;
    PreparedStatement pstmt;
    ResultSet res;

    @Override
    public List<Menu> getMenuByRestaurantId(int restaurantId) {

        List<Menu> menuList = new ArrayList<>();

        try {

            con = DBConnection.getConnection();

            String query =
                    "SELECT * FROM menu WHERE restaurantId=?";

            pstmt = con.prepareStatement(query);

            pstmt.setInt(1, restaurantId);

            res = pstmt.executeQuery();

            while(res.next()) {

                Menu menu = new Menu();

                menu.setMenuId(
                        res.getInt("menuId"));

                menu.setRestaurantId(
                        res.getInt("restaurantId"));

                menu.setItemName(
                        res.getString("itemName"));

                menu.setDescription(
                        res.getString("description"));

                menu.setPrice(
                        res.getDouble("price"));

                menu.setAvailable(
                        res.getBoolean("isAvailable"));

                menu.setImagePath(
                        res.getString("imagePath"));
                menu.setFoodType(
                        res.getString("foodType"));
               
                menu.setRating(res.getFloat("rating"));
                
                menuList.add(menu);
            }

        }
        catch(Exception e) {

            e.printStackTrace();
        }

        return menuList;
    }

    @Override
    public Menu getMenuById(int menuId) {

        Menu menu = null;

        try {

            con = DBConnection.getConnection();

            String query =
                    "SELECT * FROM menu WHERE menuId=?";

            pstmt = con.prepareStatement(query);

            pstmt.setInt(1, menuId);

            res = pstmt.executeQuery();

            if(res.next()) {

                menu = new Menu();

                menu.setMenuId(
                        res.getInt("menuId"));

                menu.setRestaurantId(
                        res.getInt("restaurantId"));

                menu.setItemName(
                        res.getString("itemName"));

                menu.setDescription(
                        res.getString("description"));

                menu.setPrice(
                        res.getDouble("price"));

                menu.setAvailable(
                        res.getBoolean("isAvailable"));

                menu.setImagePath(
                    res.getString("imagePath"));
               
                menu.setFoodType(
                        res.getString("foodType"));
                
                menu.setRating(
                        res.getFloat("rating"));
            }

        }
        catch(Exception e) {

            e.printStackTrace();
        }

        return menu;
    }

    @Override
    public List<Menu> searchMenuItems(int restaurantId, String keyword) {

        List<Menu> menuList = new ArrayList<>();

        try {

            con = DBConnection.getConnection();

            String query =
                    "SELECT * FROM menu WHERE restaurantId=? AND itemName LIKE ?";

            pstmt = con.prepareStatement(query);

            pstmt.setInt(1, restaurantId);

            pstmt.setString(2, "%" + keyword + "%");

            res = pstmt.executeQuery();

            while(res.next()) {

                Menu menu = new Menu();

                menu.setMenuId(
                        res.getInt("menuId"));

                menu.setRestaurantId(
                        res.getInt("restaurantId"));

                menu.setItemName(
                        res.getString("itemName"));

                menu.setDescription(
                        res.getString("description"));

                menu.setPrice(
                        res.getDouble("price"));

                menu.setAvailable(
                        res.getBoolean("isAvailable"));

                menu.setImagePath(
                        res.getString("imagePath"));
                
                menu.setFoodType(
                		res.getString("foodType"));
               
                menu.setRating(
                        res.getFloat("rating"));
                
                
                menuList.add(menu);
            }

        }
        catch(Exception e) {

            e.printStackTrace();
        }

        return menuList;
    }
    public int getMenuCount() {

        int count = 0;

        try {

            con = DBConnection.getConnection();

            String query = "SELECT COUNT(*) FROM menu";

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
    
    @Override
    public List<Menu> getAllMenus() {
        List<Menu> menuList = new ArrayList<>();
        try {
            con = DBConnection.getConnection();
            String query = "SELECT * FROM menu";
            pstmt = con.prepareStatement(query);
            res = pstmt.executeQuery();
            while(res.next()) {
                Menu menu = new Menu();
                menu.setMenuId(res.getInt("menuId"));
                menu.setRestaurantId(res.getInt("restaurantId"));
                menu.setItemName(res.getString("itemName"));
                menu.setDescription(res.getString("description"));
                menu.setPrice(res.getDouble("price"));
                menu.setAvailable(res.getBoolean("isAvailable"));
                menu.setImagePath(res.getString("imagePath"));
                menu.setFoodType(res.getString("foodType"));
                menu.setRating(res.getFloat("rating"));
                menuList.add(menu);
            }
        } catch(Exception e) { e.printStackTrace(); }
        return menuList;
    }

    @Override
    public boolean addMenu(Menu menu) {
        boolean status = false;
        try {
            con = DBConnection.getConnection();
            String query = "INSERT INTO menu (restaurantId, itemName, description, price, isAvailable, imagePath, foodType, rating) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, menu.getRestaurantId());
            pstmt.setString(2, menu.getItemName());
            pstmt.setString(3, menu.getDescription());
            pstmt.setDouble(4, menu.getPrice());
            pstmt.setBoolean(5, menu.isAvailable());
            pstmt.setString(6, menu.getImagePath());
            pstmt.setString(7, menu.getFoodType());
            pstmt.setFloat(8, menu.getRating());
            if (pstmt.executeUpdate() > 0) status = true;
        } catch(Exception e) { e.printStackTrace(); }
        return status;
    }

    @Override
    public boolean updateMenu(Menu menu) {
        boolean status = false;
        try {
            con = DBConnection.getConnection();
            String query = "UPDATE menu SET restaurantId=?, itemName=?, description=?, price=?, isAvailable=?, imagePath=?, foodType=?, rating=? WHERE menuId=?";
            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, menu.getRestaurantId());
            pstmt.setString(2, menu.getItemName());
            pstmt.setString(3, menu.getDescription());
            pstmt.setDouble(4, menu.getPrice());
            pstmt.setBoolean(5, menu.isAvailable());
            pstmt.setString(6, menu.getImagePath());
            pstmt.setString(7, menu.getFoodType());
            pstmt.setFloat(8, menu.getRating());
            pstmt.setInt(9, menu.getMenuId());
            if (pstmt.executeUpdate() > 0) status = true;
        } catch(Exception e) { e.printStackTrace(); }
        return status;
    }

    @Override
    public boolean deleteMenu(int menuId) {
        boolean status = false;
        try {
            con = DBConnection.getConnection();
            String query = "DELETE FROM menu WHERE menuId=?";
            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, menuId);
            if (pstmt.executeUpdate() > 0) status = true;
        } catch(Exception e) { e.printStackTrace(); }
        return status;
    }
}