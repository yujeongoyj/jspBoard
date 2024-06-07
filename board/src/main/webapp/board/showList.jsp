<%@ page import="connector.MySqlConnector" %>
<%@ page import="controller.BoardController" %>
<%@ page import="java.lang.reflect.Array" %>
<%@ page import="model.BoardDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시글 목록보기</title>
</head>
<body>
<%
    MySqlConnector connector = new MySqlConnector();
    BoardController boardController = new BoardController(connector);
    ArrayList<BoardDTO> list = boardController.selectAll();
%>
<table  border= 1px solid black>
    <tr>
        <td>글 번호</td>
        <td>제목</td>
        <td>작성자</td>
        <td>최종수정일</td>
    </tr>
    <%
        for (BoardDTO b : list) {

    %>
    <tr>
        <td><%=b.getId()%>
        </td>
        <td><a href="/board/showOne.jsp?id=<%=b.getId()%>"><%=b.getTitle()%>
        </a>
        </td>
        <td><%=b.getNickname()%>
        </td>
        <td><%=b.getModifyDate()%>
        </td>
        <td>
            <a href="/board/update.jsp">수정하기</a>
        </td>
    </tr>
    <%
        }
    %>
</table>
<br/>
<a href="writeForm.jsp">글쓰기</a>
</body>
</html>
