<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>환자 정보</title></head>
<body>
    <h2>환자 정보</h2>
    <form method='post' action='opatient.jsp'>
        이름: <input type="name" name="name" required> <br><br>
        전화번호: <input type="tel" name="phone" required> <br><br>
        생일: <input type="date" name="birthday" required> <br><br>
        약 복용 여부(무슨 약을 먹고 있는지 적어주세요.): <input type="text" name="medicine"> <br><br>

        <br><br>
        <input type='reset'     value='초기화'>
        <input type='submit'    value='등록''>
    </form>
</body>
</html>