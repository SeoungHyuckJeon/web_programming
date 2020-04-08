<%@ page contentType="text/html;charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
  String title = request.getParameter("title");
  String category = request.getParameter("category");
  String disease = request.getParameter("disease");
  String project = request.getParameter("project");
%>
<html>
  <head><title>질문 내용</title></head>
  <body>
    <h2>질문 내용</h2>
    <h3> <% out.println('('+category+') '+title); %></h3>
    <i>
      <%
        out.println("최근 7일 내에 앓은 질환: ");
        out.println(disease);
      %><br><br>
      <%
        out.println(project);
      %>
    </i>
  </body>
</html>
