<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<%
     int productId = Integer.parseInt(request.getParameter("productId"));
    //Delete query for cart of particular id
    int removeCartProduct = DatabaseConnection.insertUpdateFromSqlQuery("delete from table(select products from cart_tab where custmer_id='" + session.getAttribute("id") + "') where id='" + productId + "'");
    if (removeCartProduct > 0) {
        response.sendRedirect("checkout.jsp");
    } else {
        response.sendRedirect("checkout.jsp");
    }
%>