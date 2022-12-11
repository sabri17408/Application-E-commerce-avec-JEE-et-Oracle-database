<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"  %>
<%@ page import="com.connection.DatabaseConnection"  %>

<!DOCTYPE html>
<html>
    <head>
        <title>Online Shopping System</title>
        <!-- Importing all ui libs -->
        <link href="assets/css/bootstrap.css" rel="stylesheet" />
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
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    </head>
    <body>
        <%
            //Checking whether admin in session or not
            if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
        %>
        <jsp:include page="adminHeader.jsp"></jsp:include>
            <div class="content-wrapper">
                <div class="container">
                    <div class="row pad-botm">
                        <div class="col-md-12">
                            <h4 class="header-line">Ajouter cat�gorie</h4>
                        </div>
                    </div>
                <%
                    String message = (String) session.getAttribute("message");
                    if (message == "add success" ) {
                        session.removeAttribute("message");
                %>
                <div class="alert alert-success" id="success">Category added successfully.</div>
                <%
                    }
                %>
                <%
                    if (message =="delete success") {
                        session.removeAttribute("message");
                %>
                <div class="alert alert-success" id="success">Category deleted successfully.</div>
                <%
                    }
                    else if (message =="delete fail") {
                        session.removeAttribute("message");

                %>
               <div class="alert alert-danger" id="success">Category not deleted.</div>
               <%
                    }
                    
                %>
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-info">
                            <div class="panel-heading">Ajouter Cat�gorie</div>
                            <div class="panel-body">
                                <form role="form" action="AddCaregories" method="post"
                                      >
                                    <div class="form-group">
                                        <label>Nom</label> <input class="form-control" type="text" name="cname" required />
                                    </div>
                                    
                                    <button type="submit" class="btn btn-success" onclick="return confirm('Are you sure Do you want to add this category?');">Ajouter</button>
                                    <button type="reset" class="btn btn-danger">Reset</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                 <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="panel panel-success">
                                <div class="panel-heading">Cat�gories</div>
                                <div class="panel-body">
                                    <div class="table-responsive">
                                        
                                                <table class="table table-striped table-bordered table-hover">
	                                            <thead>
	                                                <tr>
	                                                    <th>#</th>
	                                                    <th>Nom</th>
	                                                    <th>Action</th>
	                                                </tr>
	                                            </thead>
	                                            <tbody>
                                                    <tr>
		                                            <%
				                                            ResultSet resultcats = DatabaseConnection.getResultFromSqlQuery("select * from categories_tab ");
				                                            while (resultcats.next()) {
				                                             
				                                           %> 
		                                              
		                                                <td><%=resultcats.getString(1)%></td>
		                                                <td><%=resultcats.getString(2)%></td>
		                                                <td><a href="admin-delete-category.jsp?catId=<%=resultcats.getInt(1)%>"><button class="btn btn-danger" onClick="return confirm('Are you sure you want to delete this category ?');">Supprimer</button></a></td>
		                                          </tr>
                                               </tbody>      
		                                                <%
					                                          } 
				                                        %>
				                               
				                                </table>
				                                
				                                        
                                                
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
            <script src="assets/js/jquery-1.10.2.js"></script>
            <script src="assets/js/bootstrap.js"></script>
            <script src="assets/js/custom.js"></script>
        <%
            } else {
                response.sendRedirect("admin-login.jsp");
            }
        %>
    </body>
</html>