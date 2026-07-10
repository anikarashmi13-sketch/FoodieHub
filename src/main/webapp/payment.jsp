<%@ page language="java" %>

<html>

<head>

<title>Payment</title>

<style>

body{

font-family:Arial;

background:#f5f5f5;

}

.box{

width:450px;

margin:80px auto;

background:white;

padding:30px;

border-radius:15px;

box-shadow:0 4px 15px lightgray;

text-align:center;

}

img{

width:220px;

margin:20px;

}

input{

width:100%;

padding:12px;

margin:10px 0;

font-size:16px;

}

button{

width:100%;

padding:14px;

background:#ff6b00;

color:white;

border:none;

border-radius:8px;

font-size:18px;

cursor:pointer;

}

</style>

</head>

<body>

<%

String payment=(String)session.getAttribute("paymentMethod");

%>

<div class="box">

<h1>

<%=payment%>

Payment

</h1>

<%

if(payment.equals("UPI")){

%>

<img src="images/upi_qr.png">

<p>

Scan QR using any UPI App

</p>

<form action="checkout" method="post">

<button>

Payment Done

</button>

</form>

<%

}

else{

%>

<input
type="text"
placeholder="Card Number">

<input
type="text"
placeholder="Card Holder Name">

<input
type="text"
placeholder="MM/YY">

<input
type="password"
placeholder="CVV">

<form action="checkout" method="post">

<button>

Pay Now

</button>

</form>

<%

}

%>

</div>

</body>

</html>