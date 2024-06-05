<%@ page import="model.UserDTO" %>
<%@ page import="connector.MySqlConnector" %>
<%@ page import="controller.UserController" %><%--
  Created by IntelliJ IDEA.
  User: BIT
  Date: 2024-06-05
  Time: 오후 4:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>register_action</title>
</head>
<body>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String nickname = request.getParameter("nickname");

    UserDTO attempt = new UserDTO();
    attempt.setUsername(username);
    attempt.setPassword(password);
    attempt.setNickname(nickname);

    MySqlConnector connector = new MySqlConnector();
    UserController userController = new UserController(connector);

%>

</body>
</html>
