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

@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        AdminDAO adminDAO = new AdminDAOImpl();
        Admin admin = adminDAO.loginAdmin(email, password);
        
        if (admin != null) {
            HttpSession session = request.getSession();
            session.setAttribute("loggedInAdmin", admin);
            // Redirects to dashboard (Feature 2)
            response.sendRedirect("adminDashboard"); // To be created in Feature 2
        } else {
            response.sendRedirect("admin-login.jsp?error=Invalid email or password");
        }
    }
}
