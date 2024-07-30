<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="ecommerce.online.model.User" %>


<%
    User auth = (User) request.getSession().getAttribute("auth");
    if(auth == null){
        response.sendRedirect("login.jsp");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <%@include file="includes/head.jsp"%>
    <title>Payment Details</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        /* Add your styles here */
        .container {
            max-width: 600px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .btn-submit {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
        }
        .btn-submit:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Payment Details</h2>
        <form action="payment" method="post">
            <div class="form-group">
                <label for="paymentMethod">Payment Method:</label>
                <select class="form-control" id="paymentMethod" name="paymentMethod" required>
                    <option value="Credit Card">Credit Card</option>
                    <option value="Debit Card">Debit Card</option>
                    <option value="PayPal">PayPal</option>
                    <option value="COD">Cash on Delivery</option>
                </select>
            </div>
            <div class="form-group">
                <label for="cardNumber">Card Number:</label>
                <input type="text" class="form-control" id="cardNumber" name="cardNumber" required>
            </div>
            <div class="form-group">
                <label for="expiryDate">Expiry Date:</label>
                <input type="text" class="form-control" id="expiryDate" name="expiryDate" placeholder="MM/YY" required>
            </div>
            <div class="form-group">
                <label for="cvv">CVV:</label>
                <input type="text" class="form-control" id="cvv" name="cvv" required>
            </div>
            <button type="submit" class="btn btn-submit btn-block">Place Order</button>
        </form>
    </div>
    <%@include file="includes/footer.jsp"%>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
