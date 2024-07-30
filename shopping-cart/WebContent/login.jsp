<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
    
<%@page import="ecommerce.online.model.Cart"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ecommerce.online.model.User"%>

<% 
    User auth = (User) request.getSession().getAttribute("auth");
    if(auth!=null){
	    request.setAttribute("auth", auth);
	    response.sendRedirect("index.jsp");
    }
%>

<%
    ArrayList<Cart> cart_list = (ArrayList<Cart>)session.getAttribute("cart-list");
    List<Cart> cartProduct = null;
    if(cart_list!=null){
	    request.setAttribute("cart_list",cart_list);
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="includes/head.jsp"%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #1a1a1a;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            background-color: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            box-shadow: 0px 0px 20px rgba(255, 255, 255, 0.2);
            padding: 40px;
            width: 400px;
            max-width: 80%;
            text-align: center;
            animation: fadeIn 0.5s ease;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        h2 {
            margin-top: 0;
            color: #ffffff;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        label {
            margin-bottom: 5px;
            color: #cccccc;
        }

        input[type="email"],
        input[type="password"],
        input[type="submit"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #333333;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
            color: #ffffff;
            background-color: rgba(255, 255, 255, 0.1);
            animation: slideIn 0.5s ease;
        }

        input[type="submit"] {
            background-color: #007bff;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .register-link {
            margin-top: 20px;
            color: #007bff;
            text-decoration: none;
            transition: color 0.3s ease;
            animation: slideIn 0.5s ease;
        }

        .register-link:hover {
            color: #0056b3;
        }

        .error-message {
            color: red;
            margin-top: 10px;
            animation: slideIn 0.5s ease;
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Loading spinner styles */
        .spinner {
            border: 4px solid rgba(255, 255, 255, 0.1);
            border-left-color: #007bff;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            animation: spin 1s linear infinite;
            margin: 20px auto;
            display: none;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        .loading-text {
            margin-bottom: 20px;
            display: none;
        }
    </style>
</head>
<body>
    

    <div class="login-container">
        <h2>Login</h2>
        <form action="user-login" method="post" id="login-form">
            <label for="email">Email:</label>
            <input type="email" id="username" placeholder="Enter Your Email" name="login-email" required>

            <label for="password">Password:</label>
            <input type="password" id="password" placeholder="Enter Your Password" name="login-password" required>

            <input type="submit" value="Login">
            <div class="loading-text" id="loading-text">Logging in...</div>
            <div class="spinner" id="spinner"></div>

            <a href="register.jsp" class="register-link">Don't have an account? Register here.</a>
            <a href="index.jsp" class="register-link">Back to Home Page</a>

            <!-- Error message for wrong email/password -->
            <div class="error-message" id="error-message" style="display: none;">
                Incorrect username or password. Please try again.
            </div>
        </form>
    </div>

    <!-- Script to display error message and loading spinner -->
    <script>
        // Simulate incorrect login (for demonstration)
        const queryParams = new URLSearchParams(window.location.search);
        const error = queryParams.get('error');

        if (error === 'true') {
            document.getElementById('error-message').style.display = 'block';
        }

        document.getElementById('login-form').addEventListener('submit', function() {
            // Hide submit button, show loading spinner and text
            document.getElementById('loading-text').style.display = 'block';
            document.getElementById('spinner').style.display = 'block';
            document.querySelector('input[type="submit"]').style.display = 'none';
        });
    </script>
</body>
</html>
