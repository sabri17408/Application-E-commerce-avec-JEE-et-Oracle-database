package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;


@WebServlet("/AddCustomer")
public class AddCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		  HttpSession hs = request.getSession();
		 String name = request.getParameter("name");
	        String email = request.getParameter("email");
	        String password = request.getParameter("password");
	        String mobile = request.getParameter("mobile");
	        String gender = request.getParameter("gender");
	        String address = request.getParameter("address");
	        String pincode = request.getParameter("pincode");
		
	       
	    		
		// Etablissement de la Connexion
				Connection con = DatabaseConnection.getConnection();
				
				PreparedStatement stm;
				String sql3="insert into customer(infos,added_date) values (users(?,?,?,?,?,?,?),current_date)";
				try {
					stm=con.prepareStatement(sql3);
					 stm.setString(1, name);
					stm.setString(2, email);
					stm.setString(3, password);
					stm.setString(4, mobile);
					stm.setString(5, gender);
					stm.setString(7, address);
					stm.setString(6, pincode);

					stm.executeUpdate();
					
					   String message = "Customer register successfully.";
		                //Passing message via session.
		                hs.setAttribute("success-message", message);
		                //Sending response back to the user/customer
		                response.sendRedirect("customer-register-Principal.jsp");
				
					
					
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					//If customer fails to register 
	                String message = "Customer registration fail";
	                //Passing message via session.
	                hs.setAttribute("fail-message", message);
	                //Sending response back to the user/customer
	                response.sendRedirect("customer-register-Principal.jsp");
				}
		    	
		    	
				
				
				
				
			
				
				
				
			
		
		
		}

	}
