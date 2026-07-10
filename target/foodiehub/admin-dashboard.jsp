<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("loggedInAdmin") == null) {
        response.sendRedirect("admin-login.jsp?error=Please login to access dashboard");
        return;
    }
    
    Integer totalRestaurants = (Integer) request.getAttribute("totalRestaurants");
    Integer totalMenuItems = (Integer) request.getAttribute("totalMenuItems");
    Integer totalUsers = (Integer) request.getAttribute("totalUsers");
    Integer totalOrders = (Integer) request.getAttribute("totalOrders");
    Double totalRevenue = (Double) request.getAttribute("totalRevenue");
    
    if (totalRestaurants == null) totalRestaurants = 0;
    if (totalMenuItems == null) totalMenuItems = 0;
    if (totalUsers == null) totalUsers = 0;
    if (totalOrders == null) totalOrders = 0;
    if (totalRevenue == null) totalRevenue = 0.0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard | FoodieHub</title>
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

    .page-title {
        font-size: 32px;
        color: #333;
        margin-bottom: 30px;
        border-bottom: 2px solid #ff6b00;
        padding-bottom: 10px;
        display: inline-block;
    }

    /* Dashboard Grid */
    .dashboard-grid {
        display: flex;
        flex-wrap: wrap;
        gap: 30px;
        justify-content: flex-start;
    }

    /* Card */
    .card {
        background: #fff;
        width: 250px;
        padding: 30px 20px;
        border-radius: 12px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        text-align: center;
        transition: 0.3s;
        border-top: 5px solid #ff6b00;
    }

    .card:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 25px rgba(0,0,0,0.15);
    }

    .card i {
        font-size: 40px;
        color: #ff6b00;
        margin-bottom: 15px;
    }

    .card h3 {
        font-size: 18px;
        color: #666;
        margin-bottom: 10px;
    }

    .card .value {
        font-size: 36px;
        font-weight: bold;
        color: #222;
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
        <h2 class="page-title">Dashboard Overview</h2>
        
        <div class="dashboard-grid">
            
            <div class="card">
                <i class="fa-solid fa-store"></i>
                <h3>Total Restaurants</h3>
                <div class="value"><%= totalRestaurants %></div>
            </div>

            <div class="card">
                <i class="fa-solid fa-pizza-slice"></i>
                <h3>Total Menu Items</h3>
                <div class="value"><%= totalMenuItems %></div>
            </div>

            <div class="card">
                <i class="fa-solid fa-users"></i>
                <h3>Total Users</h3>
                <div class="value"><%= totalUsers %></div>
            </div>

            <div class="card">
                <i class="fa-solid fa-receipt"></i>
                <h3>Total Orders</h3>
                <div class="value"><%= totalOrders %></div>
            </div>

            <div class="card">
                <i class="fa-solid fa-indian-rupee-sign"></i>
                <h3>Total Revenue</h3>
                <div class="value">₹<%= String.format("%.2f", totalRevenue) %></div>
            </div>
            
        </div>
    </div>

</body>
</html>
