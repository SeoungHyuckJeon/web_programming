<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%request.setCharacterEncoding("UTF-8");%>

<html>
<head>
<title>아이디 중복체크</title>

<script language="JavaScript">
    
    function delete_id() 
    {
        opener.document.join.userid.value = "";
        opener.document.join.userid_certify.value = "0";
        self.close();
    }
    function ok_id() 
    {
        opener.document.join.userid_certify.value = "1";
        self.close();
    }
</script>

</head>
<body topmargin="0" leftmargin="0">
<table width="350" border="0" cellpadding="0" cellspacing="0" bgcolor="#fdfdfd">
  <tr>
    <td height="10" colspan="3"></td>
  </tr>
  <tr> 
    <td width="5%">&nbsp;</td>
    <td width="90%" height="26" background="./image/certifyid_title_01.png">&nbsp;</td>
    <td width="5%">&nbsp;</td>
  </tr>
  <tr> 
    <td height="120" colspan="3" align="center"><img src="./image/message_success.png" width="206" height="33"></td>
  </tr>
  <tr> 
    <td colspan="3" align="center"><input type="image" src="./image/ok_btn.png" width="53" height="25" OnClick="ok_id()"></td>
  </tr>
  <tr> 
    <td colspan="3">&nbsp;</td>
  </tr>
</table>



</body>
</html>