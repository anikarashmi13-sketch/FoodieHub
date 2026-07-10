package com.tap.Servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.tap.DAO.AdminDAO;
import com.tap.DAOImpl.AdminDAOImpl;
import com.tap.model.Admin;

@WebServlet("/adminDashboard")
public class AdminDashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedInAdmin") == null) {
            response.sendRedirect("admin-login.jsp?error=Please login to access dashboard");
            return;
        }
        
        AdminDAO adminDAO = new AdminDAOImpl();
        
        int totalRestaurants = adminDAO.getTotalRestaurants();
        int totalMenuItems = adminDAO.getTotalMenuItems();
        int totalUsers = adminDAO.getTotalUsers();
        int totalOrders = adminDAO.getTotalOrders();
        double totalRevenue = adminDAO.getTotalRevenue();
        
        request.setAttribute("totalRestaurants", totalRestaurants);
        request.setAttribute("totalMenuItems", totalMenuItems);
        request.setAttribute("totalUsers", totalUsers);
        request.setAttribute("totalOrders", totalOrders);
        request.setAttribute("totalRevenue", totalRevenue);
        
        request.getRequestDispatcher("admin-dashboard.jsp").forward(request, response);
    }
}
