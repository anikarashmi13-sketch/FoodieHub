<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="com.tap.model.Cart" %>
<%@ page import="com.tap.model.CartItem" %>
<%@ page import="java.util.*" %>

<html>

<head>

<title>FoodieHub | My Cart</title>

<meta charset="UTF-8">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:Arial,sans-serif;
}

body{
background:#f8f8f8;
}

/* NAVBAR */

.navbar{

background:white;

padding:18px 60px;

display:flex;

justify-content:space-between;

align-items:center;

box-shadow:0 2px 12px rgba(0,0,0,.08);

position:sticky;

top:0;

z-index:1000;
}

.logo{

font-size:34px;

font-weight:bold;

color:#ff6b00;
}

.links{

display:flex;

gap:30px;
}

.links a{

text-decoration:none;

font-size:18px;

color:#333;

font-weight:bold;

transition:.3s;
}

.links a:hover{

color:#ff6b00;
}

.page-title{

width:1200px;

margin:35px auto;

font-size:38px;

font-weight:bold;

color:#222;
}

/* MAIN */

.main{

width:1200px;

margin:auto;

display:flex;

gap:35px;

align-items:flex-start;
}

/* LEFT */

.left{

flex:2;
}

/* RIGHT */

.right{

flex:1;

position:sticky;

top:110px;
}

/* CARD */

.card{

display:flex;

background:white;

border-radius:18px;

padding:22px;

margin-bottom:28px;

box-shadow:0 6px 18px rgba(0,0,0,.08);

transition:.3s;
}

.card:hover{

transform:translateY(-5px);

box-shadow:0 10px 25px rgba(0,0,0,.14);
}

.food-image{

width:220px;

height:170px;

border-radius:15px;

object-fit:cover;
}

.info{

margin-left:25px;

flex:1;
}

.item-name{

font-size:30px;

font-weight:bold;

color:#222;
}

.desc{

margin-top:10px;

color:#777;

font-size:16px;

line-height:1.6;
}

.price{

margin-top:18px;

font-size:28px;

font-weight:bold;

color:#ff6b00;
}

.price-row{

    display:flex;

    align-items:center;

    gap:12px;

    margin-top:18px;
}

.current-price{

    font-size:32px;

    font-weight:bold;

    color:#ff6b00;
}

.old-price{

    text-decoration:line-through;

    color:#9a9a9a;

    font-size:16px;

    margin-top:6px;
}
.save{

    background:#e8f8ee;

    color:#1ba672;

    padding:4px 10px;

    border-radius:20px;

    font-size:14px;

    font-weight:bold;
}

/* QUANTITY */
.quantity{

display:flex;

align-items:center;

gap:12px;

margin-top:18px;
}
.qty-btn{

width:48px;

height:48px;

border-radius:50%;

border:none;

background:#ff6b00;

color:white;

font-size:22px;

cursor:pointer;

transition:.3s;
}

.qty-btn:hover{

background:#e95d00;
}


.remove-btn{

    margin-top:18px;

    background:#fff;

    color:#ff4d4f;

    border:2px solid #ff4d4f;

    padding:12px 22px;

    border-radius:10px;

    font-size:16px;

    font-weight:bold;

    cursor:pointer;

    transition:.3s;

    display:inline-block;
}


.remove-btn:hover{

background:#ff4d4f;

color:white;
}



border-radius:8px;

cursor:pointer;

font-size:16px;
}

/* BILL */

.bill{

background:white;

padding:28px;

border-radius:18px;

box-shadow:0 6px 18px rgba(0,0,0,.08);
}

.bill h2{

margin-bottom:25px;
}

.row{

display:flex;

justify-content:space-between;

margin:18px 0;

font-size:18px;
}

.total{

margin-top:25px;

padding-top:18px;

border-top:2px dashed #ddd;

font-size:24px;

font-weight:bold;
}

.checkout{

margin-top:30px;

width:100%;

padding:18px;

background:#ff6b00;

border:none;

border-radius:12px;

font-size:20px;

color:white;

cursor:pointer;

transition:.3s;
}

.checkout:hover{

background:#e95d00;
transform:translateY(-2px);

box-shadow:0 8px 20px rgba(255,107,0,.4);
}

.offer{

margin-top:25px;

background:#fff7e6;

padding:18px;

border-radius:12px;

border-left:6px solid #ff6b00;
}

.offer h3{

color:#ff6b00;

margin-bottom:10px;
}

.empty{

text-align:center;

margin-top:100px;

font-size:34px;

color:#666;
}

.item-total{

    margin-top:18px;

    font-size:22px;

    color:#333;
}

.item-total b{

    color:#000;

    margin-left:8px;
}

.item-total{

    margin-top:22px;

    font-size:22px;

    font-weight:bold;

    color:#222;
}
.main{
    width:90%;
    max-width:1400px;
}

.action-buttons{
    display:flex;
    flex-direction:column;
    gap:15px;
    margin:25px 0;
}

.add-more-btn{
    display:block;
    width:100%;
    text-align:center;
    padding:16px;
    border:2px solid #ff6b00;
    color:#ff6b00;
    background:#fff;
    border-radius:12px;
    font-size:18px;
    font-weight:bold;
    text-decoration:none;
    transition:.3s;
}

.add-more-btn:hover{
    background:#ff6b00;
    color:#fff;
}

.checkout-btn{
    width:100%;
    padding:18px;
    border:none;
    border-radius:12px;
    background:#ff6b00;
    color:#fff;
    font-size:20px;
    font-weight:bold;
    cursor:pointer;
    transition:.3s;
}

.checkout-btn:hover{
    background:#e65c00;
}
</style>

</head>

<body>

<div class="navbar">

<div class="logo">

🍔 FoodieHub

</div>

<div class="links">

<a href="restaurants">Restaurants</a>

<a href="myFavorites">Favorites</a>

<a href="orderHistory">Orders</a>

<a href="profile">Profile</a>

</div>

</div>

<div class="page-title">

🛒 Your Cart

</div>

<div class="main">

<div class="left">

<%
Cart cart = (Cart)session.getAttribute("cart");

double grandTotal = 0;

double deliveryFee = 40;
double platformFee = 5;

if(cart == null || cart.getItems().isEmpty()){
%>

<div class="empty">

🛒 Your Cart is Empty

</div>

<%

}
else{

for(CartItem item : cart.getItems()){

grandTotal += item.getPrice() * item.getQuantity();

%>
<div class="card">

<img
src="<%=item.getImagePath()%>"
class="food-image">

<div class="info">

<div
style="display:flex;
justify-content:space-between;
align-items:center;">

<div class="item-name">

<%=item.getItemName()%>

</div>

<div style="margin-top:8px;
            color:#666;
            font-size:17px;
            font-weight:bold;">

🍴 <%= item.getRestaurantName() %>

</div>
<div
style="background:#1ba672;
color:white;
padding:6px 12px;
border-radius:20px;
font-weight:bold;">

⭐ <%= item.getRating() %>

</div>

</div>

<div class="desc">

<%= item.getDescription() %>
</div>

<div class="price-row">

    <span class="current-price">
        ₹ <%=item.getPrice()%>
    </span>

    <span class="old-price">
        ₹ <%=item.getPrice()+100%>
    </span>

    <span class="save">
        25% OFF
    </span>

</div>
<div class="quantity">

<a
href="updateCart?menuId=<%=item.getMenuId()%>&action=decrease">

<button
class="qty-btn"
type="button">

−

</button>

</a>

<div
style="font-size:22px;
font-weight:bold;">

<%=item.getQuantity()%>

</div>

<a
href="updateCart?menuId=<%=item.getMenuId()%>&action=increase">

<button
class="qty-btn"
type="button">

+

</button>

</a>

</div>

<div class="item-total" style="margin-top:20px;">

Total :

<b>

₹ <%=item.getPrice()*item.getQuantity()%>

</b>

</div>
<form
action="removeItem"
method="get">

<input
type="hidden"
name="menuId"
value="<%=item.getMenuId()%>">

<button
class="remove-btn">
🗑 Remove Item
</button>

</form>

</div>

</div>
<%
}
%>
<div class="action-buttons">

    <a href="restaurants" class="add-more-btn">
        🍽 Add More Items
    </a>

</div>

    

</div>
<div class="right">

<div class="bill">

<h2>

🧾 Bill Details

</h2>

<div class="row">

<span>Items Total</span>

<span>

₹ <%=grandTotal%>

</span>

</div>

<div class="row">

<span>Delivery Fee</span>

<span>

₹ 40

</span>

</div>

<div class="row">

<span>Platform Fee</span>

<span>

₹ 5

</span>

</div>

<%

double gst = grandTotal * 0.05;

double finalTotal =
        grandTotal + deliveryFee + platformFee + gst;

%>

<div class="row">

<span>GST (5%)</span>

<span>

₹ <%=String.format("%.2f", gst)%>

</span>

</div>

<div class="row total">

<span>Grand Total</span>



<span>
₹ <%=String.format("%.2f", finalTotal)%>
</span>
</div>

<hr>

<div class="offer">

<h3>
🎁 Coupon Available
</h3>



<p>



Use code



<b>



FOOD50



</b>



to save ₹50 on orders above ₹499



</p>



</div>



<form action="checkout.jsp">



<button

class="checkout">



Proceed To Checkout →



</button>



</form>
</div>

</div>

</div>

<%
}
%>

</body>
</html>