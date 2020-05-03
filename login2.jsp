<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String id = request.getParameter("id");
    Cookie cookieid = new Cookie("id",id);
    response.addCookie(cookieid);

    String pass = request.getParameter("pass");
    Cookie cookiepass = new Cookie("pass",pass);
    response.addCookie(cookiepass);    
%>

<html>
    <head><title>로그인</title></head>
    <body>
        <h2>로그인 정보</h2>
            사용자 ID: ${param['id']} <br><br>
            암호: ${param['id']} <br><br>
    </body>
</html>