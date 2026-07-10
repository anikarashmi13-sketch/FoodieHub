package com.tap.Servlet;

import java.io.IOException;
import java.util.List;

import com.tap.DAOImpl.RestaurantDAOImpl;
import com.tap.model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/searchRestaurant")
public class RestaurantSearchServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String keyword =
                request.getParameter("keyword");

        RestaurantDAOImpl dao =
                new RestaurantDAOImpl();

        List<Restaurant> restaurants =
                dao.searchRestaurants(keyword);

        request.setAttribute(
                "restaurants",
                restaurants);

        request.getRequestDispatcher("restaurant.jsp")
               .forward(request, response);
    }
}