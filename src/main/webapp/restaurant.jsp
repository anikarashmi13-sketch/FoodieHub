<%@ page language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="com.tap.model.Restaurant" %>
<%@ page import="com.tap.model.User" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.tap.DAOImpl.FavoriteDAOImpl" %>
<html>
<head>
<title>Restaurant List</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{
    font-family:Arial,sans-serif;
    background:#f5f5f5;
}

/* Navbar */

.navbar{
    background:#ff6b00;
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:15px 40px;
}
/* Search Bar */

.search-section{

    width:100%;

    display:flex;

    justify-content:center;

    margin:30px 0;
}

.search-section input{

    width:450px;

    padding:14px 20px;

    border-radius:30px;

    border:1px solid #ddd;

    font-size:16px;

    outline:none;
}

.search-section button{

    width:140px;

    margin-left:15px;

    border-radius:30px;
}

/* Restaurant Card */

.card{

    position:relative;

}

.rating{

    position:absolute;

    top:20px;

    right:20px;

    background:#1ba672;

    color:white;

    padding:6px 12px;

    border-radius:20px;

    font-size:14px;

    font-weight:bold;
}

.favorite{

    position:absolute;

    top:20px;

    left:20px;

    background:white;

    width:32px;

    height:32px;

    border-radius:50%;

    display:flex;

    justify-content:center;

    align-items:center;

    font-size:22px;

    box-shadow:0 3px 10px rgba(0,0,0,.2);

    cursor:pointer;
    transition:.3s;
}
.favorite button{

    background:none !important;

    border:none;

    padding:0;

    box-shadow:none;

    cursor:pointer;

    font-size:28px;
}

.favorite:hover{

    color:red;
    
    transform:scale(1.15);
}

.eta{

    display:inline-block;

    background:#f3f3f3;

    padding:6px 12px;

    border-radius:20px;

    margin-top:10px;

    font-weight:bold;
}

.logo{
    color:white;
    font-size:28px;
    font-weight:bold;
}

.nav-links{
    display:flex;
    align-items:center;
    gap:25px;
}

.nav-links a{
    color:white;
    text-decoration:none;
    font-size:18px;
    font-weight:bold;
    transition:.3s;
}

.nav-links a:hover{
    color:#ffe5d0;
}

.welcome{
    color:white;
    font-weight:bold;
    font-size:17px;
}

/* Heading */

h1{
    text-align:center;
    margin:30px;
    color:#333;
}

/* Restaurant Cards */

.container{
    display:flex;
    flex-wrap:wrap;
    justify-content:center;
    gap:30px;
    padding-bottom:40px;
}

.card{
    width:320px;
    background:white;
    border-radius:15px;
    padding:20px;
    box-shadow:0 4px 12px rgba(0,0,0,.15);
    transition:.3s;
}

.card:hover{
    transform:translateY(-8px);
    box-shadow:0 8px 20px rgba(0,0,0,.25);
}

.card img{
    width:100%;
    height:180px;
    object-fit:cover;
    border-radius:10px;
}

.card h2{
    color:#ff6b00;
    margin:15px 0;
}

.card p{
    margin:10px 0;
    font-size:16px;
}

button{
    width:100%;
    padding:12px;
    border:none;
    border-radius:8px;
    background:#ff6b00;
    color:white;
    font-size:16px;
    cursor:pointer;
    margin-top:12px;
}

button:hover{
    background:#e65c00;
}

/* Search Box */
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

    width:120px;

    height:48px;

    border:none;

    border-radius:30px;

    background:#ff6b00;

    color:white;

    font-size:16px;

    font-weight:bold;

    cursor:pointer;

    transition:.3s;

}

.search-box button:hover{

    background:#e65c00;

    transform:scale(1.05);

}


</style>

</head>

<body>

<%
User user = (User) session.getAttribute("user");

FavoriteDAOImpl favoriteDAO = new FavoriteDAOImpl();
%>

<!-- Navbar -->

<div class="navbar">

    <div class="logo">
       &#127828;FoodieHub
    </div>

    <div class="nav-links">

        <a href="<%=request.getContextPath()%>/home">Home</a>
        <a href="restaurants">Restaurants</a>

        <a href="cart.jsp">Cart</a>

        <% if(user==null){ %>

            <a href="login.jsp">Login</a>

            <a href="register.jsp">Sign Up</a>

        <% } else { %>
<a href="profile">My Profile</a>

<a href="myFavorites">My Favorites</a>

<a href="orderHistory">My Orders</a>

<a href="logout">Logout</a>
        <% } %>

    </div>

</div>



<%

if(user!=null){

%>

<h2 style="text-align:center;margin-top:25px;">

Welcome,
<b><%=user.getName()%></b> 👋

</h2>

<%

}

%>

<h1>Restaurant List</h1>

<div class="search-box">

<form action="searchRestaurant" method="get">

<input
type="text"
name="keyword"
placeholder="Search Restaurant or Cuisine..."
required>

<button type="submit">

Search

</button>

</form>

</div>
<%
List<Restaurant> list=(List<Restaurant>)request.getAttribute("restaurants");

if(list==null){
%>

<h2 style="text-align:center;color:red;">
Restaurant List is NULL
</h2>

<%
}
else if(list.isEmpty()){
%>

<h2 style="text-align:center;color:red;">
No Restaurants Found
</h2>

<%
}
else{
%>

<div class="container">

<%
for(Restaurant r:list){
%>

<div class="card">

<div class="favorite">

<%
if(user != null){

    boolean favorite =
            favoriteDAO.isFavorite(
                    user.getUserId(),
                    r.getRestaurantId());
%>

<form action="favorite" method="post">

    <input
        type="hidden"
        name="restaurantId"
        value="<%=r.getRestaurantId()%>">

    <button
        type="submit"
        style="background:none;
               border:none;
               padding:0;
               font-size:28px;
               cursor:pointer;">

        <%= favorite ? "❤️" : "🤍" %>

    </button>

</form>

<%
}
else{
%>

🤍

<%
}
%>

</div>

<div class="rating">

⭐ <%=r.getRating()%>

</div>

<img src="<%=r.getImagePath()%>">

<h2>

<%=r.getName()%>

</h2>

<p>

🍽 <%=r.getCuisineType()%>

</p>

<p>

📍 <%=r.getAddress()%>

</p>

<div class="eta">

🛵 <%=r.getEta()%>

</div>

<form action="menu" method="get">

<input
type="hidden"
name="restaurantId"
value="<%=r.getRestaurantId()%>">

<button type="submit">

View Menu

</button>

</form>

</div>

<%
}
%>

</div>

<%
}
%>

</body>
</html>