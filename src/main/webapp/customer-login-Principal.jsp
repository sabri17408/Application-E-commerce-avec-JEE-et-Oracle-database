<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
       <title>Parapharmacie</title>
        <!-- Importing all ui libs -->
        <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <link href="assets/css/style.css" rel="stylesheet" />
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
        <script src="js/simpleCart.min.js"></script>
        <script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
        <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,900,900italic,700italic' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <script src="js/jquery.easing.min.js"></script>
        <script src='../../../../../../ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js'></script>
        <script src="../../../../../../m.servedby-buysellads.com/monetization.js" type="text/javascript"></script>
    </head>
    <body>
        
                    
                           
                          <%--   <%
                                ResultSet resultCount = DatabaseConnection.getResultFromSqlQuery("select count(*) from tblcart where customer_id='" + session.getAttribute("id") + "'");
                                resultCount.next();
                                int count = resultCount.getInt(1);
                            %> --%>
                            
                       
     <jsp:include page="NewFile1.jsp"></jsp:include>
        <div class="modal-dialog" role="document">
           <div class="modal-content modal-info">

                  <div class="modal-header">
                    
                </div>
                <div class="modal-body modal-spa">
                    <div class="login-grids">
                        <div class="login">
                            <div class="login-bottom">
                                <h3>Connectez vous </h3>
                                <%
                                    String credential = (String) session.getAttribute("credential");
                                    if (credential != null) {
                                        session.removeAttribute("credential");
                                %>
                                <div class="alert alert-danger" id="danger" style="width: 460px;">You have enter wrong credentials.</div>
                                <%
                                    }
                                %>
                                <form action="CustomerLogin" method="post">
                                    <div class="sign-in">
                                        <h4>Email :</h4>
                                        <input type="text" value="" style="width: 460px;" required=""
                                               name="email">
                                    </div>
                                    <div class="sign-in">
                                        <h4>Mot de passe :</h4>
                                        <input type="password" value="" style="width: 460px;"
                                               required="" name="password">
                                    </div>
                                    <div class="sign-in">
                                        <input type="submit" value="Se connecter" style="width: 460px;">
                                    </div>
                                </form>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <p>
                            <a href="customer-register.jsp">Nouveau pour Smart Shop? Creer un compte</a>
                        </p>
                    </div>
                </div>
                </div>
            </div>
        </div>
  
    </body>
</html>