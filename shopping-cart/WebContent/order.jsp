<%@page import="ecommerce.online.dao.OrderDao"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="ecommerce.online.connection.DbCon"%>
<%@page import="ecommerce.online.dao.ProductDao"%>
<%@page import="ecommerce.online.model.*"%>
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
     List<Order> orders = null;
     ProductDao pDao = new ProductDao(DbCon.getConnection()); // Declare pDao here
     
     
         
         
        
         
     

if(auth!=null){
	request.setAttribute("auth", auth);
    OrderDao orderDao  = new OrderDao(DbCon.getConnection());
    orders = orderDao.getUserOrders(auth.getId());
    
}
else{
	response.sendRedirect("login.jsp");
}
    


	
	
}


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		

<%@include file="includes/head.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BroadBasket Orders</title>
</head>
<body>



	

	
	<div class="container">
		<div class="card-header my-3">All Orders</div>
		<table class="table table-light">
			<thead>
				<tr>
				<th>Order ID</th>
                <th>User ID</th>
                <th>Product ID</th>
                <th>Product Name</th>
                <th>Category</th>
                <th>Quantity</th>
                <th>Date</th>
                <th>Order Status</th>
                <th>Shipping Method</th>
                <th>Total Price</th>
                <th>Action</th>
				</tr>
			</thead>
			<tbody>
			<% 
			if(orders!=null){
				for(Order o:orders){
					Product product = pDao.getProductById(o.getProductId());
				%>
				
				<tr>
					<td><%=o.getOrderId() %></td>
	                <td><%=o.getUserId()%></td>
	                <td><%=o.getProductId() %></td>
	                <td><%= product.getName() %></td>
                    <td><%= product.getCategory() %></td>
	                <td><%=o.getQuantity() %></td>
	                <td><%=o.getDate()%></td>
	                <td><%=o.getOrderStatus() %></td>
	                <td>&#8377;<%=o.getTotalPrice() %></td>
	                <td><a class="btn btn-sm btn-danger" href="cancel-order?id=<%=o.getOrderId()%>">Cancel</a></td>
	                
					</tr>
				<%}
			
			}%>
			</tbody>
			</table>
   </div>

<%@include file="includes/footer.jsp" %>

</body>
</html>