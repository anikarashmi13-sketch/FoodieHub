<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<html>
<head>
<title>Register</title>

<style>
body{
    font-family:Arial;
    background:#f5f5f5;
}

.container{
    width:400px;
    margin:80px auto;
    background:white;
    padding:20px;
    border-radius:10px;
    box-shadow:0 2px 10px lightgray;
}

input{
    width:100%;
    padding:10px;
    margin:10px 0;
}

button{
    width:100%;
    padding:10px;
    background:orange;
    color:white;
    border:none;
    border-radius:5px;
}
</style>
</head>

<body>

<div class="container">

<h2>Register</h2>

<form action="register" method="post">

<input type="text"
       name="name"
       placeholder="Enter Name">

<input type="email"
       name="email"
       placeholder="Enter Email">

<input type="password"
       name="password"
       placeholder="Enter Password">

<input type="text"
       name="address"
       placeholder="Enter Address">

<button type="submit">
Register
</button>

</form>

</div>

</body>
</html>