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
                                <h3>Rejoindez nous </h3>
                                <%
                                    String success = (String) session.getAttribute("success-message");
                                    if (success != null) {
                                        session.removeAttribute("success-message");
                                %>
                                <div class='alert alert-success' id='success' style="width: 460px">Customer
                                    Register Successfully.</div>
                                    <%
                                        }
                                        String fail = (String) session.getAttribute("fail-message");
                                        if (fail != null) {
                                            session.removeAttribute("fail-message");
                                    %>
                                <div class="alert alert-danger" id='danger' style="width: 460px;">Customer
                                    Registration Fail,Please try again</div>
                                    <%
                                        }
                                    %>
                                <form action="AddCustomer" method="post">
                                    <div class="sign-up">
                                        <h4>Nom :</h4>
                                        <input type="text" placeholder="Nom" required="" style="width: 460px" name="name">
                                    </div>
                                    <div class="sign-up">
                                        <h4>Email :</h4>
                                        <input type="text" placeholder="Email" required="" style="width: 460px;" name="email">
                                    </div>
                                    <div class="sign-up">
                                        <h4>Mot de passe :</h4>
                                        <input type="password" placeholder="Mot de passe" required="" style="width: 460px;" name="password">
                                    </div>
                                    <div class="sign-up">
                                        <h4>Mobile :</h4>
                                        <input type="text" placeholder="Mobile"  style="width: 460px;" name="mobile">
                                    </div>
                                    <div class="sign-up">
                                        <h4>Sexe :</h4>
                                        <br> <select class="form-control" style="width: 460px;" name="gender">
                                            <option>Femme</option>
                                            <option>Homme</option>
                                        </select>
                                    </div>
                                    <br>
                                    <div class="sign-up">
                                        <h4>Adresse :</h4>
                                        <input type="text" placeholder="Adresse"  style="min-height: 100px; width: 460px;" name="address">
                                    </div>
                                    <div class="sign-up">
                                        <h4>Code pin :</h4>
                                        <input type="text" placeholder="Code pin" required="" style="width:460px;" name="pincode">
                                    </div>
                                    <div class="sign-up">
                                        <input type="submit" value="REGISTER NOW" style="width: 460px;">
                                    </div>
                                </form>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <p>
                            <a href="customer-login.jsp">Client existe? Log In</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
  
    </body>
</html>