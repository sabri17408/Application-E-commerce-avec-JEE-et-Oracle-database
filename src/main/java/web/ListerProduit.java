package web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.connection.DatabaseConnection;

/**
 * Servlet implementation class downloadImage
 */
@WebServlet("/ListerProduit")
public class ListerProduit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String name=req.getParameter("name");
		HttpSession session= req.getSession();

		
			
		
		ResultSet rs= DatabaseConnection.getResultFromSqlQuery("select name from categories_tab  where name='"+name+"'");
			
			
			try {
				if(rs.next()) {
					session.setAttribute("nameCat", rs.getString("name"));
				    
				    resp.sendRedirect("IndexCategorie.jsp");
				
				}
			} catch (SQLException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			
			
		
			
			
		
	
	
	
	}
}




