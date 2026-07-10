<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ page import="java.util.*"%>
<%@ page import="com.tap.model.OrderItem"%>
<%@ page import="com.tap.model.Menu"%>
<%@ page import="com.tap.DAOImpl.MenuDAOImpl"%>

<!DOCTYPE html>

<html>

<head>

<title>Order Details</title>

<style>

body{
font-family:Arial,sans-serif;
background:#f4f4f4;
margin:0;
}

.navbar{
background:white;
padding:18px 50px;
display:flex;
justify-content:space-between;
box-shadow:0 2px 10px rgba(0,0,0,.1);
}

.logo{
font-size:30px;
font-weight:bold;
color:#ff6b00;
}

.links a{
text-decoration:none;
color:#333;
margin-left:20px;
font-weight:bold;
}

.container{
width:80%;
margin:40px auto;
}

.card{
background:white;
padding:20px;
margin-bottom:20px;
border-radius:15px;
box-shadow:0 4px 12px rgba(0,0,0,.15);
display:flex;
justify-content:space-between;
align-items:center;
}

.left{
display:flex;
align-items:center;
gap:20px;
}

.left img{
width:120px;
height:100px;
object-fit:cover;
border-radius:10px;
}

.total{
font-size:18px;
font-weight:bold;
color:#ff6b00;
}

.back{
display:block;
margin:30px auto;
padding:12px 30px;
background:#ff6b00;
color:white;
text-decoration:none;
text-align:center;
width:200px;
border-radius:8px;
}

</style>

</head>

<body>

<div class="navbar">

<div class="logo">

FoodieHub

</div>

<div class="links">

<a href="restaurants">Home</a>

<a href="orderHistory">My Orders</a>

</div>

</div>

<div class="container">

<h1>Order Details</h1>

<%

List<OrderItem> orderItems =
(List<OrderItem>)request.getAttribute("orderItems");

MenuDAOImpl menuDAO =
new MenuDAOImpl();

double grandTotal = 0;

for(OrderItem item : orderItems){

Menu menu =
menuDAO.getMenuById(item.getMenuId());

grandTotal += item.getItemTotal();

%>

<div class="card">

<div class="left">

<img src="<%=menu.getImagePath()%>">

<div>

<h2>

<%=menu.getItemName()%>

</h2>

<p>

Quantity :
<%=item.getQuantity()%>

</p>

</div>

</div>

<div class="total">

₹ <%=item.getItemTotal()%>

</div>

</div>

<%

}

%>

<h2 style="text-align:right;">

Grand Total :
₹ <%=grandTotal%>

</h2>

<a class="back"
href="orderHistory">

Back To Orders

</a>

</div>

</body>

</html>