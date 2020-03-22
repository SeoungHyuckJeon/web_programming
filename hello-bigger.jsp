<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>큰 값</title></head>
<body>
더 큰 값은
<%
    int a=5, b=7;
    int max;
    
    if( a > b ) {
        max = a;
    }
    else {
        max = b;
    }

    out.println(max);
%>
</body>
</html>