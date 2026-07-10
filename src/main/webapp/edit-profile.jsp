<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.tap.model.User"%>

<%
User user = (User)session.getAttribute("user");

if(user==null){

    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Edit Profile</title>

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

display:flex;
justify-content:space-between;
align-items:center;

padding:18px 40px;

background:#ff6b00;

}

.logo{

font-size:30px;
font-weight:bold;
color:white;

}

.nav-links a{

color:white;
text-decoration:none;
margin-left:25px;
font-size:18px;
font-weight:bold;

}

.nav-links a:hover{

color:#ffe5d0;

}

/* Form */

.container{

width:450px;

margin:60px auto;

background:white;

padding:35px;

border-radius:15px;

box-shadow:0 5px 18px rgba(0,0,0,.15);

}

h1{

text-align:center;

color:#ff6b00;

margin-bottom:30px;

}

label{

display:block;

margin-top:18px;

font-weight:bold;

}

input{

width:100%;

padding:12px;

margin-top:8px;

border:1px solid #ccc;

border-radius:8px;

font-size:16px;

}

button{

width:100%;

margin-top:30px;

padding:14px;

background:#ff6b00;

border:none;

color:white;

font-size:18px;

border-radius:8px;

cursor:pointer;

}

button:hover{

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

<a href="profile.jsp">Profile</a>

<a href="logout">Logout</a>

</div>

</div>

<div class="container">

<h1>Edit Profile</h1>

<form action="updateProfile" method="post">

<input
type="hidden"
name="userId"
value="<%=user.getUserId()%>">

<label>Name</label>

<input
type="text"
name="name"
value="<%=user.getName()%>"
required>

<label>Email</label>

<input
type="email"
name="email"
value="<%=user.getEmail()%>"
required>

<label>Password</label>

<input
type="password"
name="password"
placeholder="Enter New Password"
required>

<label>Address</label>

<input
type="text"
name="address"
value="<%=user.getAddress()%>"
required>

<button type="submit">

Update Profile

</button>

</form>

</div>

</body>

</html>