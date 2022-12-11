package web;

import com.connection.DatabaseConnection;
import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/CustomerProductsOrderStatus")
public class CustomerProductsOrderStatus extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int statusMode = 0;

            //Taking input from admin order-id to get the order status from the database
            ResultSet rs = DatabaseConnection.getResultFromSqlQuery("select order_status from orders_tab where no_order='" + request.getParameter("orderId") + "'");
            while (rs.next()) {
                if (rs.getString(1).equals("Deliver")) {
                    statusMode = DatabaseConnection.insertUpdateFromSqlQuery("update orders_tab set order_status='Pending' where no_order='" + request.getParameter("orderId") + "'");
                } else {
                    statusMode = DatabaseConnection.insertUpdateFromSqlQuery("update orders_tab set order_status='Deliver' where no_order='" + request.getParameter("orderId") + "'");

                    //update quentity of products 
                    ResultSet rsproducts_cart = DatabaseConnection.getResultFromSqlQuery("select p.id pid,p.quantity pqt from orders_tab, table(products) p where no_order='" + request.getParameter("orderId") + "'");
                    while (rsproducts_cart.next()) {
                        ResultSet rsproduct_qt = DatabaseConnection.getResultFromSqlQuery("select stock  from products where id='" + rsproducts_cart.getInt("pid") + "'");
                       if(rsproduct_qt.next())
                       { int new_qt= rsproduct_qt.getInt("stock")-rsproducts_cart.getInt("pqt");

                        DatabaseConnection.insertUpdateFromSqlQuery("update products set stock='" +  new_qt + "'where id='" +  rsproducts_cart.getInt("pid") + "'");
                       }
                    }
                }
            }
            if (statusMode > 0) {
                //Sending response back to admin-all-orders.jsp page when sql query executed sucesfully
                response.sendRedirect("admin-all-orders.jsp");
            } else {
                //Sending response back to admin-all-orders.jsp page
                response.sendRedirect("admin-all-orders.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
