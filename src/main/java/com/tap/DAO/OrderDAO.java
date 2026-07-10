package com.tap.DAO;

import java.util.List;
import com.tap.model.Order;

public interface OrderDAO {

    // Save a new order
    int addOrder(Order order);

    // Get order by ID
    Order getOrderById(int orderId);

    // Get all orders of a user
    List<Order> getOrdersByUserId(int userId);

    // Get all orders (for admin)
    List<Order> getAllOrders();

    // Update order status
    boolean updateOrderStatus(int orderId, String status);
}