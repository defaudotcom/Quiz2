package servlet2;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Connection;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class registerservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
//	private final String url = "jdbc:postgresql://localhost/logindb?useSSL=false";
//    private final String user = "postgres";
//    private final String password = "Dhiren20";
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname = request.getParameter("name");
		String uemail = request.getParameter("email");
		String upwd = request.getParameter("pass");
		RequestDispatcher dispatcher = null;
		Connection con = null;
		
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost/logindb", "postgres", "Dhiren20");
			PreparedStatement pst = con.prepareStatement("insert into login_user(uname, upwd, uemail) values(?, ?, ?)");
			
			pst.setString(1, uname);
			pst.setString(2, upwd);
			pst.setString(3, uemail);
			
			int rowcount = pst.executeUpdate();
			dispatcher = request.getRequestDispatcher("register.jsp");
			
			if (rowcount > 0 ) {
				request.setAttribute("status", "success");
			} else {
				request.setAttribute("status", "failed");
			}
			
			dispatcher.forward(request, response);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				
					con.close();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} 
	}

}