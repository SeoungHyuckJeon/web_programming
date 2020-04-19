<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<fmt:requestEncoding value="UTF-8"/>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head><title>로그인</title></head>
<body>
    <h2>사용자 로그인 정보</h2>
    사용자ID : <c:out value="${param.id}"/> <br><br>
    암호 : <c:out value="${param.pass}"/> <br><br>
</body>
</html>