<%@ page language="java" %>

<!DOCTYPE html>

<html>

<head>

<title>FoodieHub</title>

<style>

*{

margin:0;

padding:0;

box-sizing:border-box;

font-family:Arial,sans-serif;

}

body{

background:#fafafa;

}

/* Navbar */

.navbar{

display:flex;

justify-content:space-between;

align-items:center;

padding:20px 60px;

background:white;

box-shadow:0 2px 10px rgba(0,0,0,.1);

}

.logo{

font-size:34px;

font-weight:bold;

color:#ff6b00;

}

.menu a{

margin-left:25px;

text-decoration:none;

font-size:18px;

color:#333;

font-weight:bold;

}

.menu a:hover{

color:#ff6b00;

}

/* Hero */

.hero{

height:500px;

background:url("images/banner.jpg") center/cover;

display:flex;

justify-content:center;

align-items:center;

}

.hero-box{

background:rgba(255,255,255,.9);

padding:40px;

border-radius:20px;

text-align:center;

}

.hero h1{

font-size:55px;

margin-bottom:15px;

}

.hero p{

font-size:22px;

margin-bottom:30px;

}

.hero button{

padding:15px 35px;

background:#ff6b00;

color:white;

border:none;

font-size:20px;

border-radius:10px;

cursor:pointer;

}

/* Features */

.features{

display:flex;

justify-content:space-around;

padding:60px;

}

.feature{

background:white;

width:250px;

padding:30px;

border-radius:15px;

text-align:center;

box-shadow:0 3px 12px lightgray;

}

.feature h2{

color:#ff6b00;

margin-bottom:15px;

}

footer{

background:#222;

color:white;

text-align:center;

padding:25px;

margin-top:40px;

}

</style>

</head>

<body>

<div class="navbar">

<div class="logo">

FoodieHub

</div>

<div class="menu">

<a href="index.jsp">Home</a>

<a href="restaurants">Restaurants</a>

<a href="cart.jsp">Cart</a>

<a href="login.jsp">Login</a>

<a href="register.jsp">Sign Up</a>

</div>

</div>

<div class="hero">

<div class="hero-box">

<h1>

Delicious Food Delivered

</h1>

<p>

Order from your favourite restaurants

</p>

<a href="restaurants">

<button>

Explore Restaurants

</button>

</a>

</div>

</div>

<div class="features">

<div class="feature">

<h2>Fast Delivery</h2>

<p>

Delivered in 30 Minutes

</p>

</div>

<div class="feature">

<h2>Best Restaurants</h2>

<p>

100+ Popular Restaurants

</p>

</div>

<div class="feature">

<h2>Secure Payments</h2>

<p>

UPI, Cards & Cash

</p>

</div>

</div>

<footer>

© 2026 FoodieHub | All Rights Reserved

</footer>

</body>

</html>