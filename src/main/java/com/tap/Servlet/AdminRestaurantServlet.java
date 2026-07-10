package com.tap.Servlet;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.tap.DAO.RestaurantDAO;
import com.tap.DAOImpl.RestaurantDAOImpl;
import com.tap.model.Restaurant;

@WebServlet("/adminRestaurants")
public class AdminRestaurantServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private RestaurantDAO restaurantDAO = new RestaurantDAOImpl();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedInAdmin") == null) {
            response.sendRedirect("admin-login.jsp?error=Please login first");
            return;
        }

        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "new":
                request.getRequestDispatcher("admin-restaurant-form.jsp").forward(request, response);
                break;
            case "edit":
                int id = Integer.parseInt(request.getParameter("id"));
                Restaurant existingRestaurant = restaurantDAO.getRestaurantById(id);
                request.setAttribute("restaurant", existingRestaurant);
                request.getRequestDispatcher("admin-restaurant-form.jsp").forward(request, response);
                break;
            case "delete":
                int deleteId = Integer.parseInt(request.getParameter("id"));
                restaurantDAO.deleteRestaurant(deleteId);
                response.sendRedirect("adminRestaurants?action=list");
                break;
            default:
                List<Restaurant> list = restaurantDAO.getAllRestaurants();
                request.setAttribute("restaurantList", list);
                request.getRequestDispatcher("admin-restaurants.jsp").forward(request, response);
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedInAdmin") == null) {
            response.sendRedirect("admin-login.jsp?error=Please login first");
            return;
        }

        String action = request.getParameter("action");
        
        String name = request.getParameter("name");
        String imagePath = request.getParameter("imagePath");
        float rating = Float.parseFloat(request.getParameter("rating"));
        String eta = request.getParameter("eta");
        String cuisineType = request.getParameter("cuisineType");
        String address = request.getParameter("address");
        boolean isActive = "on".equals(request.getParameter("isActive"));

        if ("add".equals(action)) {
            Restaurant newRestaurant = new Restaurant(0, name, imagePath, rating, eta, cuisineType, address, isActive);
            restaurantDAO.addRestaurant(newRestaurant);
        } else if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("restaurantId"));
            Restaurant updatedRestaurant = new Restaurant(id, name, imagePath, rating, eta, cuisineType, address, isActive);
            restaurantDAO.updateRestaurant(updatedRestaurant);
        }
        response.sendRedirect("adminRestaurants?action=list");
    }
}
