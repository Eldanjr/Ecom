package com.bassure.ecom.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbCon {

    private static Connection con = null;

    public static Connection getConnection() {
        if (con == null) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://bassure.in:3306/danjr", "danjr", "el007");
                System.out.println("Connected");
            } catch (SQLException ex) {
                ex.printStackTrace();
//                Logger.getLogger(DbCon.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                ex.printStackTrace();
//                Logger.getLogger(DbCon.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return con;
    }
}
