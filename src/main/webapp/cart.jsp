<%@page import="com.bassure.ecom.model.*" %>
<%@page import="com.bassure.ecom.Dao.*" %>
<%@page import="java.util.*" %>
<%@page import="com.bassure.ecom.connection.DbCon" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    User auth = (User) request.getSession().getAttribute("auth");
    if(auth!=null){
    request.setAttribute("auth", auth);
    }
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    List<Cart> cartProduct = null;
  
    if(cart_list != null){
    ProductDao pDao = new ProductDao(DbCon.getConnection());
    cartProduct = pDao.getCartProducts(cart_list);       
    request.setAttribute("cart_list", cart_list);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>shopping cart</title>
        <%@include file="include/header.jsp" %>
        <style type="text/css">
            table tbody td{
                vertical-align: middle;
            }
            .btn-incre, .btn-decre{
                box-shadow: none;
                font-size: 25px;
            }
            
        </style>
    </head>
    <body> 
        <%@include file="include/navbar.jsp" %>


        <div class="container">
            <div class="d-flex py-3"> 
                <h3>Total price: $453</h3> 
                <a class="mx-3 btn btn-primary" href="#"> Check Out</a>
            </div>
            <table  class="table table-light">
                <thead>
                    <tr>
                        <th scope="col">Name</th>
                        <th scope="col">Category</th>
                        <th scope="col">Price</th>
                        <th scope="col">Buy now</th>
                        <th scope="col">cancel</th>
                    </tr>
                </thead>
                <tbody>
                    <% if(cart_list != null){ %>
                    <% for(Cart c: cartProduct){%>
                    <tr>
                        <td><%= c.getName()%></td>
                        <td><%= c.getCategory()%></td>
                        <td><%= c.getPrice()%></td>
                        <td>
                            <form action="" method="post" class="form-inline">
                                <input type="hidden" name="id" value="<%= c.getId()%>" class="form-input"> 
                                <div class="form-group d-flex justify-content-between">
                                    <a class="btn btn-sm btn-incre" href=""><i class="fas fa-minus-square"></i></a>
                                    <input type="text" name="quantity" class="form-control" value="1" readonly>
                                    <a class="btn btn-sm btn-decre" href=" "><i class="fas fa-plus-square"></i></a>
                                </div>
                            </form>
                        </td>
                        <td><a class="btn btn-danger btn-sm text-white"> Remove  </a></td>
                    </tr>
                    <% }%>
                    <%}%>
                </tbody>
            </table>

        </div>

        <%@include file="include/footer.jsp" %>
    </body>

</html>