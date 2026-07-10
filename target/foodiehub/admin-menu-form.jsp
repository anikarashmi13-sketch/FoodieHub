<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.tap.model.Menu" %>
<%
    if (session.getAttribute("loggedInAdmin") == null) {
        response.sendRedirect("admin-login.jsp?error=Please login to access dashboard");
        return;
    }
    
    Menu m = (Menu) request.getAttribute("menu");
    boolean isEdit = (m != null);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= isEdit ? "Edit" : "Add" %> Menu Item | FoodieHub</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<style>
    * { margin: 0; padding: 0; box-sizing: border-box; font-family: Arial, sans-serif; }
    body { background: #f8f8f8; }
    .navbar { background: #ff6b00; padding: 18px 60px; display: flex; justify-content: space-between; align-items: center; }
    .logo { color: white; font-size: 28px; font-weight: bold; }
    .navbar a { color: white; text-decoration: none; margin-left: 25px; font-size: 16px; font-weight: bold; transition: .3s; }
    .navbar a:hover { color: #ffe0c7; }
    
    .container { padding: 40px 60px; display: flex; justify-content: center; }
    .form-wrapper { background: white; width: 600px; padding: 30px; border-radius: 12px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); border-top: 5px solid #ff6b00; }
    .page-title { font-size: 28px; color: #333; margin-bottom: 25px; text-align: center; }
    
    .form-group { margin-bottom: 15px; }
    .form-group label { display: block; margin-bottom: 8px; color: #555; font-weight: bold; }
    .form-group input[type="text"], .form-group input[type="number"], .form-group textarea { width: 100%; padding: 12px; border: 1px solid #ddd; border-radius: 6px; font-size: 16px; outline: none; }
    .form-group input:focus, .form-group textarea:focus { border-color: #ff6b00; }
    
    .checkbox-group { display: flex; align-items: center; gap: 10px; }
    .checkbox-group input { width: 20px; height: 20px; }

    .btn-submit { width: 100%; padding: 14px; background: #ff6b00; color: white; border: none; border-radius: 6px; font-size: 18px; font-weight: bold; cursor: pointer; transition: 0.3s; margin-top: 15px; }
    .btn-submit:hover { background: #e65c00; }
    
    .back-link { display: block; text-align: center; margin-top: 20px; color: #777; text-decoration: none; }
    .back-link:hover { color: #ff6b00; text-decoration: underline; }
</style>
</head>
<body>

    <div class="navbar">
        <div class="logo"><i class="fa-solid fa-utensils"></i> FoodieHub Admin</div>
        <div>
            <a href="adminDashboard"><i class="fa-solid fa-chart-line"></i> Dashboard</a>
            <a href="adminRestaurants"><i class="fa-solid fa-store"></i> Restaurants</a>
            <a href="adminMenu"><i class="fa-solid fa-pizza-slice"></i> Menu</a>
            <a href="adminUsers"><i class="fa-solid fa-users"></i> Users</a>
            <a href="adminOrders"><i class="fa-solid fa-receipt"></i> Orders</a>
            <a href="adminLogout"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
        </div>
    </div>

    <div class="container">
        <div class="form-wrapper">
            <h2 class="page-title"><%= isEdit ? "Edit" : "Add" %> Menu Item</h2>
            
            <form action="adminMenu" method="post">
                <input type="hidden" name="action" value="<%= isEdit ? "update" : "add" %>">
                <% if(isEdit) { %>
                    <input type="hidden" name="menuId" value="<%= m.getMenuId() %>">
                <% } %>
                
                <div class="form-group">
                    <label>Restaurant ID</label>
                    <input type="number" name="restaurantId" value="<%= isEdit ? m.getRestaurantId() : "" %>" required>
                </div>

                <div class="form-group">
                    <label>Item Name</label>
                    <input type="text" name="itemName" value="<%= isEdit ? m.getItemName() : "" %>" required>
                </div>
                
                <div class="form-group">
                    <label>Description</label>
                    <textarea name="description" rows="3" required><%= isEdit ? m.getDescription() : "" %></textarea>
                </div>

                <div class="form-group">
                    <label>Price (₹)</label>
                    <input type="number" step="0.01" name="price" value="<%= isEdit ? m.getPrice() : "" %>" required>
                </div>

                <div class="form-group">
                    <label>Image URL (Path)</label>
                    <input type="text" name="imagePath" value="<%= isEdit ? m.getImagePath() : "" %>" required>
                </div>
                
                <div class="form-group">
                    <label>Food Type (e.g., Veg, Non-Veg)</label>
                    <input type="text" name="foodType" value="<%= isEdit ? m.getFoodType() : "" %>" required>
                </div>
                
                <div class="form-group">
                    <label>Rating</label>
                    <input type="number" step="0.1" name="rating" value="<%= isEdit ? m.getRating() : "4.0" %>" required>
                </div>
                
                <div class="form-group checkbox-group">
                    <input type="checkbox" name="isAvailable" id="isAvailable" <%= (!isEdit || m.isAvailable()) ? "checked" : "" %>>
                    <label for="isAvailable" style="margin-bottom:0;">Is Available?</label>
                </div>
                
                <button type="submit" class="btn-submit"><%= isEdit ? "Update Menu Item" : "Save Menu Item" %></button>
            </form>
            
            <a href="adminMenu" class="back-link">&larr; Back to List</a>
        </div>
    </div>
</body>
</html>
