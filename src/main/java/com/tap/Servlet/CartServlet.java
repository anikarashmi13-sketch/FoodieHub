package com.tap.Servlet;

import java.io.IOException;

import com.tap.DAOImpl.MenuDAOImpl;
import com.tap.DAOImpl.RestaurantDAOImpl;
import com.tap.model.Cart;
import com.tap.model.CartItem;
import com.tap.model.Menu;
import com.tap.model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int menuId = Integer.parseInt(request.getParameter("menuId"));

        // Fetch menu
        MenuDAOImpl menuDAO = new MenuDAOImpl();
        Menu menu = menuDAO.getMenuById(menuId);

        // Fetch restaurant
        RestaurantDAOImpl restaurantDAO = new RestaurantDAOImpl();
        Restaurant restaurant =
                restaurantDAO.getRestaurantById(menu.getRestaurantId());

        HttpSession session = request.getSession();

        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null) {
            cart = new Cart();
        }

        // Create Cart Item
        CartItem item = new CartItem(
                menu.getMenuId(),
                menu.getItemName(),
                menu.getPrice(),
                1,
                menu.getImagePath(),
                menu.getDescription(),
                restaurant != null ? restaurant.getName() : "Restaurant",
                restaurant != null ? restaurant.getRating() : 0
        );

        cart.addItem(item);

        session.setAttribute("cart", cart);

        response.sendRedirect("cart.jsp");
    }
}