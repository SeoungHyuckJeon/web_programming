<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>구구단: 5단</title></head>
<body>
<h3>구구단: 5단</h3>
<%
    int dan=5;
    for(int i=1;i<10;i++) {
        int value = dan * i;
        out.println(dan + " x " + i + " = " + value);
        out.println("<br>");
    }
%>
</body>
</html>