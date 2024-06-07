package controller;

import connector.MySqlConnector;
import model.ReplyDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ReplyController {

    private Connection connection;

    public ReplyController(MySqlConnector connector) {
        connection = connector.makeConnection();
    }

    public List<ReplyDTO> selectAll(int boardId) {
        List<ReplyDTO> list = new ArrayList<>();
        String query = "SELECT * FROM reply INNER JOIN user ON reply.writer_id=user.id WHERE board_id=?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, boardId);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                ReplyDTO replyDTO = new ReplyDTO();
                replyDTO.setId(resultSet.getInt("id"));
                replyDTO.setContent(resultSet.getString("content"));
                replyDTO.setEntryDate(resultSet.getTimestamp("entry_date"));
                replyDTO.setModifyDate(resultSet.getTimestamp("modify_date"));
                replyDTO.setWriterId(resultSet.getInt("writer_id"));
                replyDTO.setBoardId(resultSet.getInt("board_id"));
                replyDTO.setNickname(resultSet.getString("nickname"));

                list.add(replyDTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }


    public boolean insert(ReplyDTO replyDTO) {
        String query = "INSERT INTO reply(writer_id,board_id,content) VALUES(?, ?, ?) ";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, replyDTO.getWriterId());
            preparedStatement.setInt(2, replyDTO.getBoardId());
            preparedStatement.setString(3, replyDTO.getContent());

            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

}
