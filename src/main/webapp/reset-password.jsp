<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
    // Guard: must have gone through Forgot Password flow first
    String resetEmail = (String) session.getAttribute("resetEmail");
    if (resetEmail == null) {
        response.sendRedirect("forgot-password.jsp?error=Please start the reset process from here.");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password | FoodieHub</title>
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
            margin-bottom: 6px;
        }

        .page-desc {
            text-align: center;
            color: #777;
            font-size: 14px;
            margin-bottom: 28px;
        }

        .email-badge {
            display: inline-block;
            background: #fff3e0;
            color: #ff6b00;
            padding: 4px 12px;
            border-radius: 20px;
            font-weight: 600;
            font-size: 14px;
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

        .alert-error { background:#fde8e8; color:#c53030; border:1px solid #fbd5d5; }

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
        }

        .input-group input {
            width: 100%;
            padding: 14px 42px;
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

        .input-group .toggle-password {
            position: absolute;
            top: 50%;
            right: 14px;
            transform: translateY(-50%);
            color: #999;
            cursor: pointer;
            font-size: 14px;
            transition: color .2s;
        }

        .input-group .toggle-password:hover { color: #ff6b00; }

        .strength-bar-wrap {
            height: 5px;
            background: #eee;
            border-radius: 5px;
            margin-top: -12px;
            margin-bottom: 18px;
            overflow: hidden;
        }

        .strength-bar {
            height: 100%;
            width: 0%;
            border-radius: 5px;
            transition: width .3s, background .3s;
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

        .icon-box i { font-size: 30px; color: #ff6b00; }
    </style>
</head>
<body>

<div class="container">

    <div class="logo">&#127860; FoodieHub</div>

    <div class="icon-box">
        <i class="fas fa-shield-alt"></i>
    </div>

    <p class="page-title">Set New Password</p>
    <p class="page-desc">Resetting password for<br><span class="email-badge"><%= resetEmail %></span></p>

    <% String error = request.getParameter("error"); %>
    <% if (error != null && !error.isEmpty()) { %>
        <div class="alert alert-error"><i class="fas fa-exclamation-circle"></i> <%= error %></div>
    <% } %>

    <form action="resetPassword" method="post" onsubmit="return validateForm()">

        <div class="input-group">
            <i class="fas fa-lock icon"></i>
            <input type="password" name="newPassword" id="newPass"
                   placeholder="New Password (min 6 chars)" required
                   oninput="checkStrength(this.value)">
            <i class="fas fa-eye toggle-password" onclick="togglePass('newPass', 'icon1')" id="icon1"></i>
        </div>
        <div class="strength-bar-wrap">
            <div class="strength-bar" id="strengthBar"></div>
        </div>

        <div class="input-group">
            <i class="fas fa-lock icon"></i>
            <input type="password" name="confirmPassword" id="confirmPass"
                   placeholder="Confirm New Password" required>
            <i class="fas fa-eye toggle-password" onclick="togglePass('confirmPass', 'icon2')" id="icon2"></i>
        </div>

        <button type="submit" class="submit-btn">Reset Password</button>

    </form>

    <a href="forgot-password.jsp" class="back-link"><i class="fas fa-arrow-left"></i> Start Over</a>

</div>

<script>
    function togglePass(inputId, iconId) {
        const input = document.getElementById(inputId);
        const icon  = document.getElementById(iconId);
        if (input.type === 'password') {
            input.type = 'text';
            icon.classList.replace('fa-eye', 'fa-eye-slash');
        } else {
            input.type = 'password';
            icon.classList.replace('fa-eye-slash', 'fa-eye');
        }
    }

    function checkStrength(val) {
        const bar = document.getElementById('strengthBar');
        let strength = 0;
        if (val.length >= 6) strength++;
        if (val.length >= 10) strength++;
        if (/[A-Z]/.test(val)) strength++;
        if (/[0-9]/.test(val)) strength++;
        if (/[^A-Za-z0-9]/.test(val)) strength++;

        const colors = ['#e53e3e', '#ed8936', '#ecc94b', '#48bb78', '#38a169'];
        const widths = ['20%', '40%', '60%', '80%', '100%'];

        bar.style.width  = val.length === 0 ? '0%' : widths[strength - 1];
        bar.style.background = val.length === 0 ? 'transparent' : colors[strength - 1];
    }

    function validateForm() {
        const newPass  = document.getElementById('newPass').value;
        const confPass = document.getElementById('confirmPass').value;
        if (newPass !== confPass) {
            alert('Passwords do not match!');
            return false;
        }
        if (newPass.length < 6) {
            alert('Password must be at least 6 characters.');
            return false;
        }
        return true;
    }
</script>

</body>
</html>
