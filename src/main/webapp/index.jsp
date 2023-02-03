<%-- 
    Document   : index
    Created on : 21-Dec-2022, 5:41:57 pm
    Author     : bas200134
--%>
<%@page import="com.bassure.ecom.model.*" %>
<%@page import="com.bassure.ecom.connection.DbCon" %>
<%@page import="com.bassure.ecom.Dao.*" %>
<%@page import="java.util.List" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    User auth = (User) request.getSession().getAttribute("auth");
    if(auth!=null){
    request.setAttribute("auth", auth); 
    }
    ProductDao pd= new ProductDao(DbCon.getConnection());
    List<Product> products = pd.getAllProducts();
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Ecom</title>
        <%@include file="include/header.jsp" %>
    </head>
    <style>
        body{
            background-image: url("./product-images/wallpaperflare.com_wallpaper (2).jpg");
        }
    </style>
    <body>

        <%@include file="include/navbar.jsp" %>
        <div class="container">
            <div class="card-header my-5 bg-warning">  All Products </div>
            <div class="row">
                <%
                if(!products.isEmpty()){
                   for(Product p:products){%>
                <div class="col-md-3 my-3">
                    <div class="card w-100" style="width: 18rem;">
                        <img class="card-img-top" src="./product-images/<%= p.getImage() %>" alt="card image top">
                        <div class="card-body">
                            <h5 class="card-tile"><%= p.getName()%></h5>
                            <h6 class="price">Price $<%= p.getPrice()%></h6>
                            <h6 class="category">Category: <%= p.getCategory()%></h6>
                            <div class="mt-3 d-flex justify-content-between">
                                <a href="add-to-cart?id=<%= p.getId() %>" class="btn btn-dark"> Add to cart </a>
                                <a href="#" class="btn btn-primary"> buy now </a>
                            </div>
                        </div>
                    </div>
                </div>      
                <%}
             }
                %>

            </div>

        </div>
        <%@include  file="include/footer.jsp" %>

    </body>

</html>
