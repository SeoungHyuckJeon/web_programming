<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>sum</title></head>
<body>
1부터 99까지의 합
<%
    int i=1, sum=0;

    while(i<100) {
        sum=sum+i;
        i++;
    }

    out.println("<br>" + sum);
%>
</body>
</html>