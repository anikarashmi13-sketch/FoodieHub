<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password | FoodieHub</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * { margin:0; padding:0; box-sizing:border-box; font-family:Arial,sans-serif; }

        body {
            background: #f3f4f6;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            width: 430px;
            background: #fff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0,0,0,.15);
        }

        .logo {
            text-align: center;
            font-size: 32px;
            font-weight: bold;
            color: #ff6b00;
            margin-bottom: 6px;
        }

        .page-title {
            text-align: center;
            font-size: 22px;
            font-weight: 700;
            color: #222;
            margin-bottom: 8px;
        }

        .page-desc {
            text-align: center;
            color: #777;
            font-size: 14px;
            margin-bottom: 28px;
            line-height: 1.5;
        }

        .alert {
            padding: 12px 16px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-size: 14px;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .alert-error   { background:#fde8e8; color:#c53030; border:1px solid #fbd5d5; }
        .alert-success { background:#e6fffa; color:#276749; border:1px solid #b2f5ea; }

        .input-group {
            position: relative;
            margin-bottom: 22px;
        }

        .input-group i.icon {
            position: absolute;
            top: 50%;
            left: 14px;
            transform: translateY(-50%);
            color: #aaa;
        }

        .input-group input {
            width: 100%;
            padding: 14px 14px 14px 42px;
            border: 1px solid #dcdcdc;
            border-radius: 8px;
            font-size: 15px;
            outline: none;
            transition: .3s;
        }

        .input-group input:focus {
            border-color: #ff6b00;
            box-shadow: 0 0 0 3px rgba(255,107,0,.1);
        }

        .submit-btn {
            width: 100%;
            padding: 14px;
            border: none;
            border-radius: 8px;
            background: #ff6b00;
            color: white;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: .3s;
        }

        .submit-btn:hover {
            background: #e65c00;
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(255,107,0,.4);
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #ff6b00;
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
        }

        .back-link:hover { text-decoration: underline; }

        .icon-box {
            width: 70px;
            height: 70px;
            background: #fff3e0;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0 auto 20px;
        }

        .icon-box i {
            font-size: 30px;
            color: #ff6b00;
        }
    </style>
</head>
<body>

<div class="container">

    <div class="logo">&#127860; FoodieHub</div>

    <div class="icon-box">
        <i class="fas fa-key"></i>
    </div>

    <p class="page-title">Forgot Password?</p>
    <p class="page-desc">Enter your registered email address.<br>We'll verify your account and let you set a new password.</p>

    <% String error = request.getParameter("error"); %>
    <% if (error != null && !error.isEmpty()) { %>
        <div class="alert alert-error"><i class="fas fa-exclamation-circle"></i> <%= error %></div>
    <% } %>

    <form action="forgotPassword" method="post">
        <div class="input-group">
            <i class="fas fa-envelope icon"></i>
            <input type="email" name="email" placeholder="Registered Email Address" required autofocus>
        </div>
        <button type="submit" class="submit-btn">Verify &amp; Continue</button>
    </form>

    <a href="login.jsp" class="back-link"><i class="fas fa-arrow-left"></i> Back to Login</a>

</div>

</body>
</html>
