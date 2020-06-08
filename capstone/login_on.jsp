<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%request.setCharacterEncoding("UTF-8");%>

<sql:query var="rs" dataSource="jdbc/mydb">
    select name,admin from user where id=? and password=?
    <sql:param value="${ param.userid }" />
    <sql:param value="${ param.passwd }" />
</sql:query>

<c:forEach var="row" items="${rs.rows}">
    <c:set var="name" scope="session">${row.name}</c:set>
    <c:set var="admin" scope="session">${row.admin}</c:set>
</c:forEach>

<html>
<head><title>사용자 로그인</title></head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String id= request.getParameter("userid");
%>
<c:choose>
    <c:when test="${name == null}">
        <%out.println("<script>alert('아이디 혹은 비밀번호가 다릅니다.'); location.href='./login.jsp';</script>");%>
    </c:when>
<c:otherwise>
    <%
        
        session.setAttribute("sessionid", id);
        response.sendRedirect("./introduce.jsp");
    %>
</c:otherwise>
</c:choose>

</body>
</html>