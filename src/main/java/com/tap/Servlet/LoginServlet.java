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

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String email =
                request.getParameter("email");

        String password =
                request.getParameter("password");

        UserDAOImpl dao =
                new UserDAOImpl();

        User user =
                dao.loginUser(email, password);
        if(user != null) {

            HttpSession session = request.getSession();

            session.setAttribute("user", user);

            // Check if user was redirected to login from another page
            String redirect =
                    (String) session.getAttribute("redirectAfterLogin");

            if(redirect != null){

                session.removeAttribute("redirectAfterLogin");

                response.sendRedirect(redirect);

            }else{

                response.sendRedirect("restaurants");

            }
        }
        else {

            response.sendRedirect("login.jsp?error=Invalid email or password. Please try again.");
        }
    }
}