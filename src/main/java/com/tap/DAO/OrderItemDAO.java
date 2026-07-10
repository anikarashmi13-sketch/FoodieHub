package com.tap.DAO;

import java.util.List;
import com.tap.model.OrderItem;

public interface OrderItemDAO {

    // Add item to order
    boolean addOrderItem(OrderItem item);

    // Get all items of an order
    List<OrderItem> getOrderItemsByOrderId(int orderId);
}