package web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //Recuperer les paramètres depuis le frontend
            String email = request.getParameter("email");
            String pass = request.getParameter("upass");
            //Récuperere notre session
            HttpSession hs = request.getSession();
            //Appeler la méthode de connexion à la base de données
            Connection con = DatabaseConnection.getConnection();
            //Cration de Statement
            PreparedStatement st = con.prepareStatement("select * from admins where email=? AND password=?");
            st.setString(1,email);  
            st.setString(2,pass);  
            //Exécuter la requete
            ResultSet resultset = st.executeQuery();
            //Si les données saisies sont correctes
            if (resultset.next()) {
                hs.setAttribute("uname", resultset.getString("name"));
                //Redirection  vers le dashboard de l'admin
                response.sendRedirect("dashboard.jsp");

            } else {
                String message = "You have enter wrong credentials";
                hs.setAttribute("credential", message);
                //Redirectiion vers la page s'authentification
                response.sendRedirect("admin-login.jsp");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
