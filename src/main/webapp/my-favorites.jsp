<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%@ page import="com.tap.model.Restaurant"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Favorites</title>

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
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:15px 40px;
}

.logo{
    color:white;
    font-size:28px;
    font-weight:bold;
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

/* Heading */

h1{
    text-align:center;
    margin:30px;
    color:#333;
}

/* Cards */

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

.eta{

    display:inline-block;

    margin-top:10px;

    background:#f3f3f3;

    padding:6px 12px;

    border-radius:20px;

    font-weight:bold;

}

button{

    width:100%;

    margin-top:15px;

    padding:12px;

    border:none;

    border-radius:8px;

    background:#ff6b00;

    color:white;

    font-size:16px;

    cursor:pointer;

}

button:hover{

    background:#e65c00;

}

.empty{

    text-align:center;

    font-size:28px;

    color:red;

    margin-top:80px;

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

<a href="profile">My Profile</a>

<a href="orderHistory">My Orders</a>

<a href="logout">Logout</a>

</div>

</div>

<h1>❤️ My Favorite Restaurants</h1>

<%

List<Restaurant> favoriteList =
(List<Restaurant>)request.getAttribute("favoriteList");

if(favoriteList==null || favoriteList.isEmpty()){

%>

<div class="empty">

No Favorite Restaurants Yet ❤️

</div>

<%

}
else{

%>

<div class="container">

<%

for(Restaurant r:favoriteList){

%>

<div class="card">

<img src="<%=r.getImagePath()%>">

<h2><%=r.getName()%></h2>

<p>

<b>Cuisine :</b>

<%=r.getCuisineType()%>

</p>

<p>

<b>Address :</b>

<%=r.getAddress()%>

</p>

<p>

<b>Rating :</b>

⭐ <%=r.getRating()%>

</p>

<div class="eta">

🛵 <%=r.getEta()%>

</div>

<form action="menu" method="get">

<input
type="hidden"
name="restaurantId"
value="<%=r.getRestaurantId()%>">

<button>

View Menu

</button>

</form>

<form action="favorite" method="post">

<input
type="hidden"
name="restaurantId"
value="<%=r.getRestaurantId()%>">

<input
type="hidden"
name="from"
value="favorites">

<button
style="margin-top:10px;
background:#e53935;">

Remove ❤️

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