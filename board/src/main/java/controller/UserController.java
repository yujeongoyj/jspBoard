package controller;

import com.mysql.cj.protocol.Resultset;
import connector.MySqlConnector;
import model.UserDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserController {
    private Connection connection;

    public UserController(MySqlConnector connector) {
        connection = connector.makeConnection();
    }

    public UserDTO auth(UserDTO userDTO) {
        UserDTO result= null;
        String query = "SELECT * FROM user WHERE username = ? AND password =? ";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, userDTO.getUsername());
            preparedStatement.setString(2, userDTO.getPassword());

            ResultSet resultset = preparedStatement.executeQuery();

            if(resultset.next()){
                result = new UserDTO();

                result.setId(resultset.getInt("id"));
                result.setUsername(resultset.getString("username"));
                result.setPassword(resultset.getString("password"));
                result.setNickname(resultset.getString("nickname"));

            }

        }catch (SQLException e){
            e.printStackTrace();
        }


        return result;

    }

    public boolean register(UserDTO userDTO){

        String query = "INSERT INTO user (username, password, nickname) VALUES(?,?,?)";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, userDTO.getUsername());
            preparedStatement.setString(2, userDTO.getPassword());
            preparedStatement.setString(3, userDTO.getNickname());

            preparedStatement.executeUpdate();

            return true;

        } catch (SQLException e){
            e.printStackTrace();
            return false;
        }

    }
}
