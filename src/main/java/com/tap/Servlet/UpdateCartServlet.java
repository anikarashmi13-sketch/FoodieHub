package com.tap.Servlet;

import java.io.IOException;

import com.tap.model.Cart;
import com.tap.model.CartItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/updateCart")
public class UpdateCartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        Cart cart = (Cart) session.getAttribute("cart");

        if(cart != null){

            int menuId =
                    Integer.parseInt(request.getParameter("menuId"));

            String action =
                    request.getParameter("action");

            int quantity = 0;

            for(CartItem item : cart.getItems()){

                if(item.getMenuId()==menuId){

                    quantity = item.getQuantity();

                    break;
                }
            }

            if(action.equals("increase")){

                quantity++;
            }
            else if(action.equals("decrease")){

                quantity--;
            }

            cart.updateQuantity(menuId, quantity);
        }

        response.sendRedirect("cart.jsp");
    }
}