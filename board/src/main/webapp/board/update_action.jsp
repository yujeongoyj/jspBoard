<%@ page import="controller.UserController" %>
<%@ page import="model.UserDTO" %>
<%@ page import="model.BoardDTO" %>
<%@ page import="connector.MySqlConnector" %>
<%@ page import="controller.BoardController" %><%--
  Created by IntelliJ IDEA.
  User: BIT
  Date: 2024-06-07
  Time: 오후 12:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>update_action</title>
</head>
<body>
<%

    int boardID = (int) session.getAttribute("boardId");
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    BoardDTO attempt = new BoardDTO();
    attempt.setId(boardID);
    attempt.setTitle(title);
    attempt.setContent(content);


    MySqlConnector connector = new MySqlConnector();
    BoardController boardController = new BoardController(connector);

    boolean result = boardController.update(attempt);
    if (result) {

        response.sendRedirect("/board/showList.jsp");
    } else {
%>
<h1>수정 실패 ㅋ</h1>
<%
    }
%>


</body>
</html>
