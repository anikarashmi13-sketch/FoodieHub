<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
if (request.getAttribute("restaurantCount") == null && request.getAttribute("menuCount") == null) {
    request.getRequestDispatcher("/home").forward(request, response);
    return;
}

Integer restaurantCount = (Integer) request.getAttribute("restaurantCount");
Integer menuCount = (Integer) request.getAttribute("menuCount");
Integer customerCount = (Integer) request.getAttribute("customerCount");
Integer orderCount = (Integer) request.getAttribute("orderCount");

if (restaurantCount == null) restaurantCount = 0;
if (menuCount == null) menuCount = 0;
if (customerCount == null) customerCount = 0;
if (orderCount == null) orderCount = 0;
%>

<!DOCTYPE html>
<html lang="en">

<head>


<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<title>FoodieHub</title>

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

/* Navbar */

.navbar{

background:#ff6b00;

padding:18px 60px;

display:flex;

justify-content:space-between;

align-items:center;

}

.logo{

color:white;

font-size:32px;

font-weight:bold;

}

.navbar a{

color:white;

text-decoration:none;

margin-left:25px;

font-size:18px;

font-weight:bold;

transition:.3s;

}

.navbar a:hover{

color:#ffe0c7;

}

/* Hero */

.hero{

position:relative;

overflow:hidden;

padding:120px 20px;

text-align:center;

background:linear-gradient(rgba(0,0,0,.45),rgba(0,0,0,.45)),
url("images/banner.jpg");

background-size:cover;

background-position:center;

color:white;

}

.hero h1{

font-size:60px;

margin-bottom:20px;

}

.hero p{

font-size:24px;

margin-bottom:35px;

}

.btn{

display:inline-block;

padding:15px 35px;

background:#ff6b00;

color:white;

text-decoration:none;

font-size:20px;

border-radius:8px;

transition:.3s;

animation:pulseBtn 2s infinite;

}

.btn:hover{

background:#e65c00;

transform:scale(1.08);

}

@keyframes pulseBtn{

0%{

box-shadow:0 0 0 0 rgba(255,107,0,.5);

}

70%{

box-shadow:0 0 0 15px rgba(255,107,0,0);

}

100%{

box-shadow:0 0 0 0 rgba(255,107,0,0);

}

}
/* Search */

.search-box{

text-align:center;

margin:50px;

}

.search-box input{

width:450px;

padding:15px;

font-size:17px;

border-radius:30px;

border:1px solid lightgray;

}

.search-box button{

padding:15px 30px;

margin-left:10px;

border:none;

border-radius:30px;

background:#ff6b00;

color:white;

cursor:pointer;

font-size:17px;

}

.search-box button:hover{

background:#e65c00;

}

/* Section */

.section-title{

text-align:center;

font-size:38px;

margin-top:60px;

margin-bottom:35px;

color:#333;

}

/* Categories */

.categories{

display:flex;

justify-content:center;

gap:30px;

flex-wrap:wrap;

margin-bottom:60px;

}

.category{

width:140px;

height:140px;

background:white;

border-radius:50%;

display:flex;

flex-direction:column;

justify-content:center;

align-items:center;

font-size:28px;

box-shadow:0 4px 12px rgba(0,0,0,.15);

transition:.3s;

cursor:pointer;

}

.category:hover{

transform:translateY(-10px);

}

/* Offers */

.offers{

display:flex;

justify-content:center;

gap:30px;

flex-wrap:wrap;

margin-bottom:60px;

}

.offer{

width:280px;

height:170px;

background:#ff6b00;

border-radius:15px;

color:white;

display:flex;

justify-content:center;

align-items:center;

flex-direction:column;

font-size:28px;

font-weight:bold;

box-shadow:0 5px 15px rgba(0,0,0,.2);

transition:.3s;

}

.offer:hover{

transform:scale(1.05);

}

/* Why Choose */

.features{

display:flex;

justify-content:center;

gap:40px;

flex-wrap:wrap;

margin:60px;

}

.feature{

width:230px;

background:white;

padding:25px;

border-radius:12px;

text-align:center;

box-shadow:0 4px 12px rgba(0,0,0,.15);

}

.feature h3{

margin:15px 0;

color:#ff6b00;

}

/* Footer */

footer{

margin-top:70px;

background:#222;

color:white;

padding:45px;

text-align:center;

}

footer h2{

margin-bottom:10px;

}
/* Popular Restaurants */

.popular-restaurants{

display:flex;

justify-content:center;

gap:30px;

flex-wrap:wrap;

margin-bottom:60px;

}

.restaurant-card{

width:260px;

background:white;

border-radius:15px;

overflow:hidden;

box-shadow:0 6px 18px rgba(0,0,0,.12);

transition:.3s;

text-align:center;

}

.restaurant-card:hover{

transform:translateY(-10px);

box-shadow:0 12px 25px rgba(0,0,0,.2);

}

.restaurant-card img{

width:100%;

height:180px;

object-fit:cover;

}

.restaurant-card h3{

margin:15px 0 8px;

color:#ff6b00;

font-size:24px;

}

.restaurant-card p{

color:#555;

margin-bottom:20px;

}

.view-btn{

display:inline-block;

margin-bottom:20px;

padding:10px 22px;

background:#ff6b00;

color:white;

text-decoration:none;

border-radius:25px;

font-weight:bold;

transition:.3s;

}

.view-btn:hover{

background:#e65c00;

}

/* Statistics */

.stats{

display:flex;

justify-content:center;

gap:30px;

flex-wrap:wrap;

margin:50px auto;

}

.stat-card{

width:220px;

background:white;

padding:30px;

text-align:center;

border-radius:15px;

box-shadow:0 5px 15px rgba(0,0,0,.12);

transition:.3s;

}

.stat-card:hover{

transform:translateY(-10px);

box-shadow:0 10px 25px rgba(0,0,0,.2);

}

.stat-card h2{

font-size:48px;

color:#ff6b00;

margin-bottom:10px;

}

.stat-card p{

font-size:18px;

font-weight:bold;

color:#444;

}

/* Floating Hero Icons */

.floating-icons{

position:absolute;

top:0;

left:0;

width:100%;

height:100%;

pointer-events:none;

}

.floating-icons i{

position:absolute;

font-size:50px;

color:#ffd54f;

opacity:.25;

animation:floatFood 5s ease-in-out infinite;

filter:drop-shadow(0 0 10px rgba(255,255,255,.4));

}

.pizza{

top:18%;

left:10%;

animation-delay:0s;

}

.burger{

top:28%;

right:12%;

animation-delay:1s;

}

.drink{

bottom:18%;

left:18%;

animation-delay:2s;

}

.fries{

bottom:25%;

right:18%;

animation-delay:1.5s;

}

.cake{

top:55%;

left:6%;

animation-delay:3s;

}

.taco{

top:60%;

right:6%;

animation-delay:2.5s;

}

@keyframes floatFood{

0%{

transform:translateY(0px) rotate(0deg) scale(1);

}

25%{

transform:translateY(-12px) rotate(6deg) scale(1.05);

}

50%{

transform:translateY(-22px) rotate(-6deg) scale(1.1);

}

75%{

transform:translateY(-12px) rotate(6deg) scale(1.05);

}

100%{

transform:translateY(0px) rotate(0deg) scale(1);

}

}

/* Delivery Bike Animation */

.delivery-bike{

position:absolute;

bottom:40px;

left:-120px;

font-size:55px;

color:#ffb300;

animation:rideBike 10s linear infinite;

z-index:5;

}

@keyframes rideBike{

0%{

transform:translateX(-150px);

}

100%{

transform:translateX(calc(100vw + 300px));

}

}

@keyframes rideBike{

0%{

left:-120px;

transform:translateY(0);

}

20%{

transform:translateY(-5px);

}

40%{

transform:translateY(5px);

}

60%{

transform:translateY(-5px);

}

80%{

transform:translateY(5px);

}

100%{

left:110%;

transform:translateY(0);

}

}

.speed-lines{

position:absolute;

bottom:55px;

left:-120px;

width:90px;

height:4px;

background:white;

opacity:.4;

box-shadow:

0 10px white,

0 -10px white;

animation:speed 12s linear infinite;

}

@keyframes speed{

0%{

left:-120px;

}

100%{

left:110%;

}

}

.pizza-box{

font-size:22px;

margin-right:-10px;

position:relative;

top:-15px;

left:8px;

}
</style>

</head>

<body>



<!-- Navbar -->

<div class="navbar">

<div class="logo">

FoodieHub

</div>

<div>

<a href="home">Home</a>

<a href="restaurants">Restaurants</a>

<a href="login.jsp">Login</a>

<a href="register.jsp">Sign Up</a>

</div>

</div>

<!-- Hero -->

<div class="hero">

<h1>

Delicious Food Delivered Fast

</h1>

<p>

Order from your favourite restaurants anytime, anywhere.

</p>

<a href="restaurants" class="btn">

Explore Restaurants

</a>
<div class="floating-icons">

<i class="fas fa-pizza-slice"></i>

<i class="fas fa-utensils"></i>

<i class="fas fa-drumstick-bite"></i>

<i class="fas fa-ice-cream"></i>

<i class="fas fa-cookie"></i>

<i class="fas fa-mug-hot"></i>
</div>
<div class="delivery-bike">

<span class="pizza-box">📦</span>

<i class="fas fa-motorcycle"></i>

</div>
<div class="speed-lines"></div>
</div>

<!-- Search -->

<div class="search-box">

<form action="searchRestaurant" method="get">

<input
type="text"
name="keyword"
placeholder="Search Restaurants..."
required>

<button type="submit">
Search
</button>

</form>

</div>

<!-- Statistics -->

<h2 class="section-title">

FoodieHub At A Glance

</h2>

<div class="stats">

<div class="stat-card">

<h2 id="restaurantCount">0</h2>

<p><i class="fas fa-store"></i> Restaurants</p>
</div>

<div class="stat-card">

<h2 id="menuCount">0</h2>

<p><i class="fas fa-utensils"></i> Menu Items</p>

</div>

<div class="stat-card">

<h2 id="customerCount">0</h2>

<p><i class="fas fa-users"></i> Happy Customers</p>

</div>

<div class="stat-card">

<h2 id="orderCount">0</h2>

<p><i class="fas fa-truck"></i> Orders Delivered</p>

</div>

</div>

<!-- Categories -->

<h2 class="section-title">

Popular Categories

</h2>

<div class="categories">

<div class="category">

<br><i class="fas fa-pizza-slice"></i><br>Pizza

</div>

<div class="category">
<br><i class="fas fa-hamburger"></i><br>Burger

</div>

<div class="category">
<br><i class="fas fa-bowl-rice"></i><br>Biryani

</div>

<div class="category">
<br><i class="fas fa-glass-water"></i><br>

Drinks
</div>

<div class="category">

<br><i class="fas fa-ice-cream"></i><br>

Desserts

</div>

</div>

<!-- Offers -->

<h2 class="section-title">

Today's Offers

</h2>

<div class="offers">

<div class="offer">

<i class="fas fa-tags"></i>
50% OFF

<br>

First Order

</div>

<div class="offer">

<i class="fas fa-pizza-slice"></i>
Buy 1 Get 1

</div>

<div class="offer">
<i class="fas fa-truck-fast"></i>
Free Delivery

</div>

</div>
<h2 class="section-title">

Popular Restaurants

</h2>

<div class="popular-restaurants">

<div class="restaurant-card">

<img src="images/kfc.jpg">

<h3>KFC</h3>

<p><i class="fas fa-drumstick-bite"></i> Fast Food</p>

<a href="restaurants" class="view-btn">
Explore Restaurant

</a>

</div>

<div class="restaurant-card">

<img src="images/pizza.jpg">

<h3>Pizza Hut</h3>
<p><i class="fas fa-pizza-slice"></i> Pizza</p>

<a href="restaurants" class="view-btn">

Explore Restaurant

</a>

</div>

<div class="restaurant-card">

<img src="images/dominos.jpg">

<h3>Domino's</h3>

<p><i class="fas fa-pizza-slice"></i> Pizza</p>

<a href="restaurants" class="view-btn">
Explore Restaurant

</a>

</div>

<div class="restaurant-card">

<img src="images/burger_king.jpg">

<h3>Burger King</h3>

<p><i class="fas fa-hamburger"></i>

Burger</p>

<a href="restaurants" class="view-btn">

Explore Restaurant

</a>

</div>

</div>

<div style="text-align:center;margin-top:25px;">

<a href="restaurants" class="btn">

View All Restaurants
<i class="fas fa-arrow-right"></i></a>

</div>
<!-- Features -->

<h2 class="section-title">

Why Choose FoodieHub?

</h2>

<div class="features">

<div class="feature">

<h3>

Fast Delivery

</h3>

<p>

Hot and fresh food delivered in minutes.

</p>

</div>

<div class="feature">

<h3>

Premium Restaurants

</h3>

<p>

Choose from top-rated restaurants near you.

</p>

</div>

<div class="feature">

<h3>

 Secure Payments

</h3>

<p>

UPI, Cards and Cash on Delivery supported.

</p>

</div>

<div class="feature">

<h3>

 Trusted Service

</h3>

<p>

Thousands of happy customers every day.

</p>

</div>

</div>

<!-- Footer -->

<footer>

<h2>

FoodieHub

</h2>

<p>
Delivering Happiness ❤</p>

<br>

<p>

© 2026 FoodieHub. All Rights Reserved.

</p>

</footer>

<script>

function animateValue(id, end, duration) {

    let obj = document.getElementById(id);

    let start = 0;

    if(end < 0){
        end = 0;
    }

    let range = end - start;

    if(range == 0){
        obj.innerHTML = end + "+";
        return;
    }

    let increment = 1;

    let stepTime = duration / range;

    let timer = setInterval(function(){

        start++;

        obj.innerHTML = start + "+";

        if(start >= end){

            obj.innerHTML = end + "+";

            clearInterval(timer);

        }

    }, stepTime);

}
window.onload=function(){

	animateValue("restaurantCount", <%= restaurantCount %>, 1500);
	animateValue("menuCount", <%= menuCount %>, 1800);
	animateValue("customerCount", <%= customerCount %>, 2000);
	animateValue("orderCount", <%= orderCount %>, 2200);
};

</script>
</body>

</html>