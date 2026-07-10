package com.tap.Servlet;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.tap.DAO.UserDAO;
import com.tap.DAOImpl.UserDAOImpl;
import com.tap.model.User;

@WebServlet("/adminUsers")
public class AdminUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO = new UserDAOImpl();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedInAdmin") == null) {
            response.sendRedirect("admin-login.jsp?error=Please login first");
            return;
        }

        String action = request.getParameter("action");
        if ("delete".equals(action)) {
            int deleteId = Integer.parseInt(request.getParameter("id"));
            userDAO.deleteUser(deleteId);
            response.sendRedirect("adminUsers");
            return;
        }

        List<User> list = userDAO.getAllUsers();
        request.setAttribute("userList", list);
        request.getRequestDispatcher("admin-users.jsp").forward(request, response);
    }
}
