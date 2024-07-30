 <%@page import="ecommerce.online.dao.ProductDao"%>
<%@page import="ecommerce.online.connection.DbCon"%>
<%@page import="ecommerce.online.model.*"%>
<%@page import="java.util.*"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth == null) {
        request.setAttribute("auth", auth);
    }

    ProductDao pd = new ProductDao(DbCon.getConnection());
    List<Product> products = pd.getAllProducts();

    ArrayList<Cart> cart_list = (ArrayList<Cart>)session.getAttribute("cart-list");
    List<Cart> cartProduct = null;
    if(cart_list!=null){
        ProductDao pDao = new ProductDao(DbCon.getConnection());
        cartProduct=pDao.getCartProducts(cart_list);
        double total=pDao.getTotalPrice(cart_list);
        request.setAttribute("cart_list",cart_list);
        request.setAttribute("total", total);
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@include file="includes/head.jsp"%>
    
    <title>All Products</title>
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet"> <!-- Google Font for attractive design -->
    <style>
        body {
            font-family: 'Pacifico', cursive;
            background-color: #021321;
            color: white;
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

        .card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            color: black;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        .navbar {
            background-color: rgba(0, 0, 0, 0.7);
            color: white;
            position: sticky;
            top: 0;
            z-index: 1000;
            backdrop-filter: blur(10px);
        }

        .navbar-brand img {
            height: 40px; /* Increased logo size */
        }

        .footer {
            background-color: rgba(0, 0, 0, 0.7);
            color: #ffffff;
            padding: 20px 0;
            position: relative;
            bottom: 0;
            width: 100%;
            z-index: 1000;
        }

        .footer-links {
            display: flex;
            justify-content: center;
            gap: 20px;
        }

        .footer-links a {
            color: #ffffff;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .footer-links a:hover {
            color: #007bff;
        }

        .search-container {
            position: relative;
        }

        .search-input {
            border-radius: 20px;
            border: 1px solid #555555;
            padding: 5px 15px;
            margin-right: 10px;
            background-color: #222222;
            color: #ffffff;
        }

        .search-button {
            border-radius: 20px;
            padding: 5px 15px;
            background-color: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .search-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");

%>

<div class="background-image"></div>

<%@include file="includes/navbar.jsp"%>

<div class="container mt-5">
    <div class="card-header mb-3" style="color:white;">All Products</div>
    <div class="row">
        <% if (products != null && !products.isEmpty()) {
            for (Product p : products) { %>
                <div class="col-lg-3 col-md-4 col-sm-6 my-3">
                    <div class="card h-100">
                        <img class="card-img-top" src="product-images/<%=p.getImage()%>" alt="<%=p.getName()%>">
                        <div class="card-body">
                            <h5 class="card-title"><%=p.getName()%></h5>
                            <h6 class="price">Price: &#8377;<%=p.getPrice()%></h6>
                            <h6 class="category">Category: <%=p.getCategory()%></h6>
                            <div class="mt-3 d-flex justify-content-between">
                                <a href="add-to-cart?id=<%=p.getId() %>" class="btn btn-dark">Add to cart</a>
                                
                                <a href="shipping.jsp?id=<%=p.getId() %>" class="btn btn-primary">Buy Now</a>
                            </div>
                        </div>
                    </div>
                </div>
            <% } 
            } else { %>
                <div class="col-12 text-center">
                    <h4>No products found.</h4>
                </div>
        <% } %>
    </div>
</div>



<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
