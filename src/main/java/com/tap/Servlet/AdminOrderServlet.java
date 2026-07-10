package com.tap.Servlet;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.tap.DAO.OrderDAO;
import com.tap.DAOImpl.OrderDAOImpl;
import com.tap.model.Order;

@WebServlet("/adminOrders")
public class AdminOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private OrderDAO orderDAO = new OrderDAOImpl();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedInAdmin") == null) {
            response.sendRedirect("admin-login.jsp?error=Please login first");
            return;
        }

        List<Order> list = orderDAO.getAllOrders();
        request.setAttribute("orderList", list);
        request.getRequestDispatcher("admin-orders.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedInAdmin") == null) {
            response.sendRedirect("admin-login.jsp?error=Please login first");
            return;
        }

        String action = request.getParameter("action");
        
        if ("updateStatus".equals(action)) {
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            String status = request.getParameter("status");
            orderDAO.updateOrderStatus(orderId, status);
        }
        
        response.sendRedirect("adminOrders");
    }
}
