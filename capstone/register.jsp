<%@ page contentType="text/html;charset=UTF-8"%>

<html>
<head>

	<link rel="stylesheet" type="text/css" href="./css/style_register.css" />
	<link rel="stylesheet" type="text/css" href="./css/style_header.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>

<title>
	목포대학교 링크플러스사업단
</title>
</head>
<body>
	<div id="header">        
        <div class="title">
            <div class="logo" onclick="location.href='introduce.jsp';"></div>
        </div>
        
        <div class="title2">
            <img src="./image/bg_sub_title.png" class="subtitleimage"/>
            <div class="title2name">교육프로그램</div>
        </div>
	</div>
	
	<div id="wrap" class="main">
		<div id="container" class="container">

<div id="content" class="content">
	<div class="sub-left">
		
	</div>
	
	<script src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script> 
	<script>
		function openDaumPostcode() {
			new daum.Postcode({
				oncomplete: function(data) {
					
					var fullAddr = ''; // 최종 주소 변수
					var extraAddr = ''; // 조합형 주소 변수
	
					// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						fullAddr = data.roadAddress;
	
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						fullAddr = data.jibunAddress;
					}
	
					// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
					if(data.userSelectedType === 'R'){
						//법정동명이 있을 경우 추가한다.
						if(data.bname !== ''){
							extraAddr += data.bname;
						}
						// 건물명이 있을 경우 추가한다.
						if(data.buildingName !== ''){
							extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						}
						// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
						fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
					}
					// 우편번호와 주소 정보를 해당 필드에 넣고, 커서를 상세주소 필드로 이동한다.
					document.getElementById('rcvr_mail_no').value = data.zonecode;
					//document.getElementById('zip2').value = data.postcode2;
					//document.getElementById('zip_number').value = data.zonecode;
					document.getElementById('zip1').value = fullAddr;
	
					//전체 주소에서 연결 번지 및 ()로 묶여 있는 부가정보를 제거하고자 할 경우,
					//아래와 같은 정규식을 사용해도 된다. 정규식은 개발자의 목적에 맞게 수정해서 사용 가능하다.
					//var addr = data.address.replace(/(\s|^)\(.+\)$|\S+~\S+/g, '');
					//document.getElementById('addr').value = addr;
	
					document.getElementById('zip2').focus();
	
	
				}
			}).open();
	
			
		}
	</script>

<script>

var formSubmit;
var formSubmitValue;


function check_userid(userid)
{
	var i;
	var CurrentChar;
	var bReturn;

	bReturn = true;
	
	
	for ( i = 0; i < userid.length; i++)
	{
		
		CurrentChar = userid.charAt(i);

		
		if ( !((CurrentChar >= '0' && CurrentChar <= '9' ) || (CurrentChar >= 'a' && CurrentChar <= 'z') || (CurrentChar >= 'A' && CurrentChar <= 'Z') )) 
		{
			bReturn = false;	
			break;
		}
		
		
		if(i == 0) 
		{
			if (!((CurrentChar >= 'a' && CurrentChar <= 'z') || (CurrentChar >= 'A' && CurrentChar <= 'Z'))) 
			{
				bReturn = false;	
				break;
			}
		}
		
	}
	
	if ( bReturn && ( ( userid.length < 4) || ( userid.length > 16 ) ) )
	{
		bReturn = false;
	}
	return bReturn;
}


function check_passwd(passwd, passwd2)
{
	if(passwd != passwd2) {
		return false;
	}
	if((passwd.length < 3)) {
		return false;
	}

	return true;
}

</script>

<SCRIPT language="JavaScript">
	function certify_userid()
{
	var userid = document.join.userid.value;
	if (!check_userid(userid)) 
	{
		alert( "아이디는 4-16자까지 숫자, 영문자로만 조합만 가능합니다. 첫문자는 영문자여야 합니다.\n\n아이디를 올바른 형식으로 먼저 기입을 하셔야합니다." );
		document.join.userid.focus();
		return;
	}

    var URL = "./idcheck.jsp?userid="+userid
   var rtnVal = window.open(URL, 'idcheck', 'width=350,height=220,resizable=1,scrollbars=0' );
   return;
}

function checkSubmit(f) {

    if( !check_userid(f.userid.value)) 
		{		
		alert('아이디는 4-16자까지 숫자, 영문자, - 의 조합만 가능합니다. 첫문자는 영문자여야 합니다.');
		f.userid.focus();
		return false;
	}

    if(f.userid_certify.value <=0) 
	{
		alert('회원 아이디 중복확인을 하시기 바랍니다.');
		return false;
	}

    if( !check_passwd(f.passwd.value, f.passwd2.value)) 
	{
		alert('비밀번호는 3자 이상이며, 비밀번호가 일치한지 확인하여 다시 입력하시기 바랍니다.');
		f.passwd.focus();
		return false;
	}

    if(!f.name.value) 
	{
		alert('이름을 입력 바랍니다.');
		f.name.focus();
		return false;
	}

    if(f.zip1.value.length < 10) 
	{
		alert('주소를 정확히 입력하시기 바랍니다.');
		f.zip1.focus();
		return false;
	}
	return;
}

</SCRIPT>

<div class="sub-right">
<h3>회원가입</h3>
<div class="wrapper">
<form name="join" onSubmit="return checkSubmit(this)"  method='post' action='register_on.jsp'>
    <input type="hidden" name="userid_certify" value="0" />
<table summary="" border="1" style="border-collapse: collapse;">
	<caption>
        회원 기본정보
    </caption>
<colgroup>
<col style="width:160px;">
<col style="width:610px;">
</colgroup>
<tbody>
  <tr>
	<th scope="row">아이디 <span class="necessary">*</span> </th>
	<td><input name="userid" placeholder="아아디를 입력해주세요"  type="text" pattern="[A-Za-z0-9]{4,}" required>
	  <button type="button" class="joinSubmit" onClick="certify_userid()" value="중복확인">중복확인</button>
	  (영문소문자/숫자, 4~16자) </td>
  </tr>
  <tr>
	<th scope="row">비밀번호 <span class="necessary">*</span> </th>
	<td class="last"><input name="passwd" autocomplete="off" maxlength="16"  type="password" required>
	  (영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자) </td>
  </tr>
  <tr>
	<th scope="row">비밀번호 확인 <span class="necessary">*</span> </th>
	<td class="last"><input name="passwd2" autocomplete="off" maxlength="16"  type="password" required></td>
  </tr>
  
  <tr>
	<th scope="row">이름 <span class="necessary">*</span> </th>
	<td><input name="name" placeholder="이름을 입력해주세요"  type="text"  required></td>
  </tr>
  <tr>
	<th scope="row">이메일 <span class="necessary">*</span> </th>
	<td><input id="email" name="email"  type="email" required>
	  
	  </td>
  </tr>
	  
  <tr>
	<th rowspan="2" scope="row">주소 <span class="necessary">*</span> </th>
	<td>
	  <input id="rcvr_mail_no" name="rcvr_mail_no" class="inputclass" size="12" maxlength="7"  readonly/>
	  <input type="button" class="joinSubmit" onclick="openDaumPostcode()" value="우편번호" required><br>
	 </td>
  </tr>
	<tr>
		<td>
		<input name="zip1" id="zip1"  type="text" class="regAddress" size="40" readonly required>
	  <input name="zip2" id="zip2"  type="text" class="regAddress" placeholder="(동/읍/면 상세 주소를 입력 해주세요!)" size="40">
			</td>
	</tr>
  
  <tr>
	<th scope="row">전화 <span class="necessary">*</span> </th>
	<td><select id="tel1" name="hp1" required>
		<option value="010">010</option>
		<option value="011">011</option>
		<option value="016">016</option>
		<option value="017">017</option>
		<option value="018">018</option>
		<option value="019">019</option>
	  </select>
	  -
	  <input id="hp2" name="hp2" maxlength="4"  type="text" pattern="[0-9]{4,}" required>
	  -
	  <input id="hp3" name="hp3" maxlength="4"  type="text" pattern="[0-9]{4,}" required></td>
  </tr>
</tbody>
</table>

<div class="boardWriteBtn">
  <button type="submit" class="regSubmit" value="회원가입">회원가입</button>
<a href="./login.jsp"><button type="button" id="cancel" class="regCancel"> 취소하기</button></a>
</form>
</div>
</div>
</div>
</div>
</div>
</body>
</html>