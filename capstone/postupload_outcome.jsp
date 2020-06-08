<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="errorpage.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%request.setCharacterEncoding("UTF-8");%>
<html>  
<head><title></title></head> 
<body>  
<%
	String dir = application.getRealPath("./capstone/upload"); 
	int max = 5 * 1024 * 1024; // 5MB

	       MultipartRequest m = new MultipartRequest(request, dir, max,
			 "utf-8", new DefaultFileRenamePolicy());

              String major = m.getParameter("major"); 
              String teamname = m.getParameter("teamname"); 
              String professor = m.getParameter("professor");         
              String title = m.getParameter("title");        
  		String content = m.getParameter("editordata"); 

		String file1 = m.getFilesystemName("f1");
		String ofile1 = m.getOriginalFileName("f1");
		String file2 = m.getFilesystemName("f2");
		String ofile2 = m.getOriginalFileName("f2");
              String file3 = m.getFilesystemName("f3");
		String ofile3 = m.getOriginalFileName("f3");
              String file4 = m.getFilesystemName("f4");
		String ofile4 = m.getOriginalFileName("f4");
%>   
              <sql:update dataSource="jdbc/mydb" var="updatedTable">
	              INSERT INTO outcome (department, teamname, advisor, title, postdate, views, content, thumbnail, file1, file2, file3, userid) 
                            VALUES (?,?,?,?,now(),0,?,?,?,?,?,?);
	          	       <sql:param value="<%=major%>" />
                            <sql:param value="<%=teamname%>" />
                            <sql:param value="<%=professor%>" />
                            <sql:param value="<%=title%>" />
                            <sql:param value="<%=content%>" />
                            <sql:param value="<%=file1%>" />
                            <sql:param value="<%=file2%>" />
                            <sql:param value="<%=file3%>" />
                            <sql:param value="<%=file4%>" />
                            <sql:param value="${sessionid}" />
              </sql:update>
<%           
       pageContext.forward("./outcome.jsp");
%>   
</body>  
</html>