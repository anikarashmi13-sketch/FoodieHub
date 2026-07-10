package com.tap.Servlet;

import java.io.IOException;
import java.util.List;

import com.tap.DAOImpl.OrderItemDAOImpl;
import com.tap.model.OrderItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/orderDetails")
public class OrderDetailsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int orderId =
                    Integer.parseInt(request.getParameter("orderId"));

            OrderItemDAOImpl dao =
                    new OrderItemDAOImpl();

            List<OrderItem> orderItems =
                    dao.getOrderItemsByOrderId(orderId);

            request.setAttribute("orderItems", orderItems);

            request.getRequestDispatcher("order-details.jsp")
                   .forward(request, response);

        }
        catch(Exception e) {

            e.printStackTrace();

            response.sendRedirect("orderHistory");
        }
    }
}