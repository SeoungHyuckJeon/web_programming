<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%request.setCharacterEncoding("UTF-8");%>

<html>
    <head>

    </head>
    <body>
        
        <c:catch var="exception">
            <sql:update dataSource="jdbc/mydb" var="updatedTable">
            INSERT INTO user (admin, id, name, password, email, zipcode, address, phone) VALUES (0, ?, ?, ?, ?, ?, ?, ?)
            <sql:param value="${ param.userid }" />
            <sql:param value="${ param.name }" />
            <sql:param value="${ param.passwd }" />
            <sql:param value="${ param.email }" />
            <sql:param value="${ param.rcvr_mail_no }" />
            <sql:param value="${ param.zip1 }${ param.zip2 }" />
            <sql:param value="${ param.hp1 }-${ param.hp2 }-${ param.hp3 }" />
            </sql:update>
            <c:if test="${updatedTable >= 1}">
                <%
                response.sendRedirect("introduce.jsp");
                %>
            </c:if>
            </c:catch>
    </body>
</html>