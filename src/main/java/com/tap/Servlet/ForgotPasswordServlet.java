package com.tap.Servlet;

import java.io.IOException;

import com.tap.DAOImpl.UserDAOImpl;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/forgotPassword")
public class ForgotPasswordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");

        if (email == null || email.trim().isEmpty()) {
            response.sendRedirect("forgot-password.jsp?error=Please enter your email address.");
            return;
        }

        email = email.trim().toLowerCase();

        UserDAOImpl dao = new UserDAOImpl();
        User user = dao.getUserByEmail(email);

        if (user == null) {
            response.sendRedirect("forgot-password.jsp?error=No account found with this email address.");
            return;
        }

        // Email exists — store in session and take user to reset page
        HttpSession session = request.getSession();
        session.setAttribute("resetEmail", email);

        response.sendRedirect("reset-password.jsp");
    }
}
