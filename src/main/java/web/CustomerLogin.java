package web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 import com.connection.DatabaseConnection;



@WebServlet("/CustomerLogin")
public class CustomerLogin extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //Getting all data from user/customer
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        //Creating Session
        HttpSession hs = request.getSession();
        try {
        	ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select c.infos.name name,id,c.infos.email email , c.infos.password from customer c where c.infos.email='"+email+"' and c.infos.password='"+password+"'");
			
        	System.out.println(email+password);
            if (email != null && password != null) {
                if (resultset.next()) {
                    //Storing the login details in session
                	System.out.println(email+password);
                    hs.setAttribute("id", resultset.getInt("id"));
                    System.out.print(true);
                    hs.setAttribute("name", resultset.getString("name"));
                    System.out.print(true);
                    hs.setAttribute("email", resultset.getString("email"));
                    System.out.print(true);
                    System.out.println(email+password);
                    //Redirecting response to the index.jsp
                    response.sendRedirect("IndexPrincipale.jsp");
                } else {
                    //If wrong credentials are entered
                    String message = "You have enter wrong credentials";
                    hs.setAttribute("credential", message);
                    //Redirecting response to the customer-login.jsp
                    response.sendRedirect("customer-login-Principal.jsp");
                }
            } 
            if(email == null || password == null) {
                //If username or password is empty or null
                String message = "User name or Password is null";
                hs.setAttribute("credential", message);
                //Redirecting response to the customer-login.jsp
                response.sendRedirect("customer-login-Principal.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
