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

@WebServlet("/updateProfile")
public class UpdateProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int userId =
                Integer.parseInt(request.getParameter("userId"));

        String name =
                request.getParameter("name");

        String email =
                request.getParameter("email");

        String password =
                request.getParameter("password");

        String address =
                request.getParameter("address");

        User user = new User();

        user.setUserId(userId);
        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);
        user.setAddress(address);

        UserDAOImpl dao =
                new UserDAOImpl();

        boolean status =
                dao.updateUser(user);

        if(status) {

            HttpSession session =
                    request.getSession();

            session.setAttribute("user", user);

            response.sendRedirect("profile.jsp");
        }
        else {

            response.sendRedirect("edit-profile.jsp");
        }
    }
}