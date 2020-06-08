<%@ page contentType="text/html;charset=UTF-8" %>
<%
    session.invalidate();
%>

<html>
    <head><title>로그아웃</title></head>
    <body>
        <%
            response.sendRedirect("./introduce.jsp");
        %>
    </body>
</html>