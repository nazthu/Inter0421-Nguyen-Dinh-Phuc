package databaseConnectionUtils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnectionUtils {
    private static final String URL = "jdbc:mysql://localhost:3306/furama?characterEncoding=UTF8";
    private static final String USER = "root";
    private static final String PASS = "01249936841";
    public static Connection getConnection(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            return DriverManager.getConnection(URL, USER, PASS);

        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException("Error connecting to the database", e);
        }
    }
}
