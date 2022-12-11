package web;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;



@WebServlet("/AddToCart")
public class AddToCart extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

//        int id = 0;

        //Getting all the parameters from the user
       int productId = Integer.parseInt(request.getParameter("pid"));

        String price = request.getParameter("price");
        
        HttpSession hs = request.getSession();
        try {
            //If user session is null user have to re-login
            if ((String) hs.getAttribute("name") == null) {
                response.sendRedirect("customer-login-Principal.jsp");
                //Inserting cart details to the database
            } else {
                int customerId = (int) hs.getAttribute("id");
                //Querying to the database.
                ResultSet rs=DatabaseConnection.getResultFromSqlQuery("select * from cart_tab where custmer_id= '" + customerId + "'");
                if(rs.next()) {
                    int updateToCart = DatabaseConnection.insertUpdateFromSqlQuery("insert into table(select products from cart_tab where custmer_id='" + customerId + "') values(product_type('" + productId + "',1,'" + price +  "'))");
                    if (updateToCart > 0) {
                    response.sendRedirect("IndexPrincipale.jsp");
                }
                }else {
                    int addToCart = DatabaseConnection.insertUpdateFromSqlQuery("insert into cart_tab values('" + customerId + "',products_type(product_type('" + productId + "',1,'" + price +  "')))");

                    if (addToCart > 0) {
                      response.sendRedirect("IndexPrincipale.jsp");
                  }
            	
            }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
