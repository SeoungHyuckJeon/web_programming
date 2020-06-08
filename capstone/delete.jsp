<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="errorpage.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%
    String db = request.getParameter("db");
    String no = request.getParameter("no");
%>
<sql:query var="rs" dataSource="jdbc/mydb">
  select * from <%=db%> where no = <%=no%>;
</sql:query>
<c:forEach var="row" items="${rs.rows}">
      <c:set var="userid" value="${row.userid}" />
</c:forEach>
       <c:choose>           
              <c:when test="${empty sessionid}">
                     <script type="text/javascript">
                            alert('로그인하세요.'); 
                            location.href="./login.jsp";
                     </script>
              </c:when>
              <c:when test="${userid ne sessionid}">
                     <script type="text/javascript">
                            alert('삭제하실 권한이 없습니다.'); 
                            location.href="./post.jsp?db=<%=db%>&no=<%=no%>";
                     </script>
              </c:when>
       </c:choose> 
<html>  
<head>
</head> 
<body>  
       <c:if test="${userid eq sessionid}">
              <sql:update dataSource="jdbc/mydb" var="deleteTable">
	              delete from <%=db%> where no = <%=no%>;
              </sql:update>
              <%       
                     pageContext.forward(db+".jsp");  
              %>
       </c:if>
</body>  
</html>