package web;
import com.connection.DatabaseConnection;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;


@WebServlet("/GetProductOrders")
public class GetProductOrders extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Creating Session
        int order_no = 1000;
        //Getting all the parameters from the user
        String customerName = request.getParameter("name");
        String mobile_number = request.getParameter("phone");
        String email_id = request.getParameter("email");
        String address = request.getParameter("address");
       
        String order_total = request.getParameter("order_total");
        String order_status = null;
        HttpSession session = request.getSession();
        //Storing payment attrbute in session

        try {
            //Getting maximium column of tblorders table
            ResultSet rsMaxOrderNo = DatabaseConnection.getResultFromSqlQuery("select max(no_order) from orders_tab");
            if (rsMaxOrderNo.next()) {
                order_no = rsMaxOrderNo.getInt(1);
                order_no = 1000 + order_no;
            }
            
                order_no++;
               
                order_status = "Pending";
                //Inserting product details inside the table
                int orderProducts = DatabaseConnection.insertUpdateFromSqlQuery(
                        "insert into orders_tab(no_order,custmer_name,phone,email,adresse,products,order_total,order_status,order_date) values('"
                        + order_no + "','" + customerName + "','" + mobile_number + "','"
                        + email_id + "','" + address + "', (select products from  cart_tab where custmer_id='" + session.getAttribute("id") + "'), to_number("+ order_total + "),'"+ order_status + "',current_timestamp)");
            
              
            if (orderProducts > 0) {
             //update quentity of products 
                ResultSet rsproducts_cart = DatabaseConnection.getResultFromSqlQuery("select p.id pid,p.quantity pqt from cart_tab, table(products) p where custmer_id='" + session.getAttribute("id") + "'");
                while (rsproducts_cart.next()) {
                    ResultSet rsproduct_qt = DatabaseConnection.getResultFromSqlQuery("select stock  from products where id='" + rsproducts_cart.getInt("pid") + "'");
                   if(rsproduct_qt.next())
                   { int new_qt= rsproduct_qt.getInt("stock")-rsproducts_cart.getInt("pqt");

                    DatabaseConnection.insertUpdateFromSqlQuery("update products set stock='" +  new_qt + "'where id='" +  rsproducts_cart.getInt("pid") + "'");
                   }
                }
              // delete cart 
                DatabaseConnection.insertUpdateFromSqlQuery("delete from cart_tab where custmer_id='" + session.getAttribute("id") + "'");
            
                //Sending response back to the user/customer
                String message = "Thank you for your order.";
                session.setAttribute("success", message);
                response.sendRedirect("checkout.jsp");
            } else {
                response.sendRedirect("checkout.jsp");
            }
         }catch (Exception e) {
            System.out.println(e);
        }
    }
}
