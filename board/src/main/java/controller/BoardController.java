package controller;

import connector.MySqlConnector;
import model.BoardDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class BoardController {
    private Connection connection;

    public BoardController(MySqlConnector connector) {
        connection = connector.makeConnection();
    }

    public void insert(BoardDTO attempt) {

        String query = "INSERT INTO board(writerId, title, content) VALUES (?,?,?) ";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, attempt.getWriterId());
            preparedStatement.setString(2, attempt.getTitle());
            preparedStatement.setString(3, attempt.getContent());

            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}

