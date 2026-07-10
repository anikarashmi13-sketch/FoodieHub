<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="com.tap.model.User"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Profile | FoodieHub</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial,sans-serif;
}

body{
    background:#f5f5f5;
}

/* Navbar */

.navbar{
    background:#ff6b00;
    color:white;
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:18px 40px;
}

.logo{
    font-size:30px;
    font-weight:bold;
}

.nav-links a{
    color:white;
    text-decoration:none;
    margin-left:25px;
    font-size:17px;
    font-weight:bold;
}

.nav-links a:hover{
    color:#ffe5d0;
}

/* Profile Card */

.profile-card{

    width:500px;

    margin:50px auto;

    background:white;

    border-radius:15px;

    padding:35px;

    box-shadow:0 5px 15px rgba(0,0,0,.15);

}

.profile-card h1{

    text-align:center;

    color:#ff6b00;

    margin-bottom:30px;

}

.info{

    margin:20px 0;

    font-size:18px;

}

.label{

    font-weight:bold;

    color:#444;

}

.value{

    color:#666;

}

.edit-btn{

    display:block;

    width:100%;

    text-align:center;

    margin-top:35px;

    background:#ff6b00;

    color:white;

    text-decoration:none;

    padding:14px;

    border-radius:8px;

    font-size:18px;

}

.edit-btn:hover{

    background:#e65c00;

}

</style>

</head>

<body>

<div class="navbar">

<div class="logo">

🍔 FoodieHub

</div>

<div class="nav-links">

<a href="restaurants">Restaurants</a>

<a href="cart.jsp">Cart</a>

<a href="orderHistory">My Orders</a>

<a href="logout">Logout</a>

</div>

</div>
<%

User user = (User)session.getAttribute("user");

if(user == null){

    response.sendRedirect("login.jsp");
    return;
}

%>

<div class="profile-card">

<h1>

👤 My Profile

</h1>

<div class="info">

<span class="label">Name :</span>

<span class="value">

<%=user.getName()%>

</span>

</div>

<div class="info">

<span class="label">Email :</span>

<span class="value">

<%=user.getEmail()%>

</span>

</div>

<div class="info">

<span class="label">Address :</span>

<span class="value">

<%=user.getAddress()%>

</span>

</div>

<a href="edit-profile.jsp"
   style="display:block;
          text-align:center;
          background:#ff6b00;
          color:white;
          padding:15px;
          text-decoration:none;
          border-radius:8px;
          margin-top:25px;">

Edit Profile

</a>

</div>

</body>
</html>