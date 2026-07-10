package com.tap.Servlet;

import java.io.IOException;
import java.util.List;

import com.tap.DAOImpl.MenuDAOImpl;
import com.tap.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/searchMenu")
public class MenuSearchServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int restaurantId =
                Integer.parseInt(request.getParameter("restaurantId"));

        String keyword =
                request.getParameter("keyword");

        MenuDAOImpl dao =
                new MenuDAOImpl();

        List<Menu> menuList =
                dao.searchMenuItems(restaurantId, keyword);

        request.setAttribute("menuList", menuList);

        request.getRequestDispatcher("menu.jsp")
               .forward(request, response);
    }
}