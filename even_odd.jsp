<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>홀수 짝수</title></head>
<body>
<%
    int a=10;

    if(a%2==0) {
        out.println("a는 짝수 입니다.");
    }
    else {
        out.println("a는 홀수 입니다.");
    }
%>
</body>
</html>