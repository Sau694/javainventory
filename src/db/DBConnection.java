package db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConnection() {
        Connection con = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/inventory_db",
                "root",
                "root123"
            );

            System.out.println("DB CONNECTED ✔");

        } catch (Exception e) {
            System.out.println("DB FAILED ❌");
            e.printStackTrace();
        }

        return con;
    }
}