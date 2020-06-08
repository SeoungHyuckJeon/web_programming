<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%request.setCharacterEncoding("UTF-8");%>
<%session.invalidate();%>


<sql:query var="rs" dataSource="jdbc/mydb">
  select name from user where id=?
  <sql:param value="${ param.userid }" />
</sql:query>

<c:forEach var="row" items="${rs.rows}">
    <c:set var="name" value="${row.name}"/>
</c:forEach>

<html>
<head>
<title>아이디 중복체크</title>
</head>
<body>
  <c:choose>
    <c:when test="${name == null}">
      <%
        response.sendRedirect("./idcheck1.jsp");
      %>
    </c:when>
<c:otherwise>
  <%
    response.sendRedirect("./idcheck2.jsp");
  %>
</c:otherwise>
</c:choose>

</body>
</html>