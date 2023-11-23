<%@ page import="connection.dbconnect" %>
<%@ page import="database2.animal2" %>
<%@ page import="database.*" %>

<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	DecimalFormat dcf = new DecimalFormat("#.##");
	request.setAttribute("dcf", dcf);
	
	ArrayList<cart> cart_list = (ArrayList<cart>) session.getAttribute("cart-list");
	List<cart> adoptanimal = null;
	
	if (cart_list != null) {
		try {
	        dbconnect connectionManager = new dbconnect(); // Create an instance of your dbconnect class
	        Connection connection = connectionManager.getConnection();
	        if (connection == null) {
	            throw new Exception("Database connection is null.");
	        } 
	        
	        animal2 a2 = new animal2(connection);
	        adoptanimal = a2.getCartProducts(cart_list);
			double total = a2.getTotalCartPrice(cart_list);
			request.setAttribute("total", total);
			request.setAttribute("cart_list", cart_list);

		} catch (Exception e) {
	        e.printStackTrace();
	        out.println("Error: " + e.getMessage());
	    }
		
}
%>
<!DOCTYPE html>
<html>
	<head>
		<%@include file="/includes/head.jsp"%>
		<title>animal adoption</title>
	</head>
	<body>
		<%@include file='includes/header.jsp' %>
		
		<section> 
			<div class="container my-3">
			<div class="d-flex py-3"><h3>Total Price: $ ${(total>0)?dcf.format(total):0} </h3> <a class="mx-3 btn btn-primary" href="cart-check-out">Check Out</a></div>
			<table class="table table-light">
				<thead>
					<tr>
						<th scope="col">Name</th>
						<th scope="col">Price</th>
						<th scope="col">Pay Now</th>
						<th scope="col">Cancel</th>
					</tr>
				</thead>
				<tbody>
					<%
					if (cart_list != null) {
						for (cart c : adoptanimal) {
					%>
					<tr>
						<td><%=c.getName()%></td>
						<td><%= dcf.format(c.getPrice())%></td>
						<td>
							<form action="order-now" method="post" class="form-inline">
								<input type="hidden" name="petid" value="<%= c.getId()%>" class="form-input">
								<button type="submit" class="btn btn-primary btn-sm">Pay</button>
							</form>
						</td>
						<td><a class="btn btn-sm btn-danger" href="pet-remove?petid=<%=c.getId() %>" >Remove</a></td>
					</tr>
	
					<%
					}}%>
				</tbody>
			</table>
		</div>
		</section>
		
	
		<%@include file="/includes/footer.jsp"%>
	</body>
</html>