package com.tap.Servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/payment")
public class PaymentServlet extends HttpServlet{

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String paymentMethod =
                request.getParameter("paymentMethod");

        HttpSession session =
                request.getSession();

        session.setAttribute("paymentMethod",
                paymentMethod);

        if(paymentMethod.equals("Cash On Delivery")) {

        	request.getRequestDispatcher("checkout")
            .forward(request, response);

        }
        else {

            response.sendRedirect("payment.jsp");
        }
    }
}