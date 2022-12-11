<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<%
    //Getting all the inputs from the admin
    int id = Integer.parseInt(request.getParameter("pid"));
    String pname = request.getParameter("pname");
    double price = Double.parseDouble(request.getParameter("price"));
    String details = request.getParameter("description");
    int stock = Integer.parseInt( request.getParameter("mprice"));
    String status = request.getParameter("status");
    //Querying to the database
    PreparedStatement st = DatabaseConnection.getConnection().prepareStatement("update products set name=?,price=?,details=?,stock=?,statut=? where id=?");
    st.setString(1, pname);
    st.setDouble(2, price);
    st.setString(3, details);
    st.setInt(4, stock);
    st.setString(5, status);
    st.setInt(6,id);
    int updateProduct = st.executeUpdate();

    if (updateProduct > 0) {
    	String success = "Product updated successfully.";
    	session.setAttribute("message", "update success");
        response.sendRedirect("admin-view-product.jsp");
    } else {
    	String fail = "Product not updated.";
    	session.setAttribute("message", "update fail");
        response.sendRedirect("admin-view-product.jsp");
    }
%>