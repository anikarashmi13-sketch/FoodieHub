<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | FoodieHub</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

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
            font-size: 34px;
            font-weight: bold;
            color: #ff6b00;
            margin-bottom: 8px;
        }

        .subtitle {
            text-align: center;
            color: #777;
            margin-bottom: 30px;
            font-size: 15px;
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

        .alert-error {
            background: #fde8e8;
            color: #c53030;
            border: 1px solid #fbd5d5;
        }

        .alert-success {
            background: #e6fffa;
            color: #276749;
            border: 1px solid #b2f5ea;
        }

        .input-group {
            position: relative;
            margin-bottom: 18px;
        }

        .input-group i.icon {
            position: absolute;
            top: 50%;
            left: 14px;
            transform: translateY(-50%);
            color: #aaa;
            font-size: 15px;
        }

        .input-group input {
            width: 100%;
            padding: 14px 42px;
            border: 1px solid #dcdcdc;
            border-radius: 8px;
            font-size: 16px;
            outline: none;
            transition: .3s;
        }

        .input-group input:focus {
            border-color: #ff6b00;
            box-shadow: 0 0 0 3px rgba(255,107,0,.1);
        }

        .input-group .toggle-password {
            position: absolute;
            top: 50%;
            right: 14px;
            transform: translateY(-50%);
            color: #999;
            cursor: pointer;
            font-size: 15px;
            transition: color .2s;
        }

        .input-group .toggle-password:hover {
            color: #ff6b00;
        }

        .options {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 24px;
            font-size: 14px;
            color: #555;
        }

        .options label {
            display: flex;
            align-items: center;
            gap: 6px;
            cursor: pointer;
        }

        .options input[type="checkbox"] {
            width: 15px;
            height: 15px;
            accent-color: #ff6b00;
            cursor: pointer;
        }

        .options a {
            color: #ff6b00;
            text-decoration: none;
            font-weight: 600;
        }

        .options a:hover {
            text-decoration: underline;
        }

        .login-btn {
            width: 100%;
            padding: 14px;
            border: none;
            border-radius: 8px;
            background: #ff6b00;
            color: white;
            font-size: 17px;
            font-weight: 600;
            cursor: pointer;
            transition: .3s;
        }

        .login-btn:hover {
            background: #e65c00;
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(255,107,0,.4);
        }

        .register-text {
            text-align: center;
            margin: 25px 0 5px;
            color: #666;
            font-size: 15px;
        }

        .register-btn {
            display: block;
            text-align: center;
            width: 100%;
            padding: 13px;
            border: 2px solid #ff6b00;
            border-radius: 8px;
            text-decoration: none;
            color: #ff6b00;
            font-weight: bold;
            font-size: 15px;
            transition: .3s;
            margin-top: 10px;
        }

        .register-btn:hover {
            background: #ff6b00;
            color: white;
        }
    </style>
</head>
<body>

<div class="container">

    <div class="logo">&#127860; FoodieHub</div>
    <p class="subtitle">Sign in to continue</p>

    <%
        String error   = request.getParameter("error");
        String success = request.getParameter("success");
    %>
    <% if (error != null && !error.isEmpty()) { %>
        <div class="alert alert-error">
            <i class="fas fa-exclamation-circle"></i> <%= error %>
        </div>
    <% } %>
    <% if (success != null && !success.isEmpty()) { %>
        <div class="alert alert-success">
            <i class="fas fa-check-circle"></i> <%= success %>
        </div>
    <% } %>

    <form action="login" method="post">

        <div class="input-group">
            <i class="fas fa-envelope icon"></i>
            <input type="email" name="email" placeholder="Email Address" required>
        </div>

        <div class="input-group">
            <i class="fas fa-lock icon"></i>
            <input type="password" name="password" id="loginPassword" placeholder="Password" required>
            <i class="fas fa-eye toggle-password" id="toggleIcon" onclick="togglePassword()"></i>
        </div>

        <div class="options">
            <label>
                <input type="checkbox" name="remember"> Remember Me
            </label>
            <a href="forgot-password.jsp">Forgot Password?</a>
        </div>

        <button type="submit" class="login-btn">Login</button>

    </form>

    <p class="register-text">Don't have an account?</p>
    <a href="register.jsp" class="register-btn">Create Account</a>

</div>

<script>
    function togglePassword() {
        const input = document.getElementById('loginPassword');
        const icon  = document.getElementById('toggleIcon');
        if (input.type === 'password') {
            input.type = 'text';
            icon.classList.replace('fa-eye', 'fa-eye-slash');
        } else {
            input.type = 'password';
            icon.classList.replace('fa-eye-slash', 'fa-eye');
        }
    }
</script>

</body>
</html>