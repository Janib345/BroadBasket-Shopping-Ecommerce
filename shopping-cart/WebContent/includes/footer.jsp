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
            background-color: #021321;
            color: #ffffff;
            padding-bottom: 50px; /* Padding to compensate for the fixed footer */
        }

        .navbar, .footer {
            background-color: #021321;
            backdrop-filter: blur(10px);
            box-shadow: 0 4px 6px rgba(255, 255, 255, 0.1);
            z-index: 1000;
        }

        .navbar-brand, .footer-brand {
            font-family: "DM Serif Display", serif;
            font-size: 2rem;
            color: #ffffff;
        }

        .navbar-brand img, .footer-brand img {
            height: 150px;
            width: 200px;
            border-radius: 50%;
            margin-right: 10px;
            transition: transform 0.3s ease;
        }

        .navbar-brand img:hover, .footer-brand img:hover {
            transform: scale(1.1);
        }

        .navbar-nav .nav-link, .footer-links .footer-link {
            color: #ffffff;
            font-weight: 500;
            margin-left: 15px;
            transition: color 0.3s ease, transform 0.3s ease;
        }

        .navbar-nav .nav-link:hover, .footer-links .footer-link:hover {
            color: #f7f7f7;
            transform: translateY(-3px);
        }

        .footer {
            position: fixed;
            bottom: 0;
            width: 100%;
        }

        .footer-links {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 10px;
        }

        .footer-link {
            margin: 0 15px;
            text-decoration: none;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg fixed-top">
    <!-- Navbar content -->
</nav>

<!-- Footer -->
<div class="footer">
    <div class="footer-links">
        <a href="#" class="footer-link">About Us</a>
        <a href="#" class="footer-link">Contact Us</a>
        <a href="#" class="footer-link">Shipping</a>
        <a href="#" class="footer-link">Returns</a>
        <a href="#" class="footer-link">FAQ</a>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
