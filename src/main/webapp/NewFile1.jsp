<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@ page language="java"%>   
 <%@ page import="java.io.*"%>
 <%@ page import="java.sql.*"%>
  <%@ page import="com.connection.DatabaseConnection"%>
 
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>Blog Template · Bootstrap v5.1</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/blog/">

    

    <!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

    
    <!-- Custom styles for this template -->
    <link href="https://fonts.googleapis.com/css?family=Playfair&#43;Display:700,900&amp;display=swap" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="blog.css" rel="stylesheet">
  </head>
  <body>
    
<div class="container">
  <header class="blog-header py-3">
    <div class="row flex-nowrap justify-content-between align-items-center">
        <div class="col-1 pt-1">
        <a class="link-secondary" href="IndexPrincipale.jsp">Acceuil</a>
      </div>
      <%
                if ((String) session.getAttribute("name") != null) {
            %>
          <div class="col-1 pt-1">
        <a class="link-secondary" href="my-orders.jsp">Commandes</a>
      </div>  
      <div class="col-4 text-center">
        <h3><a class="blog-header-logo text-dark"  href="IndexPrincipale.jsp">Parapharmacie</a></h3>
      </div> 
        <div class="col-4 d-flex justify-content-end align-items-center">
        <a class="link-secondary" href="checkout.jsp" aria-label="Search">
          <img src="images/index/panier2.png" width="40" height="40" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="mx-3" role="img" viewBox="0 0 24 24"><title>Search</title><circle cx="10.5" cy="10.5" r="7.5"/><path d="M21 21l-5.2-5.2"/></img>
        </a>
        <a class="btn btn-sm btn-outline-secondary" href="logout.jsp">Se déconnecter</a>
      </div>
            <%
            } else {
            %>
        <div class="col-2 pt-1">
        <a class="link-secondary" href="customer-register-Principal.jsp">Créer compte</a>
      </div>
      <div class="col-2 text-center">
        <h3><a class="blog-header-logo text-dark"  href="IndexPrincipale.jsp">Parapharmacie</a></h3>
      </div>
      <div class="col-4 d-flex justify-content-end align-items-center">
        <a class="link-secondary" href="checkout.jsp" aria-label="Search">
          <img src="images/index/panier2.png" width="40" height="40" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="mx-3" role="img" viewBox="0 0 24 24"><title>Search</title><circle cx="10.5" cy="10.5" r="7.5"/><path d="M21 21l-5.2-5.2"/></img>
        </a>
        <a class="btn btn-sm btn-outline-secondary" href="customer-login-Principal.jsp">Se connecter</a>
         <a class="btn btn-sm btn-outline-secondary" href="admin-login.jsp">Admin </a>
      </div>
    
            <%
                }
            %>
     
    </div>

  <div class="nav-scroller py-1 mb-2">
    <nav class="nav d-flex justify-content-between">
          <% 
	
   
	
	ResultSet rs = DatabaseConnection.getResultFromSqlQuery("select name from categories_tab  ");
	while(rs.next()) {
		
%>
    
      <a class="p-2 link-secondary" href="./ListerProduit?name=<%=rs.getString("name") %>"><%=rs.getString("name")%></a>
 
   
  <% 
	}    
		      
%>
          
    
    </nav>
  </div>
</div>  
                             