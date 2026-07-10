package com.tap.Servlet;

import java.io.IOException;

import com.tap.DAOImpl.OrderDAOImpl;
import com.tap.model.Order;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/orderStatus")
public class OrderStatusServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int orderId =
                Integer.parseInt(request.getParameter("orderId"));

        OrderDAOImpl dao = new OrderDAOImpl();

        Order order = dao.getOrderById(orderId);

        if(order == null){

            response.getWriter().print("Not Found");
            return;
        }

        long seconds =
        (System.currentTimeMillis()
        - order.getOrderDate().getTime()) / 1000;

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

        dao.updateOrderStatus(orderId, status);

        response.setContentType("text/plain");

        response.getWriter().print(status);
    }
}