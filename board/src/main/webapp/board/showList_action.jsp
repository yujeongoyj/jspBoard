<%@ page import="model.BoardDTO" %>
<%@ page import="connector.MySqlConnector" %>
<%@ page import="controller.BoardController" %>
<%@ page import="model.UserDTO" %>
<%@ page import="controller.UserController" %>
<%@ page import="com.mysql.cj.Session" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>showList_action</title>
</head>
<body>
<%
    UserDTO logIn = (UserDTO) session.getAttribute("logIn");
    int writerID = logIn.getId();
    String title = request.getParameter("title");
    String content = request.getParameter("content");



    BoardDTO attempt = new BoardDTO();
    attempt.setWriterId(writerID);
    attempt.setTitle(title);
    attempt.setContent(content);


    MySqlConnector connector = new MySqlConnector();
    BoardController boardController = new BoardController(connector);

    boardController.insert(attempt);


%>
</body>
</html>
