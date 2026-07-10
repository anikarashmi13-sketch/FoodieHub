package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.tap.DAO.AdminDAO;
import com.tap.model.Admin;
import com.tap.utility.DBConnection;

public class AdminDAOImpl implements AdminDAO {

    @Override
    public Admin loginAdmin(String email, String password) {
        Admin admin = null;
        String query = "SELECT * FROM admin WHERE email = ? AND password = ?";
        
        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(query)) {
             
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                admin = new Admin(
                    rs.getInt("admin_id"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("password")
                );
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return admin;
    }

    @Override
    public int getTotalRestaurants() {
        int count = 0;
        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement("SELECT COUNT(*) FROM restaurant")) {
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) count = rs.getInt(1);
        } catch (Exception e) { e.printStackTrace(); }
        return count;
    }

    @Override
    public int getTotalMenuItems() {
        int count = 0;
        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement("SELECT COUNT(*) FROM menu")) {
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) count = rs.getInt(1);
        } catch (Exception e) { e.printStackTrace(); }
        return count;
    }

    @Override
    public int getTotalUsers() {
        int count = 0;
        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement("SELECT COUNT(*) FROM user")) {
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) count = rs.getInt(1);
        } catch (Exception e) { e.printStackTrace(); }
        return count;
    }

    @Override
    public int getTotalOrders() {
        int count = 0;
        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement("SELECT COUNT(*) FROM orders")) {
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) count = rs.getInt(1);
        } catch (Exception e) { e.printStackTrace(); }
        return count;
    }

    @Override
    public double getTotalRevenue() {
        double total = 0;
        // In the Order model, the table is usually 'orders' and column is 'total_amount'
        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement("SELECT SUM(total_amount) FROM orders WHERE status = 'Delivered'")) {
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) total = rs.getDouble(1);
        } catch (Exception e) { e.printStackTrace(); }
        return total;
    }
}
