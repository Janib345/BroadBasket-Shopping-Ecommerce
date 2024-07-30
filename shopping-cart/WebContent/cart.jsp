<%@page import="java.text.DecimalFormat"%>
<%@page import="ecommerce.online.connection.DbCon"%>
<%@page import="ecommerce.online.dao.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="ecommerce.online.model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ecommerce.online.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%  
    DecimalFormat dcf = new DecimalFormat("#.##");
    request.setAttribute("dcf", dcf);
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth == null) {
        request.setAttribute("auth", auth);
    }
%>

<%
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
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cart Page</title>
<%@include file="includes/head.jsp"%>


<style type="text/css">
    /* Your CSS styles */

    /* Updated CSS styles for animations and attractive design */

    body {
        font-family: Arial, sans-serif;
        background-color: #021321;
        margin: 0;
        padding: 0;
    }

    .container {
        max-width: 800px;
        margin: 0 auto;
        padding: 20px;
    }

    .table {
    margin-top:65px;
        width: 100%;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        border-collapse: collapse;
        overflow: hidden;
    }

    .table th,
    .table td {
        padding: 15px;
        text-align: left;
        border-bottom: 1px solid #f0f0f0;
    }

    .table th {
        background-color: #f8f9fa;
    }

    .table tbody tr:hover {
        background-color: #f0f0f0;
    }

    .btn-primary {
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 5px;
        padding: 8px 16px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    

    .btn-primary:hover {
        background-color: #0056b3;
    }

    .btn-danger {
        background-color: #dc3545;
        color: #fff;
        border: none;
        border-radius: 5px;
        padding: 8px 16px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .btn-danger:hover {
        background-color: #c82333;
    }

    .form-group {
        display: flex;
        align-items: center;
    }

    .form-group .btn {
        margin: 0 5px;
    }

    .btn-incre,
    .btn-decre {
        background-color: #28a745;
        color: #fff;
        border: none;
        border-radius: 5px;
        padding: 8px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .btn-incre:hover,
    .btn-decre:hover {
        background-color: #218838;
    }

    .spinner {
        border: 4px solid rgba(0, 0, 0, 0.1);
        border-left-color: #007bff;
        border-radius: 50%;
        width: 40px;
        height: 40px;
        animation: spin 1s linear infinite;
        margin: 0 auto;
        display: none;
    }

    @keyframes spin {
        0% {
            transform: rotate(0deg);
        }
        100% {
            transform: rotate(360deg);
        }
    }

</style>
</head>
<body>

    <div class="container">
        <div class="d-flex justify-content-between align-items-center py-3">
            <h3>Total Price:&#8377; ${(total)>0?dcf.format(total):0}</h3>
            
            <a class="check btn btn-primary" href="check-out">Check Out</a>
           
        </div>
        <hr>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Name</th>
                    <th scope="col">Category</th>
                    <th scope="col">Price</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
                <% 
                if(cart_list!=null){
                    for(Cart c:cartProduct){%>
                        <tr>
                            <td><%=c.getName() %></td>
                            <td><%=c.getCategory() %></td>
                            <td>&#8377;<%=dcf.format(c.getPrice())%></td>
                            <td>
                                <div class="form-group">
                                    <a class="btn btn-decre" href="quantity-inc-dec?action=dec&id=<%=c.getId()%>"><i class="fas fa-minus-square"></i></a>
                                    <input type="text" class="form-control" value="<%=c.getQuantity() %>" readonly> 
                                    <a class="btn btn-incre" href="quantity-inc-dec?action=inc&id=<%=c.getId()%>"><i class="fas fa-plus-square"></i></a> 
                                </div>
                            </td>
                            <td>
                                <div class="btn-group" role="group">
                                    <form action="shipping.jsp?id=<%=c.getId() %>" method="post" class="from-inline">
                                        <input type="hidden" name="id" value="<%= c.getId()%>" class="from-input">
                                        <button type="submit" class="btn btn-primary">Buy</button>
                                    </form>
                                    <a class="btn btn-danger" href="remove-cart-item?id=<%=c.getId()%>">Remove</a>
                                </div>
                            </td>
                        </tr>
                    <%  }
                }
                %>
            </tbody>
        </table>
    </div>
    <%@include file="includes/footer.jsp"%>
</body>
</html>
