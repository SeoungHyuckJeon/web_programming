<%@ page contentType="text/html;charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
    <%
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String birthday = request.getParameter("birthday");
        String medicine = request.getParameter("medicine");
    %>
<html>
<head><title>환자 정보</title></head>
<body>
    <h2>환자 정보</h2>
    이름: <% out.println(name); %> <br><br>
    전화: <% out.println(phone); %> <br><br>
    생일: <% out.println(birthday); %> <br><br>
    약 복용 여부: <% out.println(medicine); %> <br><br>
</body>
</html>