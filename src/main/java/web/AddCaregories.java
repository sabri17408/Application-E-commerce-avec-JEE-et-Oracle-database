package web;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import com.connection.DatabaseConnection;

@WebServlet("/AddCaregories")

public class AddCaregories extends HttpServlet {
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //Creating session
        HttpSession session = request.getSession();
        
      //Récuperer les parametres depuis le frontend (admin)
        String cat_name = request.getParameter("cname");
      //Insértion de la catégorie
        int i = DatabaseConnection.insertUpdateFromSqlQuery("insert into categories_tab(name) values('"+cat_name+ "')");
        
        //If category inserted sucessfully in the database
        if (i > 0)
        	 {
            //Adding method in session.
            session.setAttribute("message", "add success");
            //Response send to the admin-add-product.jsp
            response.sendRedirect("admin-add-category.jsp");

    
}
        }
}
