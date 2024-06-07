<%--
  Created by IntelliJ IDEA.
  User: BIT
  Date: 2024-06-07
  Time: 오전 9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<form action ="/board/write_action.jsp" method = post>
    글 제목: <input type="text" name = "title">
    글 내용: <input type="text" name="content">
    <input type="submit" value="글 작성">
</form>
</body>
</html>
