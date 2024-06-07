<%@ page import="connector.MySqlConnector" %>
<%@ page import="controller.BoardController" %>
<%@ page import="model.BoardDTO" %>
<%@ page import="model.UserDTO" %>
<%@ page import="model.ReplyDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="controller.ReplyController" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>showOne</title>
</head>
<body>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    session.setAttribute("boardId", id);
    MySqlConnector connector = new MySqlConnector();
    BoardController boardController = new BoardController(connector);
    BoardDTO boardDTO = boardController.selectOne(id);
    UserDTO logIn = (UserDTO) session.getAttribute("logIn");

    if (boardDTO != null) {

%>
<h1>제목: <%=boardDTO.getTitle()%>
</h1>
<h2>글번호: <%=boardDTO.getId()%>
</h2>
<h2>작성자: <%=boardDTO.getNickname()%>
</h2>
<h2>작성일: <%=boardDTO.getEntryDate()%>
</h2>
<h2>수정일: <%=boardDTO.getModifyDate()%>
</h2>
<hr>
<h3><%=boardDTO.getContent()%>
</h3>
<%
    }
%>
<hr/>


<a href="/board/update.jsp">수정하기</a>
<a href="/board/delete.jsp">삭제하기</a> <br/> <br/> <br/>


<form action="/board/reply.jsp" method="post">
    댓글달기: <input type="text" name="content">
    <input type="submit" value="작성">
</form>
<br/>
<p>댓글</p>
<hr/>

<%
    ReplyController replyController = new ReplyController(connector);
    List<ReplyDTO> list = replyController.selectAll(id);
    if (list != null) {
        for (ReplyDTO r : list) {
            if (logIn.getId() == r.getWriterId()) {
%>
<%=r.getContent()%> - <%=r.getNickname()%> &nbsp;&nbsp;<%=r.getModifyDate()%> <a
        href="/reply/update.jsp?id=<%=r.getId()%>"> 수정하기</a>
<br>
<% } else {
%>
<%=r.getContent()%> - <%=r.getNickname()%> &nbsp;&nbsp;<%=r.getModifyDate()%> <br>
<%
        }
    }
} else {
%>
<h3>아직 등록된 댓글이 없습니다.</h3>
<%
    }
%>


</body>
</html>
