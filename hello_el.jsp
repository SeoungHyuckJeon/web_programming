<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head><title>EL 테스트</title></head>
    <body>
        <h3 align=center>EL 테스트</h3>
        <p>수식 계산하기
        <li> \${ 2 + 5 } = ${ 2 + 5 }
        <li> \${ 2 / 5 } = ${ 2 / 5 }
        <li> \${ 2 < 5 } = ${ 2 < 5 }

        <p>헤더 정보 얻기
        <li> 웹 브라우저 : ${ header["user-agent"] }
        <li> 사용자 컴퓨터 : ${ header["host"] }

        <p>request 정보 얻기
        <li> HTTP 메소드 : ${ pageContext.request.method }

        <p>파라메터 값 얻기
        <li> name 파라메터 : ${ param["name"] }
        <li> name 파라메터 값이 공백? : ${ empty param["name"] }

        <p>쿠키 값 얻기
        <li> 세션 ID : ${ cookie["JSESSIONID"].value }
    </body>
</html>
