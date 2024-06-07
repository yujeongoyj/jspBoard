<%@ page import="controller.BoardController" %>
<%@ page import="connector.MySqlConnector" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>delete</title>
</head>
<body>
<%

    MySqlConnector connector = new MySqlConnector();
    BoardController boardController = new BoardController(connector);

    int boardId = (int) session.getAttribute("boardId");
    boolean result = boardController.delete(boardId);
    if (result) {
        response.sendRedirect("/board/showList.jsp");
    } else {
        response.sendRedirect("/error/showError.jsp?code=duplicated");
    }
%>
</body>
</html>
