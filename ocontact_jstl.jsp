<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head><title>연락처</title></head>
<body>
    <h2>연락처</h2>
    전달받은 연락처 정보는 다음과 같습니다. <br>
    <li> 이름 : <c:out value="${param.cname}"/>
    <li> 이메일 : <c:out value="${param.email}"/>
</body>
</html>