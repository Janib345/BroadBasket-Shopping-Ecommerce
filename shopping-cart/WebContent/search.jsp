<%@page import="ecommerce.online.model.User"%>
<%@page import="ecommerce.online.connection.DbCon"%>
<%@page import="ecommerce.online.dao.ProductDao"%>
<%@page import="ecommerce.online.model.Product"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User auth = (User) request.getSession().getAttribute("auth");
%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>Search Results</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <%@include file="includes/head.jsp"%>
    
    
    <!-- Add your custom styles here -->
    <style>
        /* Custom Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: white;
        }
        .background-image {
            position: fixed;
            top: 0;
            left: 0;
            width: 200%;
            height: 200%;
            z-index: -1;
            opacity: 0.5;
            background-image: url('product-images/galaxy.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            animation: moveBackground 20s linear infinite;
        }
        
        @keyframes moveBackground {
            0% {
                background-position: 0% 0%;
            }
            100% {
                background-position: 100% 100%;
            }
        }

        .navbar {
            background-color: #007bff;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            position: relative;
            z-index: 1000;
        }

        .search-results {
            margin-top: 80px; /* Adjust this value to create space between navbar and search results */
            opacity: 0;
            animation: fadeIn 1s ease-in-out forwards;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .card {
            color:black;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
            background-color: #ffffff; /* Card background color */
            opacity: 0;
            animation: slideUp 0.5s ease-in-out forwards;
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .card:hover {
            transform: translateY(-10px);
        }

        .card-img-top {
            height: 200px;
            object-fit: cover;
        }

        .alert-info {
            border-radius: 15px;
        }
    </style>
</head>
<body>

<%@include file="includes/navbar.jsp" %>
<div class="background-image"></div>
<div class="container mt-5 search-results">
    <h2 class="text-center mb-4" style="opacity: 0; animation: fadeIn 1s ease-in-out forwards;">Search Results</h2>
    
    
    <div class="row">
        <% 
            List<Product> products = (List<Product>) request.getAttribute("products");
            
            if (products != null && !products.isEmpty()) {
                for (Product product : products) {
        %>
        <div class="col-lg-3 col-md-4 col-sm-6 my-3">
            <div class="card h-100">
                <img class="card-img-top" src="product-images/<%=product.getImage()%>" alt="<%=product.getName()%>">
                <div class="card-body">
                    <h5 class="card-title"><%=product.getName()%></h5>
                    <h6 class="price">Price: $<%=product.getPrice()%></h6>
                    <h6 class="category">Category: <%=product.getCategory()%></h6>
                    <div class="mt-3 d-flex justify-content-between">
                        <a href="add-to-cart?id=<%=product.getId() %>" class="btn btn-dark">Add to cart</a>
                        <a href="order-now?quantity=1&id=<%=product.getId() %>" class="btn btn-primary">Buy Now</a>
                    </div>
                </div>
            </div>
        </div>
        <% 
                }
            } else {
        %>
        <div class="col-md-12">
            <div class="alert alert-info text-center" role="alert" style="opacity: 0; animation: fadeIn 1s ease-in-out forwards;">
                No products found for the given search query.
            </div>
        </div>
        <% 
            }
        %>
    </div>
</div>


<!-- Bootstrap JS and other scripts -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
