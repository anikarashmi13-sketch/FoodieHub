<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login | FoodieHub</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial,sans-serif;
}

body{
    background:#f8f8f8;
    display:flex;
    justify-content:center;
    align-items:center;
    height:100vh;
}

.container{
    width:430px;
    background:#fff;
    padding:40px;
    border-radius:15px;
    box-shadow:0 8px 25px rgba(0,0,0,.15);
    border-top: 5px solid #ff6b00;
}

.logo{
    text-align:center;
    font-size:34px;
    font-weight:bold;
    color:#ff6b00;
    margin-bottom:8px;
}

.subtitle{
    text-align:center;
    color:#777;
    margin-bottom:30px;
}

.error-msg {
    color: red;
    text-align: center;
    margin-bottom: 15px;
}

.success-msg {
    color: green;
    text-align: center;
    margin-bottom: 15px;
}

input{
    width:100%;
    padding:14px;
    margin-bottom:18px;
    border:1px solid #dcdcdc;
    border-radius:8px;
    font-size:16px;
    outline:none;
    transition:.3s;
}

input:focus{
    border-color:#ff6b00;
}

.login-btn{
    width:100%;
    padding:14px;
    border:none;
    border-radius:8px;
    background:#ff6b00;
    color:white;
    font-size:17px;
    cursor:pointer;
    transition:.3s;
    font-weight: bold;
}

.login-btn:hover{
    background:#e65c00;
}

.back-link{
    display:block;
    text-align:center;
    margin-top:20px;
    color:#666;
    text-decoration:none;
    font-size:15px;
}

.back-link:hover{
    color:#ff6b00;
    text-decoration:underline;
}

</style>

</head>

<body>

<div class="container">

<div class="logo">
FoodieHub Admin
</div>

<p class="subtitle">
Secure Portal Access
</p>

<%
    String error = request.getParameter("error");
    String message = request.getParameter("message");
    if(error != null) {
%>
    <div class="error-msg"><%= error %></div>
<%
    }
    if(message != null) {
%>
    <div class="success-msg"><%= message %></div>
<%
    }
%>

<form action="adminLogin" method="post">

<input
type="email"
name="email"
placeholder="Admin Email"
required>

<input
type="password"
name="password"
placeholder="Password"
required>

<button class="login-btn" type="submit">
Login
</button>

</form>

<a href="index.jsp" class="back-link">
&larr; Back to FoodieHub
</a>

</div>

</body>
</html>
