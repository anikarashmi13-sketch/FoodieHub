package com.tap.Servlet;

import java.io.IOException;

import com.tap.DAOImpl.FavoriteDAOImpl;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/favorite")
public class FavoriteServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request,
	        HttpServletResponse response)
	        throws ServletException, IOException {

	    HttpSession session = request.getSession();

	    User user = (User) session.getAttribute("user");

	    if(user == null){

	        response.sendRedirect("login.jsp");
	        return;
	    }

	    int restaurantId =
	            Integer.parseInt(request.getParameter("restaurantId"));

	    String from =
	            request.getParameter("from");

	    FavoriteDAOImpl dao =
	            new FavoriteDAOImpl();

	    if(dao.isFavorite(user.getUserId(), restaurantId)){

	        dao.removeFavorite(
	                user.getUserId(),
	                restaurantId);
	    }
	    else{

	        dao.addFavorite(
	                user.getUserId(),
	                restaurantId);
	    }

	    if("favorites".equals(from)){

	        response.sendRedirect("myFavorites");
	    }
	    else{

	        response.sendRedirect("restaurants");
	    }
	}
}