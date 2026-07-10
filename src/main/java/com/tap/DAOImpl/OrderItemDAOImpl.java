package com.tap.DAOImpl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.OrderItemDAO;
import com.tap.model.OrderItem;
import com.tap.utility.DBConnection;

public class OrderItemDAOImpl implements OrderItemDAO {

    Connection con;
    PreparedStatement pstmt;
    ResultSet res;

    @Override
    public boolean addOrderItem(OrderItem item) {

        try {

            con = DBConnection.getConnection();

            String query =
                    "INSERT INTO orderitem(orderId, menuId, quantity, itemTotal) VALUES(?,?,?,?)";

            pstmt = con.prepareStatement(query);

            pstmt.setInt(1, item.getOrderId());
            pstmt.setInt(2, item.getMenuId());
            pstmt.setInt(3, item.getQuantity());
            pstmt.setDouble(4, item.getItemTotal());

            return pstmt.executeUpdate() > 0;

        }
        catch(Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public List<OrderItem> getOrderItemsByOrderId(int orderId) {

        List<OrderItem> items = new ArrayList<>();

        try {

            con = DBConnection.getConnection();

            String query =
                    "SELECT * FROM orderitem WHERE orderId=?";

            pstmt = con.prepareStatement(query);

            pstmt.setInt(1, orderId);

            res = pstmt.executeQuery();

            while(res.next()) {

                OrderItem item = new OrderItem();

                item.setOrderItemId(res.getInt("orderItemId"));
                item.setOrderId(res.getInt("orderId"));
                item.setMenuId(res.getInt("menuId"));
                item.setQuantity(res.getInt("quantity"));
                item.setItemTotal(res.getDouble("itemTotal"));

                items.add(item);
            }

        }
        catch(Exception e) {
            e.printStackTrace();
        }

        return items;
    }
}