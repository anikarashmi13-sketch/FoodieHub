package com.tap.DAO;

import com.tap.model.User;

public interface UserDAO {

    boolean registerUser(User user);

    User loginUser(String email, String password);
    boolean updateUser(User user);
    
    java.util.List<User> getAllUsers();
    boolean deleteUser(int userId);
    
    User getUserByEmail(String email);
    boolean resetPassword(String email, String newPassword);
}