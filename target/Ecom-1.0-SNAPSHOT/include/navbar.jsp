<nav class="navbar navbar-expand-lg navbar-light bg-dark">
    <div class="container">
        <a class="navbar-brand text-info" href="index.jsp">Ecom world</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link text-white" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="cart.jsp">cart</a>
                </li>
                <% if(auth!=null){ %>
                <li class="nav-item">
                    <a class="nav-link text-white" href="orders.jsp">Orders</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="log-out">Logout</a>
                </li>
                <% }else{ %>
                <li class="nav-item">
                    <a class="nav-link text-white" href="login.jsp">Login</a>
                </li>
                <% } %>



            </ul>
        </div>
    </div>
</nav> 
