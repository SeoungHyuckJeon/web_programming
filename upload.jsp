<%@ page contentType="text/html;charset=UTF-8" 
        errorPage="error_upload.jsp"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<% request.setCharacterEncoding("UTF-8"); %>

<html>
    <head><title>파일 업로드</title></head>
    <body>
        <h3>파일 업로드</h3>
        <%
            String dir = application.getRealPath("/upload");
            int max = 5*1024*1024; //5Mb

                MultipartRequest m = new MultipartRequest(request,
                    dir, max, "UTF-8", new DefaultFileRenamePolicy());
                String subject = m.getParameter("subject");
                String file1 = m.getFilesystemName("file1");
                String ofile1 = m.getOriginalFileName("file1");
                String file2 = m.getFilesystemName("file2");
                String ofile2 = m.getOriginalFileName("file2");
        %>

                <p>제목 : <%= subject %>

                <%  if(file1 != null) { %>
                        <p>업로드 파일1 : <a href=/upload/<%= file1%>><%=ofile1%></a>
                <%  }
                    if(file2 != null) { %>
                        <p>업로드 파일2 : <a href=/upload/<%= file2%>><%=ofile2%></a>
                <%  }
        %>
    </body>
</html>
