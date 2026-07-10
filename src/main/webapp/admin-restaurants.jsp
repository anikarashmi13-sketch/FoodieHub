<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.tap.model.Restaurant" %>
<%
    if (session.getAttribute("loggedInAdmin") == null) {
        response.sendRedirect("admin-login.jsp?error=Please login to access dashboard");
        return;
    }
    List<Restaurant> restaurantList = (List<Restaurant>) request.getAttribute("restaurantList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Restaurants | FoodieHub</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: Arial, sans-serif;
    }

    body {
        background: #f8f8f8;
    }

    /* Navbar */
    .navbar {
        background: #ff6b00;
        padding: 18px 60px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .logo {
        color: white;
        font-size: 28px;
        font-weight: bold;
    }

    .navbar a {
        color: white;
        text-decoration: none;
        margin-left: 25px;
        font-size: 16px;
        font-weight: bold;
        transition: .3s;
    }

    .navbar a:hover {
        color: #ffe0c7;
    }

    /* Main Container */
    .container {
        padding: 40px 60px;
    }

    .header-flex {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
    }

    .page-title {
        font-size: 32px;
        color: #333;
        border-bottom: 2px solid #ff6b00;
        padding-bottom: 10px;
    }

    .btn-add {
        background: #28a745;
        color: white;
        padding: 10px 20px;
        text-decoration: none;
        border-radius: 5px;
        font-weight: bold;
        transition: 0.3s;
    }

    .btn-add:hover {
        background: #218838;
    }

    /* Table */
    table {
        width: 100%;
        border-collapse: collapse;
        background: #fff;
        box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        border-radius: 8px;
        overflow: hidden;
    }

    th, td {
        padding: 15px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    th {
        background: #ff6b00;
        color: white;
    }

    tr:hover {
        background: #f1f1f1;
    }

    .action-btn {
        padding: 8px 12px;
        border-radius: 4px;
        text-decoration: none;
        color: white;
        font-weight: bold;
        font-size: 14px;
        margin-right: 5px;
    }

    .btn-edit { background: #007bff; }
    .btn-edit:hover { background: #0056b3; }

    .btn-delete { background: #dc3545; }
    .btn-delete:hover { background: #c82333; }

    .img-preview {
        width: 60px;
        height: 60px;
        object-fit: cover;
        border-radius: 5px;
    }
</style>
</head>
<body>

    <div class="navbar">
        <div class="logo">
            <i class="fa-solid fa-utensils"></i> FoodieHub Admin
        </div>
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
        <div class="header-flex">
            <h2 class="page-title">Manage Restaurants</h2>
            <a href="adminRestaurants?action=new" class="btn-add"><i class="fa-solid fa-plus"></i> Add Restaurant</a>
        </div>
        
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Image</th>
                    <th>Name</th>
                    <th>Cuisine</th>
                    <th>ETA</th>
                    <th>Rating</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% if(restaurantList != null && !restaurantList.isEmpty()) { 
                    for(Restaurant r : restaurantList) { %>
                <tr>
                    <td><%= r.getRestaurantId() %></td>
                    <td><img src="<%= r.getImagePath() %>" alt="img" class="img-preview" onerror="this.src='https://via.placeholder.com/60'"></td>
                    <td><strong><%= r.getName() %></strong></td>
                    <td><%= r.getCuisineType() %></td>
                    <td><%= r.getEta() %></td>
                    <td><i class="fa-solid fa-star" style="color:#ffc107;"></i> <%= r.getRating() %></td>
                    <td>
                        <% if(r.isActive()) { %>
                            <span style="color:green;font-weight:bold;">Active</span>
                        <% } else { %>
                            <span style="color:red;font-weight:bold;">Inactive</span>
                        <% } %>
                    </td>
                    <td>
                        <a href="adminRestaurants?action=edit&id=<%= r.getRestaurantId() %>" class="action-btn btn-edit"><i class="fa-solid fa-pen-to-square"></i></a>
                        <a href="adminRestaurants?action=delete&id=<%= r.getRestaurantId() %>" class="action-btn btn-delete" onclick="return confirm('Are you sure you want to delete this restaurant?');"><i class="fa-solid fa-trash"></i></a>
                    </td>
                </tr>
                <%  } 
                   } else { %>
                <tr>
                    <td colspan="8" style="text-align:center;">No restaurants found.</td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

</body>
</html>
