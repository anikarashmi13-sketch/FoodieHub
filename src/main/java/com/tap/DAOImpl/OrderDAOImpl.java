package com.tap.DAOImpl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.OrderDAO;
import com.tap.model.Order;
import com.tap.utility.DBConnection;

public class OrderDAOImpl implements OrderDAO {

    Connection con;
    PreparedStatement pstmt;
    ResultSet res;

    @Override
    public int addOrder(Order order) {

        int orderId = 0;

        try {

            con = DBConnection.getConnection();

            String query =
            		"INSERT INTO orders(userId, restaurantId, totalAmount, paymentMode, status, orderDate) VALUES(?,?,?,?,?,?)";

            		pstmt = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

            		pstmt.setInt(1, order.getUserId());
            		pstmt.setInt(2, order.getRestaurantId());
            		pstmt.setDouble(3, order.getTotalAmount());
            		pstmt.setString(4, order.getPaymentMode());
            		pstmt.setString(5, order.getStatus());
            		pstmt.setTimestamp(6, order.getOrderDate());
            pstmt.executeUpdate();

            ResultSet rs = pstmt.getGeneratedKeys();

            if(rs.next()) {
                orderId = rs.getInt(1);
            }

        }
        catch(Exception e) {
            e.printStackTrace();
        }

        return orderId;
    }

    @Override
    public Order getOrderById(int orderId) {

        Order order = null;

        try {

            con = DBConnection.getConnection();

            String query =
                    "SELECT * FROM orders WHERE orderId=?";

            pstmt = con.prepareStatement(query);

            pstmt.setInt(1, orderId);

            res = pstmt.executeQuery();

            if(res.next()) {

                order = new Order();

                order.setOrderId(res.getInt("orderId"));
                order.setUserId(res.getInt("userId"));
                order.setRestaurantId(res.getInt("restaurantId"));
                order.setTotalAmount(res.getDouble("totalAmount"));
                order.setPaymentMode(res.getString("paymentMode"));
                order.setStatus(res.getString("status"));
                order.setOrderDate(res.getTimestamp("orderDate"));
            }

        }
        catch(Exception e) {
            e.printStackTrace();
        }

        return order;
    }

    @Override
    public List<Order> getOrdersByUserId(int userId) {

        List<Order> orders = new ArrayList<>();

        try {

            con = DBConnection.getConnection();

            String query =
                    "SELECT * FROM orders WHERE userId=? ORDER BY orderDate DESC";

            pstmt = con.prepareStatement(query);

            pstmt.setInt(1, userId);

            res = pstmt.executeQuery();

            while(res.next()) {

                Order order = new Order();

                order.setOrderId(res.getInt("orderId"));
                order.setUserId(res.getInt("userId"));
                order.setRestaurantId(res.getInt("restaurantId"));
                order.setTotalAmount(res.getDouble("totalAmount"));
                order.setPaymentMode(res.getString("paymentMode"));
                order.setStatus(res.getString("status"));
                order.setOrderDate(res.getTimestamp("orderDate"));

                orders.add(order);
            }

        }
        catch(Exception e) {
            e.printStackTrace();
        }

        return orders;
    }

    @Override
    public List<Order> getAllOrders() {

        List<Order> orders = new ArrayList<>();

        try {
            con = DBConnection.getConnection();
            String query = "SELECT * FROM orders ORDER BY orderDate DESC";
            pstmt = con.prepareStatement(query);
            res = pstmt.executeQuery();

            while(res.next()) {
                Order order = new Order();
                order.setOrderId(res.getInt("orderId"));
                order.setUserId(res.getInt("userId"));
                order.setRestaurantId(res.getInt("restaurantId"));
                order.setTotalAmount(res.getDouble("totalAmount"));
                order.setPaymentMode(res.getString("paymentMode"));
                order.setStatus(res.getString("status"));
                order.setOrderDate(res.getTimestamp("orderDate"));
                orders.add(order);
            }
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        return orders;
    }

    @Override
    public boolean updateOrderStatus(int orderId, String status) {

        try {

            con = DBConnection.getConnection();

            String query =
                    "UPDATE orders SET status=? WHERE orderId=?";

            pstmt = con.prepareStatement(query);

            pstmt.setString(1, status);
            pstmt.setInt(2, orderId);

            return pstmt.executeUpdate() > 0;

        }
        catch(Exception e) {
            e.printStackTrace();
        }

        return false;
    }
    
    public int getOrderCount() {

        int count = 0;

        try {

            con = DBConnection.getConnection();

            String query = "SELECT COUNT(*) FROM orders";

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