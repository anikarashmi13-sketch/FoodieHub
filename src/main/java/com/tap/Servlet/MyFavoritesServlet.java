package com.tap.Servlet;

import java.io.IOException;
import java.util.List;

import com.tap.DAOImpl.FavoriteDAOImpl;
import com.tap.model.Restaurant;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/myFavorites")
public class MyFavoritesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");

        if(user == null) {

            response.sendRedirect("login.jsp");
            return;
        }

        FavoriteDAOImpl dao = new FavoriteDAOImpl();

        List<Restaurant> favoriteList =
                dao.getFavoritesByUserId(user.getUserId());

        request.setAttribute("favoriteList", favoriteList);

        request.getRequestDispatcher("my-favorites.jsp")
               .forward(request, response);
    }
}