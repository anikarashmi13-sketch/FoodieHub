<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.tap.model.Order" %>
<%
    if (session.getAttribute("loggedInAdmin") == null) {
        response.sendRedirect("admin-login.jsp?error=Please login to access dashboard");
        return;
    }
    List<Order> orderList = (List<Order>) request.getAttribute("orderList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Orders | FoodieHub</title>
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
    
    .status-select { padding: 8px; border-radius: 5px; border: 1px solid #ccc; outline: none; }
    .btn-update { padding: 8px 12px; background: #28a745; color: white; border: none; border-radius: 5px; cursor: pointer; font-weight: bold; margin-left: 5px; transition: 0.3s;}
    .btn-update:hover { background: #218838; }

    .status-badge { padding: 5px 10px; border-radius: 20px; font-weight: bold; font-size: 13px; color: white; }
    .status-placed { background: #0dcaf0; }
    .status-preparing { background: #ffc107; color: #333; }
    .status-out { background: #0d6efd; }
    .status-delivered { background: #198754; }
</style>
</head>
<body>

    <div class="navbar">
        <div class="logo"><i class="fa-solid fa-utensils"></i> FoodieHub Admin</div>
        <div>
            <a href="adminDashboard"><i class="fa-solid fa-chart-line"></i> Dashboard</a>
            <a href="adminRestaurants"><i class="fa-solid fa-store"></i> Restaurants</a>
            <a href="adminMenu"><i class="fa-solid fa-pizza-slice"></i> Menu</a>
            <a href="#"><i class="fa-solid fa-users"></i> Users</a>
            <a href="adminOrders"><i class="fa-solid fa-receipt"></i> Orders</a>
            <a href="adminLogout"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
        </div>
    </div>

    <div class="container">
        <div class="header-flex">
            <h2 class="page-title">Manage Orders</h2>
        </div>
        
        <table>
            <thead>
                <tr>
                    <th>Order ID</th><th>User ID</th><th>Rest. ID</th><th>Amount</th><th>Date</th><th>Status</th><th>Update Status</th>
                </tr>
            </thead>
            <tbody>
                <% if(orderList != null && !orderList.isEmpty()) { 
                    for(Order o : orderList) { 
                        String badgeClass = "";
                        if(o.getStatus() != null) {
                            switch(o.getStatus()) {
                                case "Placed": badgeClass = "status-placed"; break;
                                case "Preparing": badgeClass = "status-preparing"; break;
                                case "Out For Delivery": badgeClass = "status-out"; break;
                                case "Delivered": badgeClass = "status-delivered"; break;
                                default: badgeClass = "status-placed";
                            }
                        }
                %>
                <tr>
                    <td><strong>#<%= o.getOrderId() %></strong></td>
                    <td><%= o.getUserId() %></td>
                    <td><%= o.getRestaurantId() %></td>
                    <td>₹<%= String.format("%.2f", o.getTotalAmount()) %></td>
                    <td><%= o.getOrderDate() %></td>
                    <td><span class="status-badge <%= badgeClass %>"><%= o.getStatus() %></span></td>
                    <td>
                        <form action="adminOrders" method="post" style="display:flex; align-items:center;">
                            <input type="hidden" name="action" value="updateStatus">
                            <input type="hidden" name="orderId" value="<%= o.getOrderId() %>">
                            <select name="status" class="status-select">
                                <option value="Placed" <%= "Placed".equals(o.getStatus()) ? "selected" : "" %>>Placed</option>
                                <option value="Preparing" <%= "Preparing".equals(o.getStatus()) ? "selected" : "" %>>Preparing</option>
                                <option value="Out For Delivery" <%= "Out For Delivery".equals(o.getStatus()) ? "selected" : "" %>>Out For Delivery</option>
                                <option value="Delivered" <%= "Delivered".equals(o.getStatus()) ? "selected" : "" %>>Delivered</option>
                            </select>
                            <button type="submit" class="btn-update">Update</button>
                        </form>
                    </td>
                </tr>
                <%  } 
                   } else { %>
                <tr>
                    <td colspan="7" style="text-align:center;">No orders found.</td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

</body>
</html>
