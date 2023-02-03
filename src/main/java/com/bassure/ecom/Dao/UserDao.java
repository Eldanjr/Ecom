package com.bassure.ecom.Dao;

import com.bassure.ecom.model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDao {

    private Connection con;
    private String query;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public UserDao(Connection con) {
        this.con = con;
    }

    public User userLogin(String email, String password) {
        User user = null;
        try {
            query = "SELECT * FROM eusers WHERE email=? AND password=?";
            pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName("name");
                user.setEmail(email);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
}

