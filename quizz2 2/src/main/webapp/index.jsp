<%@ page import="connection.dbconnect" %>
<%@ page import="database2.animal2" %>
<%@ page import="database.*" %>

<%@ page import="java.util.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%
    List<animal> animals = null;
    
    try {
        dbconnect connectionManager = new dbconnect(); // Create an instance of your dbconnect class
        Connection connection = connectionManager.getConnection();
        if (connection == null) {
            throw new Exception("Database connection is null.");
        }

        animal2 a2 = new animal2(connection);
        animals = a2.getallanimal();

        ArrayList<cart> cart_list = (ArrayList<cart>) session.getAttribute("cart-list");
        if (cart_list != null) {
            request.setAttribute("cart_list", cart_list);
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error: " + e.getMessage());
    }
%>


<!DOCTYPE html>
<html>
	<head>
	    <%@include file='includes/head.jsp' %>
	    <title>Pet Adoption</title>
	</head>
	<body>
	    <%@include file='includes/header.jsp' %>
		<section id="page">
			<div class="container">
		        
		        <div class="row">
		           <%
					if (!animals.isEmpty()) {
						for (animal a : animals) {
					%>
		            <div class="col-md-3 my-3">
		                <div class="card w-100">
								<img class="card-img-top" src="<%=a.getImage() %>"
									alt="Card image cap">
								<div class="card-body">
									<h5 class="card-title"><%=a.getName() %></h5>
									<h6 class="price">Price: $<%=a.getPrice() %></h6>
									<div class="mt-3 d-flex justify-content-between">
										<a class="btn btn-dark" href="add-pet?petid=<%=a.getId() %>">Add to Cart</a> 
									</div>
								</div>
							</div>
		            </div>
		            <%
		                }
		            } else {
		                out.println("There is no animal or an error occurred.");
		            }
		            %>
		        </div>
		    </div>
		</section>
	    
	
	    <%@include file='includes/footer.jsp' %>
	</body>
</html>
