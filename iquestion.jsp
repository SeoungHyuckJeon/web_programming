<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head><title>질문하기</title></head>
  <body>
    <h2>질문하기</h2>
    <form method="post" action="oquestion.jsp">
      문의 제목 <br>
      <input type="text" name="title" size="50"
        placeholder="제목을 기술해주세요"
        required>
      <br><br>

      문의 종류
      <input type="radio" name="category" value="예약" checked>예약
      <input type="radio" name="category" value="상담">상담
      <br><br>

      최근 7일 내에 앓은 질환<br>
      <input type="text" name="disease" size="50"
        placeholder="없으면 빈칸으로 비워주세요">
      <br><br>

      문의 내용 <br>
      <textarea name="project" rows="8" cols="50"
        placeholder="문의 내용을 입력해주세요"
        required></textarea>
      <br><br>
      <input type="reset" value="초기화">
      <input type="submit" value="문의하기">
    </form>
  </body>
</html>