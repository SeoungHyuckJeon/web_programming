<%@ page contentType="text/html;charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head><title>연락처</title></head>
<body>
    <h2>연락처</h2>
    전달받은 연락처 정보는 다음과 같습니다. <br>
    <%
    String cname = request.getParameter("cname");
    String email = request.getParameter("email"); 
    %>
    <li> 이름 : <% out.println(cname); %>
    <li> 이메일 : <% out.println(email); %>
</body>
</html>