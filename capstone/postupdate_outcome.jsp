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
<%request.setCharacterEncoding("UTF-8");%>
<html>  
<head><title></title></head> 
<body>  
<%
	String dir = application.getRealPath("./capstone/upload"); 
	int max = 5 * 1024 * 1024; // 5MB

	       MultipartRequest m = new MultipartRequest(request, dir, max,
			 "utf-8", new DefaultFileRenamePolicy());
              int check =  Integer.parseInt(m.getParameter("check")); 
              int check2 =  Integer.parseInt(m.getParameter("check2")); 
              int check3 =  Integer.parseInt(m.getParameter("check3")); 
              int check4 =  Integer.parseInt(m.getParameter("check4")); 
               
              if(check==1) { %>
                     <sql:update dataSource="jdbc/mydb" var="deleteTable">
                            UPDATE outcome SET thumbnail=NULL where no = <%=no%>;
                     </sql:update>  
 <%           }  
              if(check2==1) { %>
                     <sql:update dataSource="jdbc/mydb" var="deleteTable">
                            UPDATE outcome SET file1=NULL where no = <%=no%>;
                     </sql:update>  
 <%           }
              if(check3==1) { %>
                     <sql:update dataSource="jdbc/mydb" var="deleteTable">
                            UPDATE outcome SET file2=NULL where no = <%=no%>;
                     </sql:update>  
 <%           }
              if(check4==1) { %>
                     <sql:update dataSource="jdbc/mydb" var="deleteTable">
                            UPDATE outcome SET file3=NULL where no = <%=no%>;
                     </sql:update>  
 <%           }

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
	              UPDATE outcome SET department=?, teamname=?, advisor=?, title=?, content=? where no = ?;
	          	       <sql:param value="<%=major%>" />
                            <sql:param value="<%=teamname%>" />
                            <sql:param value="<%=professor%>" />
                            <sql:param value="<%=title%>" />
                            <sql:param value="<%=content%>" />
                            <sql:param value="<%=no%>" />
              </sql:update>

<%            if(file1 != null) { %>
                     <sql:update dataSource="jdbc/mydb" var="updatedTable">
                            UPDATE outcome SET thumbnail=? where no = ?;
                                   <sql:param value="<%=file1%>" />
                                   <sql:param value="<%=no%>" />
                     </sql:update>                  
<%            } 
              if(file2 != null) { %>
                     <sql:update dataSource="jdbc/mydb" var="updatedTable">
                            UPDATE outcome SET file1=? where no = ?;
                                   <sql:param value="<%=file2%>" />
                                   <sql:param value="<%=no%>" />
                     </sql:update> 
<%            } if(file3 != null) { %>
                     <sql:update dataSource="jdbc/mydb" var="updatedTable">
                            UPDATE outcome SET file2=? where no = ?;
                                   <sql:param value="<%=file3%>" />
                                   <sql:param value="<%=no%>" />
                     </sql:update> 
<%            } if(file4 != null) { %>
                     <sql:update dataSource="jdbc/mydb" var="updatedTable">
                            UPDATE outcome SET file3=? where no = ?;
                                   <sql:param value="<%=file4%>" />
                                   <sql:param value="<%=no%>" />
                     </sql:update> 
<%	}  
       pageContext.forward("./outcome.jsp");
 %>   
</body>  
</html>
