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

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.FileUploadBase.*;

import com.connection.DatabaseConnection;

@WebServlet("/AddProducts")
public class AddProducts1 extends HttpServlet {

	// Path where all the images are stored
	private final String UPLOAD_DIRECTORY = "C:\\Users\\hp\\eclipse-workspace\\E-commerce_Oracle\\src\\main\\webapp\\uploads";

	@SuppressWarnings("deprecation")
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //Creating session
        HttpSession session = request.getSession();
        if (ServletFileUpload.isMultipartContent(request)) {
            try {
                //Taking all image requests
                @SuppressWarnings("unchecked")
				List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                String imageName = null;
                String productName = null;
                String productPrice = null;
                String descrip = null;
                String stock = null;
                String status = null;
                String category = null;

                //SALTCHARS to generate unique code for product
                String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
                StringBuilder salt = new StringBuilder();
                Random rnd = new Random();
                while (salt.length() < 3) { // length of the random string.
                    int index = (int) (rnd.nextFloat() * SALTCHARS.length());
                    salt.append(SALTCHARS.charAt(index));
                }
                String code = salt.toString();

                for (FileItem item : multiparts) {
                    if (!item.isFormField()) {
                        //Getting image name
                        imageName = new File(item.getName()).getName();
                        //Storing in the specified directory
                        item.write(new File(UPLOAD_DIRECTORY + File.separator + imageName));

                        //Retriving all information from frontend
                        FileItem pName = (FileItem) multiparts.get(0);
                        productName = pName.getString();

                        FileItem price = (FileItem) multiparts.get(1);
                        productPrice = price.getString();

                        FileItem description = (FileItem) multiparts.get(2);
                        descrip = description.getString();

                        FileItem pstock = (FileItem) multiparts.get(3);
                        stock = pstock.getString();

                        FileItem fstatus = (FileItem) multiparts.get(4);
                        status = fstatus.getString();

                        FileItem pcategory = (FileItem) multiparts.get(5);
                        category = pcategory.getString();

                    }
                }
                try {
                	//int id = 0;
                    String imagePath = UPLOAD_DIRECTORY + imageName;
                    Connection con = DatabaseConnection.getConnection();
					
                    	//Insértion du produit
                        int i = DatabaseConnection.insertUpdateFromSqlQuery("insert into products(statut,code,details,image,image_name,name,price,stock)"
                        		+ " values('" + status + "','" + code + "','" + descrip + "','" + imagePath + "','" + imageName + "','" + productName + "','" 
                        		+ productPrice + "','" + stock + "')");
                        
                        //si le produit est inséré
                        if (i > 0) {
                        	//Insérer la référence vers la catégorie du produit
                        	int j=  DatabaseConnection.insertUpdateFromSqlQuery("update products p set p.category= (select ref(d) ref "
                        			+ "from  categories_tab d where name= '" + category + "') where code= '" + code + "'");
                        	if (j > 0)
                        	 {String success = "Product added successfully.";
                            //Adding method in session.
                            session.setAttribute("message", success);
                            //Response send to the admin-add-product.jsp
                            response.sendRedirect("admin-add-product.jsp");
                    }
                        }
                   
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } catch (Exception ex) {
                //If any occur occured
                request.setAttribute("message", "File Upload Failed due to " + ex);
            }
        } else {
            request.setAttribute("message", "Sorry this Servlet only handles file upload request");
        }
    }
}
