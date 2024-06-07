<%@ page import="model.ReplyDTO" %>
<%@ page import="model.UserDTO" %>
<%@ page import="model.BoardDTO" %>
<%@ page import="connector.MySqlConnector" %>
<%@ page import="controller.BoardController" %>
<%@ page import="controller.ReplyController" %><%--
  Created by IntelliJ IDEA.
  User: BIT
  Date: 2024-06-07
  Time: 오후 4:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>reply</title>
</head>
<body>
<%
   MySqlConnector connector = new MySqlConnector();
   ReplyController replyController = new ReplyController(connector);


   UserDTO logIn = (UserDTO) session.getAttribute("logIn");
   int writerId = logIn.getId();
   String nickname = logIn.getNickname();

   int boardId = (int) session.getAttribute("boardId");
   String content = request.getParameter("content");

   ReplyDTO attempt = new ReplyDTO();
   attempt.setWriterId(writerId);
   attempt.setBoardId(boardId);
   attempt.setNickname(nickname);
   attempt.setContent(content);

   boolean result = replyController.insert(attempt);


   if(result) {
      response.sendRedirect("/board/showOne.jsp?id="+ boardId);
   } else {
      response.sendRedirect("/error/showError");
   }


%>
</body>
</html>
