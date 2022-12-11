<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.HttpSession"%>

<% if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {


    int id = Integer.parseInt(request.getParameter("catId"));
    int deleteProduct = DatabaseConnection.insertUpdateFromSqlQuery("delete from categories_tab where id='" + id + "' ");
    if (deleteProduct > 0) {
    	session.setAttribute("message", "delete success");
        response.sendRedirect("admin-add-category.jsp");

       
    } else {
    	String fail = "Product not deleted.";
    	session.setAttribute("message", "delete fail");
        response.sendRedirect("admin-add-category.jsp");


    }
}else {
    response.sendRedirect("admin-login.jsp");
}
%>
%>