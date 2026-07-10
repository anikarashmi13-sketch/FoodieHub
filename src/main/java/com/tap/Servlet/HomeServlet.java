package com.tap.Servlet;

import java.io.IOException;

import com.tap.DAOImpl.MenuDAOImpl;
import com.tap.DAOImpl.OrderDAOImpl;
import com.tap.DAOImpl.RestaurantDAOImpl;
import com.tap.DAOImpl.UserDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        RestaurantDAOImpl restaurantDAO = new RestaurantDAOImpl();
        MenuDAOImpl menuDAO = new MenuDAOImpl();
        UserDAOImpl userDAO = new UserDAOImpl();
        OrderDAOImpl orderDAO = new OrderDAOImpl();

        request.setAttribute("restaurantCount",
                restaurantDAO.getRestaurantCount());

        request.setAttribute("menuCount",
                menuDAO.getMenuCount());

        request.setAttribute("customerCount",
                userDAO.getUserCount());

        request.setAttribute("orderCount",
                orderDAO.getOrderCount());

        request.getRequestDispatcher("index.jsp")
               .forward(request, response);
    }
}