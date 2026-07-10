package com.tap.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.tap.DAO.UserDAO;
import com.tap.model.User;
import com.tap.utility.DBConnection;

public class UserDAOImpl implements UserDAO {

    Connection con;
    PreparedStatement pstmt;
    ResultSet res;

    @Override
    public boolean registerUser(User user) {

        try {

            con = DBConnection.getConnection();

            String query =
                    "INSERT INTO user(name,email,password,address) VALUES(?,?,?,?)";

            pstmt = con.prepareStatement(query);

            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getAddress());

            int x = pstmt.executeUpdate();

            return x > 0;

        } catch(Exception e) {

            e.printStackTrace();
        }

        return false;
    }

    @Override
    public User loginUser(String email, String password) {

        User user = null;

        try {

            con = DBConnection.getConnection();

            String query =
                    "SELECT * FROM user WHERE email=? AND password=?";

            pstmt = con.prepareStatement(query);

            pstmt.setString(1, email);
            pstmt.setString(2, password);

            res = pstmt.executeQuery();

            if(res.next()) {

                user = new User();

                user.setUserId(
                        res.getInt("userId"));

                user.setName(
                        res.getString("name"));

                user.setEmail(
                        res.getString("email"));

                user.setPassword(
                        res.getString("password"));

                user.setAddress(
                        res.getString("address"));
                user.setPassword(
                        res.getString("password"));
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return user;
    }

    @Override
    public boolean updateUser(User user) {

        try {

            con = DBConnection.getConnection();

            String query =
                    "UPDATE user SET name=?, email=?, password=?, address=? WHERE userId=?";

            pstmt = con.prepareStatement(query);

            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getAddress());
            pstmt.setInt(5, user.getUserId());

            return pstmt.executeUpdate() > 0;

        }
        catch(Exception e) {

            e.printStackTrace();
        }

        return false;
    }
    
    public int getUserCount() {

        int count = 0;

        try {

            con = DBConnection.getConnection();

            String query = "SELECT COUNT(*) FROM user";

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
    public java.util.List<User> getAllUsers() {
        java.util.List<User> users = new java.util.ArrayList<>();
        try {
            con = DBConnection.getConnection();
            String query = "SELECT * FROM user";
            pstmt = con.prepareStatement(query);
            res = pstmt.executeQuery();
            while(res.next()) {
                User user = new User();
                user.setUserId(res.getInt("userId"));
                user.setName(res.getString("name"));
                user.setEmail(res.getString("email"));
                user.setAddress(res.getString("address"));
                // Do not fetch passwords for security in the dashboard
                users.add(user);
            }
        } catch(Exception e) { e.printStackTrace(); }
        return users;
    }

    @Override
    public boolean deleteUser(int userId) {
        try {
            con = DBConnection.getConnection();
            String query = "DELETE FROM user WHERE userId=?";
            pstmt = con.prepareStatement(query);
            pstmt.setInt(1, userId);
            return pstmt.executeUpdate() > 0;
        } catch(Exception e) { e.printStackTrace(); }
        return false;
    }

    @Override
    public User getUserByEmail(String email) {
        User user = null;
        try {
            con = DBConnection.getConnection();
            String query = "SELECT * FROM user WHERE email=?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            res = pstmt.executeQuery();

            if(res.next()) {
                user = new User();
                user.setUserId(res.getInt("userId"));
                user.setName(res.getString("name"));
                user.setEmail(res.getString("email"));
                user.setPassword(res.getString("password"));
                user.setAddress(res.getString("address"));
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public boolean resetPassword(String email, String newPassword) {
        try {
            con = DBConnection.getConnection();
            String query = "UPDATE user SET password=? WHERE email=?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, newPassword);
            pstmt.setString(2, email);
            return pstmt.executeUpdate() > 0;
        } catch(Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}