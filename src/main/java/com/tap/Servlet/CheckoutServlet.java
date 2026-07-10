package com.tap.Servlet;

import java.io.IOException;

import com.tap.DAOImpl.MenuDAOImpl;
import com.tap.DAOImpl.OrderDAOImpl;
import com.tap.DAOImpl.OrderItemDAOImpl;
import com.tap.model.Cart;
import com.tap.model.CartItem;
import com.tap.model.Menu;
import com.tap.model.Order;
import com.tap.model.OrderItem;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        // Logged in User
        User user = (User) session.getAttribute("user");

        // Cart
        Cart cart = (Cart) session.getAttribute("cart");

        // Check Login
        if (user == null) {

            response.sendRedirect("login.jsp");
            return;
        }

        // Check Cart
        if (cart == null || cart.getItems().isEmpty()) {

            response.sendRedirect("cart.jsp");
            return;
        }

        // Calculate Grand Total
        double totalAmount = 0;

        for (CartItem item : cart.getItems()) {

            totalAmount += item.getPrice() * item.getQuantity();
        }

        // Get Restaurant Id
        MenuDAOImpl menuDAO = new MenuDAOImpl();

        int restaurantId = 0;

        for (CartItem item : cart.getItems()) {

            Menu menu = menuDAO.getMenuById(item.getMenuId());

            restaurantId = menu.getRestaurantId();

            break;
        }

        // Payment Method
        String paymentMode =
                (String) session.getAttribute("paymentMethod");

        if (paymentMode == null) {

            paymentMode = "Cash On Delivery";
        }

        // Create Order
        Order order = new Order();

        order.setUserId(user.getUserId());
        order.setRestaurantId(restaurantId);
        order.setTotalAmount(totalAmount);
        order.setPaymentMode(paymentMode);
        order.setStatus("Placed");
        order.setOrderDate(new java.sql.Timestamp(System.currentTimeMillis()));
        // Save Order
        OrderDAOImpl orderDAO = new OrderDAOImpl();

        int orderId = orderDAO.addOrder(order);

        // Save Order Items
        OrderItemDAOImpl orderItemDAO =
                new OrderItemDAOImpl();

        for (CartItem item : cart.getItems()) {

            OrderItem orderItem = new OrderItem();

            orderItem.setOrderId(orderId);
            orderItem.setMenuId(item.getMenuId());
            orderItem.setQuantity(item.getQuantity());
            orderItem.setItemTotal(
                    item.getPrice() * item.getQuantity());

            orderItemDAO.addOrderItem(orderItem);
        }

        // Clear Cart
        session.removeAttribute("cart");
        session.removeAttribute("paymentMethod");

        // Redirect
        response.sendRedirect("order-success.jsp");
    }
}