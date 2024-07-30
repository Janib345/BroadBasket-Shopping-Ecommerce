<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Broad-Basket</title>
    <!-- Bootstrap CSS -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom Font -->
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&family=Poppins:wght@300;400;500&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #1a1a1a;
            color: #ffffff;
            padding-top: 70px; /* Padding to compensate for the fixed navbar */
        }

        .navbar {
       /* height:200px;*/
            background-color:#021321;
           
            backdrop-filter: blur(10px);
            box-shadow: 0 4px 6px rgba(255, 255, 255, 0.1);
            z-index: 1000;
        }

        .navbar-brand {
            font-family: "DM Serif Display", serif;
            font-size: 2rem;
            color: #ffffff;
        }

        .navbar-brand img {
            height: 150px;
            width: 200px;
            border-radius: 50%;
            margin-right: 10px;
            transition: transform 0.3s ease;
        }

        .navbar-brand img:hover {
            transform: scale(1.1);
        }

        .navbar-nav .nav-link {
            color: #ffffff;
            font-weight: 500;
            margin-left: 15px;
            transition: color 0.3s ease, transform 0.3s ease;
        }

        .navbar-nav .nav-link:hover {
            color: #f7f7f7;
            transform: translateY(-3px);
        }

        .search-input {
            border-radius: 25px;
            border: none;
            padding: 10px 20px;
            background-color: rgba(255, 255, 255, 0.1);
            font-size: 1rem;
            transition: width 0.3s ease;
            width: 200px;
            color: #ffffff;
        }

        .search-input:focus {
            width: 250px;
        }

        .search-button {
            border-radius: 25px;
            padding: 10px 20px;
            background-color: #ffffff;
            color: #007bff;
            border: none;
            font-weight: 500;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .search-button:hover {
            background-color: #f7f7f7;
            color: #0056b3;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg fixed-top">
    <div class="container">
        <a class="navbar-brand" href="#">
            <img src="product-images/logo.jpg" alt="BroadBasket Logo">
            <span>BroadBasket</span>
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="index.jsp" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="cart.jsp">Cart <span class="badge badge-danger">${cart_list.size()}</span> </a>
                </li>
                
                <% if(auth!=null){ %>
                <li class="nav-item">
                    <a class="nav-link" href="order.jsp">Orders</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="log-out">LogOut</a>
                </li>
                <% } else { %>
                <li class="nav-item">
                    <a class="nav-link" href="register.jsp">Register</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp">Login</a>
                </li>
                <% } %>
            </ul>
            <!-- Search bar -->
            <form class="form-inline" action="search-products" method="get">
                <input class="form-control search-input mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="query">
                <button class="btn search-button my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>

<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
