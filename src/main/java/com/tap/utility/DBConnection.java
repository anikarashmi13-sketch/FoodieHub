package com.tap.utility;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static Connection con;

    public static Connection getConnection() {

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/sweet_app",
                    "root",
                    "anika");

        } catch (Exception e) {

            e.printStackTrace();
        }

        return con;
    }
}