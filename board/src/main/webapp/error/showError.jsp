<%--
  Created by IntelliJ IDEA.
  User: BIT
  Date: 2024-06-05
  Time: 오후 5:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>!!!  에러 !!!</title>
</head>
<body>
<%
    String errorCode = request.getParameter("code");

    String message ="";

    if(errorCode.equalsIgnoreCase("duplicated")){
        message = "중복된 아이디입니다";
    }
%>
<h1>
    <%=message%>
</h1>
<a href="/user/register.jsp">회원 가입으로 </a>
</body>
</html>
