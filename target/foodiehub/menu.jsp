<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>
<%@ page import="com.tap.model.Menu" %>
<%@ page import="com.tap.utility.FoodTypeDetector" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Restaurant Menu</title>

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

color:white;

}

.logo{

font-size:30px;

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

h1{
    text-align:center;
    margin:40px 0;
    font-size:45px;
    color:#222;
}

.container{
    width:95%;
    max-width:1200px;
    margin:auto;
}

.card{

    display:flex;
    align-items:center;
    gap:25px;

    background:white;

    padding:20px;
    margin-bottom:25px;

    border-radius:15px;

    box-shadow:0 5px 15px rgba(0,0,0,.12);

    transition:.3s;
}

.card:hover{

    transform:translateY(-5px);
     transition:.3s;

    box-shadow:0 10px 25px rgba(0,0,0,.18);
}

.food-img{

    width:220px;
    height:170px;

    object-fit:cover;

    border-radius:12px;
}

.details{

    flex:1;
}

.details h2{

    color:#ff6b00;

    font-size:32px;

    margin-bottom:15px;
}

.price{

    font-size:24px;

    font-weight:bold;

    color:#222;

    margin-bottom:10px;
}

.desc{

    color:#666;

    font-size:18px;

    margin-bottom:25px;

    line-height:1.5;
}

button{

background:#ff6b00;

color:white;

border:none;

padding:14px 28px;

border-radius:30px;

cursor:pointer;

font-size:16px;

transition:.3s;

}

button:hover{

background:#e65c00;

}
.empty{

    text-align:center;

    font-size:28px;

    color:red;

    margin-top:100px;
}

/* Search */

.search-box{

text-align:center;

margin-bottom:35px;

}

.search-box input{

width:420px;

padding:14px;

border-radius:30px;

border:1px solid #ddd;

font-size:16px;

}

.search-box button{

margin-left:10px;

padding:14px 28px;

border-radius:30px;

background:#ff6b00;

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

.veg{

position:absolute;

top:20px;

left:20px;

background:white;

padding:6px 12px;

border-radius:20px;

font-size:14px;

font-weight:bold;

box-shadow:0 3px 10px rgba(0,0,0,.15);

}

.nonveg{

position:absolute;

top:20px;

left:20px;

background:white;

padding:6px 12px;

border-radius:20px;

font-size:14px;

font-weight:bold;

color:#d32f2f;

box-shadow:0 3px 10px rgba(0,0,0,.15);

}

.card{

position:relative;

}

.veg-dot{

display:inline-block;

width:12px;

height:12px;

background:#1ba672;

border-radius:50%;

margin-right:6px;
}

.nonveg-dot{

display:inline-block;

width:12px;

height:12px;

background:#d32f2f;

border-radius:50%;

margin-right:6px;
}

.add-btn:hover{
    transform:scale(1.05);
}
</style>

</head>
<body>
<%
List<Menu> menuList =
(List<Menu>)request.getAttribute("menuList");
%>
<div class="navbar">

<div class="logo">

🍔 FoodieHub

</div>

<div class="nav-links">

<a href="<%=request.getContextPath()%>/home">Home</a>

<a href="restaurants">Restaurants</a>

<a href="cart.jsp">Cart</a>

<a href="orderHistory">My Orders</a>

</div>

</div>
<h1>

Restaurant Menu

</h1>

<div class="search-box">

<form action="searchMenu" method="get">

<input
type="hidden"
name="restaurantId"
value="<%= (menuList!=null && !menuList.isEmpty()) ? menuList.get(0).getRestaurantId() : 0 %>">

<input
type="text"
name="keyword"
placeholder="Search food items...">

<button type="submit">

Search

</button>

</form>

</div>

<div class="container">

<%


if(menuList == null || menuList.isEmpty()){

%>

<div class="empty">
No Menu Available
</div>

<%

}
else{

for(Menu m : menuList){

%>

<div class="card">

<div class="rating">
⭐ <%= m.getRating() %>
</div>

<%
String foodType = FoodTypeDetector.detectFoodType(
        m.getItemName(),
        m.getDescription());
%>

<% if(foodType.equals("Veg")){ %>

<div class="veg">
    <span class="veg-dot"></span> Veg
</div>

<% } else { %>

<div class="nonveg">
    <span class="nonveg-dot"></span> Non-Veg
</div>

<% } %>

<img
src="<%=m.getImagePath()%>"
class="food-img"
onerror="this.src='https://via.placeholder.com/220x170?text=Food+Image'">

    <div class="details">

        <h2>
            <%=m.getItemName()%>
        </h2>

        <div class="price">
            ₹ <%=m.getPrice()%>
        </div>

        <div class="desc">
            <%=m.getDescription()%>
        </div>

        <form action="cart" method="post">

            <input
                type="hidden"
                name="menuId"
                value="<%=m.getMenuId()%>">

            <button type="submit">
                Add To Cart
            </button>

        </form>

    </div>

</div>

<%

}

}

%>

</div>

</body>
</html>