/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.bassure.ecom.servlet;

import com.mysql.cj.jdbc.interceptors.SessionAssociationInterceptor;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 *
 * @author bas200134
 */
@WebServlet("/log-out")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try (PrintWriter out = response.getWriter()) {
            if (request.getSession().getAttribute("auth") != null) {
                request.getSession().removeAttribute("auth");
                response.sendRedirect("login.jsp");
            } 
            else {
                response.sendRedirect("index.jsp");
            }
            
        } catch (Exception e) {
            
            e.printStackTrace();
        }
    }

}
