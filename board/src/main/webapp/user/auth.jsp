<%@ page import="model.UserDTO" %>
<%@ page import="controller.UserController" %>
<%@ page import="connector.MySqlConnector" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>auth</title>
</head>
<body>
<%
    // resources에는 정적인 파일 자바 안에는 자바파일이 들어가야함
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    UserDTO userDTO= new UserDTO();
    userDTO.setUsername(username);
    userDTO.setPassword(password);

    MySqlConnector connector = new MySqlConnector();
    UserController userContrioller=new UserController(connector);

    UserDTO result = userContrioller.auth(userDTO);

    if (result != null) {
        // 로그인 성공
        // 현재 로그인을 성공한 정보를 어디서든 불러올 수 있는 곳에 저장한다.
        session.setAttribute("logIn",result);
        // 게시판으로 이동한다.
        // 우리가 특정 JSP 페이지에서 다른 페이지로 강제로 이동시킬 때에는
        // response.sendRedirect("위치") 를 사용하게된다.
        // 단, sendRedirect 이후에는 다른 sendRedirect()를 실행시킬 수 없다.
        response.sendRedirect("/board/showList.jsp");
    } else {
        // 로그인 실패
        // 인덱스 화면으로 이동한다.
        response.sendRedirect("/");     // 위치가 생략 되면 가장 바깥의 파일 그게 지금은 이위치이다 /index.jsp
    }
%>


</body>
</html>
