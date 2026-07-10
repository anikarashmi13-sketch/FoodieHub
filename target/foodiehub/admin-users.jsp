<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.tap.model.User" %>
<%
    if (session.getAttribute("loggedInAdmin") == null) {
        response.sendRedirect("admin-login.jsp?error=Please login to access dashboard");
        return;
    }
    List<User> userList = (List<User>) request.getAttribute("userList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Users | FoodieHub</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<style>
    * { margin: 0; padding: 0; box-sizing: border-box; font-family: Arial, sans-serif; }
    body { background: #f8f8f8; }
    .navbar { background: #ff6b00; padding: 18px 60px; display: flex; justify-content: space-between; align-items: center; }
    .logo { color: white; font-size: 28px; font-weight: bold; }
    .navbar a { color: white; text-decoration: none; margin-left: 25px; font-size: 16px; font-weight: bold; transition: .3s; }
    .navbar a:hover { color: #ffe0c7; }
    
    .container { padding: 40px 60px; }
    .header-flex { display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px; }
    .page-title { font-size: 32px; color: #333; border-bottom: 2px solid #ff6b00; padding-bottom: 10px; }

    table { width: 100%; border-collapse: collapse; background: #fff; box-shadow: 0 4px 15px rgba(0,0,0,0.1); border-radius: 8px; overflow: hidden; }
    th, td { padding: 15px; text-align: left; border-bottom: 1px solid #ddd; }
    th { background: #ff6b00; color: white; }
    tr:hover { background: #f1f1f1; }
    
    .action-btn{
    display:inline-flex;
    align-items:center;
    justify-content:center;
    gap:8px;
    min-width:100px;
    padding:10px 18px;
    border-radius:8px;
    text-decoration:none;
    color:white;
    font-weight:600;
    font-size:15px;
    transition:0.3s;
    white-space:nowrap;
}

.btn-delete{
    background:#dc3545;
}

.btn-delete:hover{
    background:#c82333;
    transform:translateY(-2px);
}
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
        <div class="header-flex">
            <h2 class="page-title">Manage Users</h2>
        </div>
        
        <table>
            <thead>
                <tr>
                    <th>User ID</th><th>Name</th><th>Email</th><th>Address</th><th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% if(userList != null && !userList.isEmpty()) { 
                    for(User u : userList) { %>
                <tr>
                    <td><strong><%= u.getUserId() %></strong></td>
                    <td><%= u.getName() %></td>
                    <td><%= u.getEmail() %></td>
                    <td><%= u.getAddress() %></td>
                    <td>
                        <a href="adminUsers?action=delete&id=<%= u.getUserId() %>" class="action-btn btn-delete" onclick="return confirm('Are you sure you want to delete this user?');"><i class="fa-solid fa-trash"></i> Delete</a>
                    </td>
                </tr>
                <%  } 
                   } else { %>
                <tr>
                    <td colspan="5" style="text-align:center;">No users found.</td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

</body>
</html>
