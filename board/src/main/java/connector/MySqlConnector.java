package connector;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


    public class MySqlConnector {
        private final String URL = "jdbc:mysql://localhost:3306/board";
        private final String USERNAME = "root";
        private final String PASSWORD = "1234";

        public Connection makeConnection(){
/*        Connection connection = null;
        Class.forName("com.mysql.cj.jdbc.Driver");

        return connection;*/

            Connection connection = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

                return connection;
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();

                return null;
            }
        }
    }



