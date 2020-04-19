<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head><title>사용자 정보</title></head>
<body>
    <h2>사용자 정보</h2>
    이메일: <c:out value="${param.mail}"/> <br><br>
    전화: <c:out value="${param.phone}"/> <br><br>
    생일: <c:out value="${param.birthday}"/> <br><br>
    홈페이지: <c:out value="${param.home}"/> <br><br>
</body>
</html>