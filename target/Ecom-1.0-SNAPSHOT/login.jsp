
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.bassure.ecom.model.*" %>
<%@page import="com.bassure.ecom.connection.DbCon" %>

<% 
    User auth = (User) request.getSession().getAttribute("auth");
    if(auth!=null){
    response.sendRedirect("index.jsp"); 
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ecom login page</title>
        <%@include file="include/header.jsp" %>
    </head>
    <style>
        body{
            /*background-color: black;*/
            background: rgb(76,161,175);
            background: linear-gradient(90deg, rgba(76,161,175,1) 0%, rgba(17,106,176,1) 35%, rgba(196,224,229,1) 100%);
            /*background-image: url("product-images/wallpaperflare.com_wallpaper (2).jpg");*/
        }
        .top{
            color: #116ab0;
            margin-top:12rem;
            
        }
    </style>
    <body>
        <%@include file="include/navbar.jsp" %>
        <div class="container">
            <!--<img class="w-100    h-100"src="./product-images/wallpaperflare.com_wallpaper (2).jpg" alt="library image"/>-->

            <div class="card w-50 mx-auto top">
                <div class="card-header text-center ">
                    Member Login
                </div>
                <div class="card-body">
                    <form action="user-login" method="post">
                        <div class="form-group">
                            <label>Email Address</label>
                            <input type="email" class="form-control" name="login-email" placeholder="Enter Your Email" required> 
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="Password" class="form-control" name="login-password" placeholder="**********" required> 
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Login</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <%@include file="include/footer.jsp" %>
    </body>

</html>