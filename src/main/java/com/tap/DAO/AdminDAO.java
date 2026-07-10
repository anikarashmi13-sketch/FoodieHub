package com.tap.DAO;

import com.tap.model.Admin;

public interface AdminDAO {
    Admin loginAdmin(String email, String password);
    int getTotalRestaurants();
    int getTotalMenuItems();
    int getTotalUsers();
    int getTotalOrders();
    double getTotalRevenue();
}
