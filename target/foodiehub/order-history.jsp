<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ page import="java.util.*"%>
<%@ page import="com.tap.model.Order"%>
<%@ page import="com.tap.DAOImpl.RestaurantDAOImpl"%>
<%@ page import="com.tap.model.Restaurant"%>

<!DOCTYPE html>

<html>

<head>

<title>My Orders</title>

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

align-items:center;

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

margin-left:25px;

font-weight:bold;

}

.links a:hover{

color:#ff6b00;

}

h1{

text-align:center;

margin:35px;

}

.card{

width:80%;

margin:20px auto;

background:white;

padding:25px;

border-radius:15px;

box-shadow:0 4px 15px rgba(0,0,0,.12);

}

.restaurant{

font-size:28px;

color:#ff6b00;

margin-bottom:15px;

}

.info{

margin:10px 0;

font-size:18px;

}

.status{

color:green;

font-weight:bold;

font-size:18px;

}
.details-btn{

    background:#ff6b00;

    color:white;

    border:none;

    padding:12px 20px;

    border-radius:8px;

    cursor:pointer;

    font-size:16px;
}

.details-btn:hover{

    background:#e65c00;
}

/* ================= TRACKING ================= */

.tracking{

margin-top:30px;

padding-left:15px;

position:relative;

}

.track-step{

display:flex;

align-items:center;

margin:22px 0;

position:relative;

}

.track-icon{

width:46px;

height:46px;

border-radius:50%;

display:flex;

align-items:center;

justify-content:center;

font-size:22px;

background:#ddd;

color:white;

transition:.4s;

z-index:2;

}

.track-text{

margin-left:18px;

}

.track-title{

font-size:18px;

font-weight:bold;

}

.track-sub{

font-size:14px;

color:#777;

margin-top:4px;

}

.track-line{

position:absolute;

left:22px;

top:45px;

width:3px;

height:42px;

background:#ddd;

}

.completed .track-icon{

background:#18a957;

box-shadow:0 0 15px rgba(24,169,87,.45);

}

.completed .track-line{

background:#18a957;

}

.current .track-icon{

background:#ff6b00;

animation:pulse 1.2s infinite;

box-shadow:0 0 18px rgba(255,107,0,.55);

}

.pending .track-icon{

background:#d9d9d9;

}

@keyframes pulse{

0%{

transform:scale(1);

}

50%{

transform:scale(1.15);

}

100%{

transform:scale(1);

}

}

.status-banner{

margin-top:20px;

padding:15px;

color:white;

font-size:18px;

font-weight:bold;

text-align:center;

border-radius:12px;

box-shadow:0 5px 15px rgba(0,0,0,.12);

animation:fadeIn .5s ease;

}

@keyframes fadeIn{

from{

opacity:0;

transform:translateY(-10px);

}

to{

opacity:1;

transform:translateY(0);

}

}

.payment-badge{

background:#fff3e0;

color:#ff6b00;

padding:6px 14px;

border-radius:20px;

font-size:15px;

font-weight:bold;

margin-left:8px;

}

.order-header{

display:flex;

align-items:center;

gap:20px;

margin-bottom:20px;

}

.restaurant-img{

width:120px;

height:120px;

border-radius:18px;

object-fit:cover;

box-shadow:0 5px 15px rgba(0,0,0,.15);

}

.restaurant-details{

flex:1;

} 

.progress{

width:100%;

height:12px;

background:#eee;

border-radius:30px;

margin-top:18px;

overflow:hidden;

}

.progress-fill{

height:100%;

background:linear-gradient(90deg,#ff6b00,#ff9800);

transition:1s;

}

/* ================= DELIVERY MAP ================= */

.delivery-map{

margin-top:25px;

padding:20px;

background:#fafafa;

border-radius:15px;

border:1px solid #eee;

}

.map-track{

position:relative;

height:70px;

margin:15px 0;

}

.road{

position:absolute;

top:32px;

left:50px;

right:50px;

height:6px;

background:#ddd;

border-radius:20px;

}

.restaurant-icon{

position:absolute;

left:0;

top:18px;

font-size:35px;

}

.home-icon{

position:absolute;

right:0;

top:18px;

font-size:35px;

}

.bike{

position:absolute;
top:12px;
font-size:32px;
transition:left 1s ease-in-out;

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

<a href="cart.jsp">Cart</a>

<a href="restaurants">Restaurants</a>

</div>

</div>

<h1>

My Orders

</h1>

<%
List<Order> orders =
(List<Order>)request.getAttribute("orders");

RestaurantDAOImpl dao =
new RestaurantDAOImpl();

if(orders==null || orders.isEmpty()){
%>

<h2 style="text-align:center;">

No Orders Found

</h2>

<%
}
else{

for(Order order:orders){

Restaurant restaurant =
dao.getRestaurantById(
order.getRestaurantId());
%>

<div class="card">
<div class="order-header">

<img
src="<%=restaurant.getImagePath()%>"
class="restaurant-img">

<div class="restaurant-details">

<div class="restaurant">

<%=restaurant.getName()%>

</div>

<div class="info">

🚴 Delivery Partner :
<b>Rahul Kumar</b>

</div>

<div class="info">

⏱ ETA :
<b>20-25 mins</b>

</div>

</div>

</div>

<div class="info">

🚴 <b>Delivery Partner :</b> Rahul Kumar

</div>

<div class="info">

⏱ <b>Estimated Delivery :</b> 20 - 25 mins

</div>

<div class="info">

<b>🧾 Order :</b>

#FH<%=String.format("%04d", order.getOrderId())%>

</div>

<%
java.text.SimpleDateFormat dateFormat =
new java.text.SimpleDateFormat("dd MMM yyyy");

java.text.SimpleDateFormat timeFormat =
new java.text.SimpleDateFormat("hh:mm a");
%>

<div class="info">

📅 <b>Date :</b>

<%=dateFormat.format(order.getOrderDate())%>

</div>

<div class="info">

🕒 <b>Time :</b>

<%=timeFormat.format(order.getOrderDate())%>

</div>
<div class="info">

💳 <b>Payment :</b>

<span class="payment-badge">

<%=order.getPaymentMode()%>

</span>

</div>

<div class="info">

💰 <b>Total :</b>

<span style="font-size:24px;
color:#18a957;
font-weight:bold;">

₹ <%=String.format("%.2f",order.getTotalAmount())%>

</span>

</div>
<%
String status = order.getStatus();
%>
<%
String bannerColor = "#ff6b00";
String bannerText = "";

if(status.equals("Placed")){

    bannerText="📦 Order Confirmed";

}
else if(status.equals("Preparing")){

    bannerText="👨‍🍳 Your food is being prepared";

}
else if(status.equals("Out For Delivery")){

    bannerText="🛵 Your order is on the way";

}
else{

    bannerColor="#18a957";

    bannerText="🎉 Order Delivered";

}
%>
<div id="banner-<%=order.getOrderId()%>"
     class="status-banner"
     style="background:<%=bannerColor%>;">

    <%=bannerText%>

</div>

<%
int progress = 25;

if(status.equals("Preparing")){

    progress = 50;

}
else if(status.equals("Out For Delivery")){

    progress = 75;

}
else if(status.equals("Delivered")){

    progress = 100;

}
%>

<div class="progress">

<div
class="progress-fill"
style="width:<%=progress%>%">

</div>

</div>

<div
style="text-align:right;
font-weight:bold;
margin-top:8px;">

<%=progress%>% Completed

</div>
<div id="tracking-<%=order.getOrderId()%>"
     class="tracking">
     
     <%
String bikePosition = "0%";

if(status.equals("Placed")){

    bikePosition = "0%";

}
else if(status.equals("Preparing")){

    bikePosition = "25%";

}
else if(status.equals("Out For Delivery")){

    bikePosition = "65%";

}
else if(status.equals("Delivered")){

    bikePosition = "92%";

}
%>

<div class="delivery-map">

    <h3 style="margin-bottom:15px;color:#444;">
        Live Delivery Tracking
    </h3>

    <div class="map-track">

        <div class="restaurant-icon">
            🍔
        </div>

        <div class="road"></div>

        <div class="bike"
             style="left:<%=bikePosition%>;">
            🛵
        </div>

        <div class="home-icon">
            🏠
        </div>

    </div>

</div>

    <!-- Ordered -->

    <div class="track-step completed">

        <div class="track-icon">📦</div>

        <div class="track-text">

            <div class="track-title">Ordered</div>

            <div class="track-sub">
                Your order has been placed
            </div>

        </div>

        <div class="track-line"></div>

    </div>

    <!-- Preparing -->

    <div class="track-step <%= status.equals("Preparing") ? "current"
            : (status.equals("Out For Delivery") || status.equals("Delivered")) ? "completed" : "pending" %>">

        <div class="track-icon">👨‍🍳</div>

        <div class="track-text">

            <div class="track-title">Preparing</div>

            <div class="track-sub">
                Restaurant is preparing your food
            </div>

        </div>

        <div class="track-line"></div>

    </div>

    <!-- Out For Delivery -->

    <div class="track-step <%= status.equals("Out For Delivery") ? "current"
            : status.equals("Delivered") ? "completed" : "pending" %>">

        <div class="track-icon">🛵</div>

        <div class="track-text">

            <div class="track-title">Out For Delivery</div>

            <div class="track-sub">
                Rider is on the way
            </div>

        </div>

        <div class="track-line"></div>

    </div>

    <!-- Delivered -->

    <div class="track-step <%= status.equals("Delivered") ? "completed" : "pending" %>">

        <div class="track-icon">🏠</div>

        <div class="track-text">

            <div class="track-title">Delivered</div>

            <div class="track-sub">
                Enjoy your meal ❤️
            </div>

        </div>

    </div>

</div>
<br>

<form action="orderDetails" method="get">

    <input
        type="hidden"
        name="orderId"
        value="<%=order.getOrderId()%>">

    <button type="submit" class="details-btn">

        View Details

    </button>

</form>

</div>


<%

}

}

%>

</body>

</html>