package com.bassure.ecom.servlet;

import com.bassure.ecom.Dao.UserDao;
import com.bassure.ecom.connection.DbCon;
import com.bassure.ecom.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/user-login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/hmtl;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            //grabbing the data from form through submit 
            String email = request.getParameter("login-email");
            String password = request.getParameter("login-password");
            
            try {
                UserDao udao = new UserDao(DbCon.getConnection());

                User user = udao.userLogin(email, password);

                if (user != null) {
                    request.getSession().setAttribute("auth", user);
                    response.sendRedirect("index.jsp");
                } else {
                    out.print("user login failed");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
