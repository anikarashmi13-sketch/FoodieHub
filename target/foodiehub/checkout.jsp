<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="com.tap.model.Cart"%>
<%@ page import="com.tap.model.CartItem"%>
<%@ page import="com.tap.model.User"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout | FoodieHub</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial,sans-serif;
}

body{
    background:#f4f4f4;
}

/* NAVBAR */

.navbar{

    background:white;

    display:flex;

    justify-content:space-between;

    align-items:center;

    padding:18px 50px;

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

    font-size:17px;

    font-weight:bold;
}

.links a:hover{

    color:#ff6b00;
}

/* Heading */

.heading{

    text-align:center;

    margin:35px;

    font-size:42px;

    color:#333;
}

/* Main */

.container{

    width:95%;

    max-width:1200px;

    margin:auto;

    display:flex;

    gap:30px;

    margin-bottom:40px;
}

.left{

    flex:2;
}

.right{

    flex:1;
}

.card{

    background:white;

    border-radius:12px;

    padding:25px;

    margin-bottom:25px;

    box-shadow:0 4px 15px rgba(0,0,0,.12);
}

.card h2{

    color:#ff6b00;

    margin-bottom:20px;
}

.info{

    font-size:18px;

    margin:10px 0;
}

.payment label{

    display:block;

    margin:15px 0;

    font-size:17px;

    cursor:pointer;
}

.item{

    display:flex;

    justify-content:space-between;

    margin:15px 0;
}

.item-name{

    font-size:17px;
}

.price{

    font-weight:bold;
}

hr{

    margin:15px 0;
}

.total{

    display:flex;

    justify-content:space-between;

    font-size:24px;

    font-weight:bold;
}

button{

    width:100%;

    padding:15px;

    border:none;

    border-radius:8px;

    background:#ff6b00;

    color:white;

    font-size:18px;

    cursor:pointer;

    margin-top:25px;
}

button:hover{

    background:#e65c00;
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

<a href="restaurants">Restaurants</a>

<a href="cart.jsp">Cart</a>

<a href="orderHistory">My Orders</a>

</div>

</div>

<%

User user=(User)session.getAttribute("user");

Cart cart=(Cart)session.getAttribute("cart");

if(user == null){

    // Save the page the user wanted to visit
    session.setAttribute("redirectAfterLogin", "checkout.jsp");

    response.sendRedirect("login.jsp");

    return;

}

if(cart==null || cart.getItems().isEmpty()){

response.sendRedirect("cart.jsp");

return;

}

double subtotal=0;

for(CartItem item:cart.getItems()){

subtotal+=item.getPrice()*item.getQuantity();

}

double deliveryFee=40;

double gst=subtotal*0.05;

double grandTotal=subtotal+deliveryFee+gst;

%>

<h1 class="heading">
Checkout
</h1>

<form action="payment" method="post">

<div class="container">

    <!-- LEFT SIDE -->

    <div class="left">

        <div class="card">

            <h2>Delivery Address</h2>

            <p class="info">
                <b>Name :</b> <%=user.getName()%>
            </p>

            <p class="info">
                <b>Address :</b> <%=user.getAddress()%>
            </p>

        </div>

        <div class="card payment">

            <h2>Payment Method</h2>

            <label>
                <input type="radio"
                       name="paymentMethod"
                       value="Cash On Delivery"
                       checked>
                Cash On Delivery
            </label>

            <label>
                <input type="radio"
                       name="paymentMethod"
                       value="UPI">
                UPI
            </label>

            <label>
                <input type="radio"
                       name="paymentMethod"
                       value="Credit Card">
                Credit Card
            </label>

            <label>
                <input type="radio"
                       name="paymentMethod"
                       value="Debit Card">
                Debit Card
            </label>

        </div>

    </div>

    <!-- RIGHT SIDE -->

    <div class="right">

    <div class="card">

        <h2>Order Summary</h2>

        <%
        for(CartItem item : cart.getItems()){
        %>

        <div class="item">

            <div class="item-name">
                <b><%=item.getItemName()%></b><br>
                Quantity : <%=item.getQuantity()%>
            </div>

            <div class="price">
                ₹ <%=item.getPrice() * item.getQuantity()%>
            </div>

        </div>

        <%
        }
        %>

        <hr>

        <div class="item">
            <span>Subtotal</span>
            <span>₹ <%=subtotal%></span>
        </div>

        <div class="item">
            <span>Delivery Fee</span>
            <span>₹ <%=deliveryFee%></span>
        </div>

        <div class="item">
            <span>GST (5%)</span>
            <span>₹ <%=String.format("%.2f", gst)%></span>
        </div>

        <hr>

        <div class="total">
            <span>Grand Total</span>
            <span>₹ <%=String.format("%.2f", grandTotal)%></span>
        </div>

        <button type="submit">
            Continue
        </button>

    </div>

</div>

</div>

</form>

</body>

</html>