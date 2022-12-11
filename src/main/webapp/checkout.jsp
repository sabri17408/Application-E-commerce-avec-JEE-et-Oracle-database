<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
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
        <script src="jquery-3.2.1.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src='../../../../../../ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js'></script>
        <script src="../../../../../../m.servedby-buysellads.com/monetization.js" type="text/javascript"></script>
    </head>
    <body>
        <%
            //Checking whether customer in session or not
            if (session.getAttribute("name") != null && session.getAttribute("name") != "") {
        %>
    <body>
        
                            <jsp:include page="NewFile1.jsp"></jsp:include>
                            
                    <div class="top_nav_right">
                        
                    </div>
                </div>
            </div>
        </div>

        <div class="page-head">
            <div class="container">
                <h3>Mon panier</h3>
            </div>
        </div>
        <div class="checkout">
            <div class="container">
                
                 <%
                    //int index = 0;
                   // int paymentId = 101;
                    ResultSet rsCountCheck = DatabaseConnection.getResultFromSqlQuery("select count(*) from table(select products from cart_tab where custmer_id='" + session.getAttribute("id") + "')p");
                    rsCountCheck.next();
                    int cartItem = rsCountCheck.getInt(1);
                    System.out.println("cartItem  " + cartItem);
                    if (cartItem > 0) {
                %>
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Produit</th>
                                <th>Quantite</th>
                                   <th>Changer Quantite</th>
                                <th>Prix</th>
                                <th>Total prix</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <%  
                            ResultSet totalProduct = DatabaseConnection.getResultFromSqlQuery("select p.id pid,p.quantity pqt,p.price ppr, p.get_total() total from  table(select products from cart_tab where custmer_id=  '"+  session.getAttribute("id") + "')p ");
                            while (totalProduct.next()) {
                         ResultSet productinfo = DatabaseConnection.getResultFromSqlQuery("select p.image_name imgN ,p.name name from products p where p.id =  '"+ totalProduct.getInt("pid") + "' ");
                              if(productinfo.next())
                        %>
                        
                        <tr class="rem1">
                            <td class="invert"><%=totalProduct.getInt("pid")%></td>
                            <td class="invert"><img
                                    src="uploads/<%= productinfo.getString("imgN")%>" alt=""
                                    class="pro-image-front" style="width: 150px; height: 100px;"><br> <%=productinfo.getString("name")%> </td>
                            <td class="invert"><%=totalProduct.getInt("pqt")%></td>
                            <td class="invert">
                                <div class="quantity">
                                    <div class="quantity-select">
                                        <form action="UpdateProductQuantity" method="post">
                                            <input name="productId" type="text" value="<%=totalProduct.getInt("pid")%>" hidden><input type="number"
                                                   name="quantity" value=" <%=totalProduct.getInt("pqt")%>"
                                                   style="width: 50px; height: 35px;"><input
                                                   type="submit" class="btn btn-danger" value="Change" >
                                        </form>
                                    </div>
                                </div>
                            </td>
                            
                             <td class="invert"><%=totalProduct.getDouble("ppr")%></td>
                            <td class="invert"><%=totalProduct.getDouble("total")%></td>
                             
                        
                                        
                                        
                         <td><a class="invert" href="removeProductFromCart.jsp?productId=<%=totalProduct.getInt("pid")%>"  onclick="return confirm('Are you sure you want to remove this item from cart?');" >
          <img src="images/index/delete.png" width="30" height="30" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="mx-3" role="img" viewBox="0 0 24 24"><title>Search</title><circle cx="10.5" cy="10.5" r="7.5"/><path d="M21 21l-5.2-5.2"/></img>
        </a>
                         </td>
                        </tr>
                         <%
                            }
                            }
                        %>
                        <%
                            double totalorder = 0.0;
                            ResultSet totolAmount = DatabaseConnection.getResultFromSqlQuery("select sum(p.get_total()) total from cart_tab c , table(products) p where c.custmer_id='" + session.getAttribute("id") + "' ");
                            if (totolAmount.next()) {
                                totalorder = totolAmount.getInt(1);
                            }
                        %> 
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td colspan="2"><strong><center>
                                        Total Commande.:&nbsp; <%=totalorder%> 
                                        DHS.</center></strong> 
                            </td>
                        </tr>
                        <script>
                            $('.value-plus').on('click', function () {
                                var divUpd = $(this).parent().find('.value'), newVal = parseInt(divUpd.text(), 10) + 1;
                                divUpd.text(newVal);
                            });

                            $('.value-minus').on('click', function () {
                                var divUpd = $(this).parent().find('.value'), newVal = parseInt(divUpd.text(), 10) - 1;
                                if (newVal >= 1)
                                    divUpd.text(newVal);
                            });
                        </script>
                    </table>
                </div>
                <div>
                    <br> <br> <br>
                </div>
                <div class="container">
                
                <form action="GetProductOrders" method="post" >
                    <h4>
                        <font color="blue"><strong>Mes informations</strong></font>
                    </h4>
                    <br>
                     <%
                        ResultSet userInfoResult = DatabaseConnection.getResultFromSqlQuery("select c.infos.name name, c.infos.phone phone, c.infos.email email, c.infos.adress adr from customer c where c.id='" + session.getAttribute("id") + "' ");
                        if (userInfoResult.next()) {
                    %> 
                    <div>
                        <div class="form-group">
                            <label>Nom</label> <input type="text" name="name"
                                                            value="<%=userInfoResult.getString("name")%>" placeholder=""
                                                            required="" style="width: 1135px; height: 40px;"
                                                            class="form-control" readonly>
                        </div>
                        <div class="form-group">
                            <label>Mobile</label> <input type="text" name="phone"
                                                               value=" <%=userInfoResult.getString("phone")%> " placeholder=""
                                                               required="" style="width: 1135px; height: 40px;"
                                                               class="form-control" >
                        </div>
                        <div class="form-group">
                            <label>Email </label> <input type="text" name="email"
                                                           value="<%=userInfoResult.getString("email")%> " placeholder=""
                                                           required="" style="width: 1135px; height: 40px;"
                                                           class="form-control" readonly>
                        </div>
                        <div class="form-group">
                            <label>Adresse</label> <input type="text" name="address"
                                                          value=" <%=userInfoResult.getString("adr")%>" placeholder=""
                                                          required="" style="width: 1135px; height: 100px;"
                                                          class="form-control" >
                        </div>
                        <input name="order_total" type="text" value="<%=totalorder%>" hidden>
                       
                    <input type="submit" value="Passer la commande" class="btn btn-success" onclick="return confirm('Are you sure Do you want to buy this order?');">
                     
                    </div>
                </form>
                            </div>
                
-                 <%
                    }
                %>

                
                <center>
                    <strong>Merci pour votre confiance.</strong>
                </center>
               <%--  <%
                    if (index == 0) {
                %> --%>
               
                <%-- <%
                    }
                %>
                <%
                    }
                %> --%>
                <div class="checkout-left">
                    <div class="checkout-right-basket animated wow slideInRight" data-wow-delay=".5s">
                        <a href="IndexPrincipale.jsp"><span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>Continuer mes achats</a>
                    </div>
                </div>
            </div>
        </div>
        <%-- <jsp:include page="footer.jsp"></jsp:include> --%>
         <%
            } else {
                response.sendRedirect("IndexPrincipale.jsp");
            }
        %> 
    </body>
</html>