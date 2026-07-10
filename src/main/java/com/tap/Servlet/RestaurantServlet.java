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

@WebServlet("/restaurants")
public class RestaurantServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        RestaurantDAOImpl dao = new RestaurantDAOImpl();

        List<Restaurant> list = dao.getAllRestaurants();
        System.out.println("Restaurant List = " + list);
        request.setAttribute("restaurants", list);

        request.getRequestDispatcher("/restaurant.jsp")
               .forward(request, response);
    }
}