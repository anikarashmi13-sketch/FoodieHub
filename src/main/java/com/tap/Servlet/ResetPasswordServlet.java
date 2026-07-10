package com.tap.Servlet;

import java.io.IOException;
import java.net.URLEncoder;

import com.tap.DAOImpl.UserDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/resetPassword")
public class ResetPasswordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Guard: session must exist and contain resetEmail
        if (session == null || session.getAttribute("resetEmail") == null) {
            response.sendRedirect("forgot-password.jsp?error=Session expired. Please start again.");
            return;
        }

        String email       = (String) session.getAttribute("resetEmail");
        String newPassword = request.getParameter("newPassword");
        String confirmPass = request.getParameter("confirmPassword");

        // Validate inputs
        if (newPassword == null || newPassword.trim().isEmpty()) {
            response.sendRedirect("reset-password.jsp?error=Password cannot be empty.");
            return;
        }

        if (newPassword.length() < 6) {
            response.sendRedirect("reset-password.jsp?error=Password must be at least 6 characters.");
            return;
        }

        if (!newPassword.equals(confirmPass)) {
            response.sendRedirect("reset-password.jsp?error=Passwords do not match. Please try again.");
            return;
        }

        // Update password in DB
        UserDAOImpl dao = new UserDAOImpl();
        boolean updated = dao.resetPassword(email, newPassword);

        if (updated) {
            // Clear reset session data
            session.removeAttribute("resetEmail");

            String msg = URLEncoder.encode("Password reset successfully! Please log in with your new password.", "UTF-8");
            response.sendRedirect("login.jsp?success=" + msg);
        } else {
            response.sendRedirect("reset-password.jsp?error=Something went wrong. Please try again.");
        }
    }
}
