package com.example.jsp_final;

import java.sql.*;

public class DatabaseManager {

    String url = "localhost:3306";
    String database = "jspDB";
    String id = "root";
    String pq = "root";
    String sql = "select * from t_board";
    Connection connection = null;

    private static DatabaseManager connector = null;

    public static DatabaseManager getInstance() {
        if (connector == null) connector = new DatabaseManager();
        return connector;
    }

    public Connection open() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection("jdbc:mysql://" + url + "/" + database + "?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC&characterEncoding=utf8&useUnicode=true&mysqlEncoding=utf8", id, pq);
        return connection;
    }

    public void close(Connection connection, PreparedStatement preparedStatement, ResultSet resultSet) {
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        if (preparedStatement != null) {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
