package com.tap.Servlet;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.tap.DAO.MenuDAO;
import com.tap.DAOImpl.MenuDAOImpl;
import com.tap.model.Menu;

@WebServlet("/adminMenu")
public class AdminMenuServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private MenuDAO menuDAO = new MenuDAOImpl();

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
                request.getRequestDispatcher("admin-menu-form.jsp").forward(request, response);
                break;
            case "edit":
                int id = Integer.parseInt(request.getParameter("id"));
                Menu existingMenu = menuDAO.getMenuById(id);
                request.setAttribute("menu", existingMenu);
                request.getRequestDispatcher("admin-menu-form.jsp").forward(request, response);
                break;
            case "delete":
                int deleteId = Integer.parseInt(request.getParameter("id"));
                menuDAO.deleteMenu(deleteId);
                response.sendRedirect("adminMenu?action=list");
                break;
            default:
                List<Menu> list = menuDAO.getAllMenus();
                request.setAttribute("menuList", list);
                request.getRequestDispatcher("admin-menu.jsp").forward(request, response);
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
        
        int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));
        String itemName = request.getParameter("itemName");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        boolean isAvailable = "on".equals(request.getParameter("isAvailable"));
        String imagePath = request.getParameter("imagePath");
        String foodType = request.getParameter("foodType");
        float rating = Float.parseFloat(request.getParameter("rating"));

        if ("add".equals(action)) {
            Menu newMenu = new Menu();
            newMenu.setRestaurantId(restaurantId);
            newMenu.setItemName(itemName);
            newMenu.setDescription(description);
            newMenu.setPrice(price);
            newMenu.setAvailable(isAvailable);
            newMenu.setImagePath(imagePath);
            newMenu.setFoodType(foodType);
            newMenu.setRating(rating);
            menuDAO.addMenu(newMenu);
        } else if ("update".equals(action)) {
            int menuId = Integer.parseInt(request.getParameter("menuId"));
            Menu updatedMenu = new Menu();
            updatedMenu.setMenuId(menuId);
            updatedMenu.setRestaurantId(restaurantId);
            updatedMenu.setItemName(itemName);
            updatedMenu.setDescription(description);
            updatedMenu.setPrice(price);
            updatedMenu.setAvailable(isAvailable);
            updatedMenu.setImagePath(imagePath);
            updatedMenu.setFoodType(foodType);
            updatedMenu.setRating(rating);
            menuDAO.updateMenu(updatedMenu);
        }
        response.sendRedirect("adminMenu?action=list");
    }
}
