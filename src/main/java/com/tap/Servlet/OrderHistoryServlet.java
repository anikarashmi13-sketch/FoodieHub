package com.tap.Servlet;

import java.io.IOException;
import java.util.List;

import com.tap.DAOImpl.OrderDAOImpl;
import com.tap.model.Order;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/orderHistory")
public class OrderHistoryServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request,
	        HttpServletResponse response)
	        throws ServletException, IOException {

	    HttpSession session = request.getSession();

	    User user = (User) session.getAttribute("user");

	    if(user == null){

	        response.sendRedirect("login.jsp");
	        return;
	    }

	    OrderDAOImpl dao = new OrderDAOImpl();

	    List<Order> orders = dao.getOrdersByUserId(user.getUserId());

	    // -------- AUTO STATUS UPDATE --------

	    for(Order order : orders){

	        long seconds =
	        (System.currentTimeMillis() -
	         order.getOrderDate().getTime()) / 1000;

	        String status;

	        if(seconds < 10){

	            status = "Placed";

	        }
	        else if(seconds < 20){

	            status = "Preparing";

	        }
	        else if(seconds < 30){

	            status = "Out For Delivery";

	        }
	        else{

	            status = "Delivered";

	        }

	        // Update object
	        order.setStatus(status);

	        // Update database
	        dao.updateOrderStatus(order.getOrderId(), status);
	    }

	    request.setAttribute("orders", orders);

	    request.getRequestDispatcher("order-history.jsp")
	           .forward(request, response);
	}
}