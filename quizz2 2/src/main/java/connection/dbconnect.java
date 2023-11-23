package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class dbconnect {
    private final String url = "jdbc:postgresql://localhost/petdb";
    private final String user = "postgres";
    private final String password = "Dhiren20";

    public Connection getConnection() throws SQLException, ClassNotFoundException {
    	Class.forName("org.postgresql.Driver");
        return DriverManager.getConnection(url, user, password);
    }
}
