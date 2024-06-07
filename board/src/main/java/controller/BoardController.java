package controller;

import connector.MySqlConnector;
import model.BoardDTO;
import model.ReplyDTO;

import javax.xml.transform.Result;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardController {
    private Connection connection;

    public BoardController(MySqlConnector connector) {
        connection = connector.makeConnection();
    }

    public ArrayList<BoardDTO> selectAll() {
        ArrayList<BoardDTO> list = new ArrayList<>();

        String query = "SELECT * FROM board INNER JOIN user ON board.writer_id = user.id";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                BoardDTO boardDTO = new BoardDTO();
                boardDTO.setId(resultSet.getInt("id"));
                boardDTO.setTitle(resultSet.getString("title"));
                boardDTO.setContent(resultSet.getString("content"));
                boardDTO.setEntryDate(resultSet.getTimestamp("entry_date"));
                boardDTO.setModifyDate(resultSet.getTimestamp("modify_date"));
                boardDTO.setNickname(resultSet.getString("nickname"));

                list.add(boardDTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }


    public BoardDTO selectOne(int id) {
        String query = "SELECT * FROM board INNER JOIN user ON board.writer_id = user.id WHERE board.id =?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);

            ResultSet resultset = preparedStatement.executeQuery();
            while (resultset.next()) {
                BoardDTO boardDTO = new BoardDTO();
                boardDTO.setId(resultset.getInt("board.id"));
                boardDTO.setTitle(resultset.getString("title"));
                boardDTO.setContent(resultset.getString("content"));
                boardDTO.setEntryDate(resultset.getTimestamp("entry_date"));
                boardDTO.setModifyDate(resultset.getTimestamp("modify_date"));
                boardDTO.setWriterId(resultset.getInt("writer_id"));
                boardDTO.setNickname(resultset.getString("nickname"));

                return boardDTO;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }


    public boolean insert(BoardDTO attempt) {

        String query = "INSERT INTO board (writer_id, title, content) VALUES (?,?,?) ";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, attempt.getWriterId());
            preparedStatement.setString(2, attempt.getTitle());
            preparedStatement.setString(3, attempt.getContent());

            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }


    public boolean update(BoardDTO boardDTO) {
        String query = "UPDATE board SET title=?, content=?, modify_date=NOW() WHERE id =?";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);

            preparedStatement.setString(1, boardDTO.getTitle());
            preparedStatement.setString(2, boardDTO.getContent());
            preparedStatement.setInt(3, boardDTO.getId());

            preparedStatement.executeUpdate();


        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean delete(int id) {
        String query = "DELETE FROM board WHERE id = ?";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);

            preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean reply(ReplyDTO attempt) {
        String query = "INSERT INTO reply (id ,nickname, content) VALUES(?,?,?) ";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, attempt.getId());
            preparedStatement.setString(2, attempt.getNickname());
            preparedStatement.setString(3,attempt.getContent());
        }catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;

    }
}

