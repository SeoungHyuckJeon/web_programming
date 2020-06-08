<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%
    String db = request.getParameter("db");
    String no = request.getParameter("no");
%>
<sql:query var="rs" dataSource="jdbc/mydb">
  select *from <%=db%> where no = <%=no%>;
</sql:query>
<html>  
<head>
    <c:forEach var="row" items="${rs.rows}">
        <c:set var="department" value="${row.department}" />
        <c:set var="teamname" value="${row.teamname}" />
        <c:set var="professor" value="${row.advisor}" />
        <c:set var="title" value="${row.title}" />
        <c:set var="content" value="${row.content}" />
        <c:set var="postdate" value="${row.postdate}" />
        <c:set var="views" value="${row.views}" />

        <c:set var="file1" value="${row.thumbnail}" />
        <c:set var="file2" value="${row.file1}" />
        <c:set var="file3" value="${row.file2}" />
        <c:set var="file4" value="${row.file3}" />
        <c:set var="views" value="${row.views}" />
        <c:set var="userid" value="${row.userid}" />
    </c:forEach>
    <%-- <c:choose>           
        <c:when test="${empty sessionid}">
            <script type="text/javascript">
                alert('로그인하세요.'); 
                location.href="./login.jsp";
            </script>
        </c:when>
        <c:when test="${userid ne sessionid}">
            <script type="text/javascript">
                alert('수정하실 권한이 없습니다.'); 
                location.href="./post.jsp?db=outcome&no=<%=no%>";
            </script>
        </c:when>
    </c:choose> --%>
    <title>목포대학교 링크플러스사업단</title>
	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/earlyaccess/notosanskr.css">
    <link rel="stylesheet" type="text/css" href="./css/reset.css" />
    
    <!-- include bootstrapcdn -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
    <!-- include summernote-ko-KR -->
    <link href="./css/summernote/summernote-lite.css" rel="stylesheet">
    <script src="js/summernote/summernote-lite.js"></script>
    <script src="js/summernote/lang/summernote-ko-KR.js"></script>

    <script>
        $(document).ready(function() { 
            //여기 아래 부분
            $('#summernote').summernote({ //써머노트 설정
                height: 300,                 // 에디터 높이
                minHeight: null,             // 최소 높이
                maxHeight: null,             // 최대 높이
                focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
                lang: "ko-KR",					// 한글 설정
                placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
            });
            $("select option[value=${department}]").attr("selected", true); // select 초기값 설정
        });
    </script>
</head>  
<body>
<div class="top-main"> 
    <div id="header">        
        <div class="title">
            <div class="logo" onclick="location.href='./introduce.jsp';"></div>
            <c:choose>
                <c:when test="${sessionid==null}">
                    <div class="login" onclick="location.href='./login.jsp';">
                        로그인
                    </div>                
                </c:when>
                <c:otherwise>
                    <div class="logout" onclick="location.href='./logout.jsp';">
                        로그아웃
                    </div>                
                </c:otherwise>
            </c:choose>
        </div>
        
        <div class="title2">
            <img src="./image/bg_sub_title.png" class="subtitleimage"/>
            <div class="title2name">교육프로그램</div>
        </div>
    </div>
 </div>
   <div class="main">
  <div class="sub-right">
        <h3 style="margin-bottom: 0; font-size:large">캡스톤디자인</h3>
    <div class="sub7_tab_menu" style="text-align: center;">
		<a class="sub7_tab" href="./introduce.jsp" style="display: inline-block;">소개</a>
		<a class="sub7_tab" href="./notice.jsp" style="display: inline-block;">공지사항</a>
		<a class="sub7_tab" href="./format.jsp" style="display: inline-block;">서식</a>
		<a class="sub7_tab check" href="./outcome.jsp" style="display: inline-block;">성과</a>
	</div>
    <div class="write-board">
        <form name="postwrite" style="margin:0;" method='post' action="postupdate_outcome.jsp?db=outcome&no=<%=no%>" enctype="multipart/form-data">
        <input type=hidden name='db' value='capstoneresult'> 
        <input type=hidden name='mode' value='write'> 
        <input type=hidden name='phpsess' value='cdtppic2m5rao6l22k4n6'>
           <div class="wrName">
          
           <select name="major" id="major" required>
            	<option value="간호학과">간호학과</option>
                <option value="건축공학과">건축공학과</option>
                <option value="건축공학심화트랙">건축공학심화트랙</option>
                <option value="건축학과">건축학과</option>
                <option value="경상학부">경상학부</option>
                <option value="경영학과">경영학과</option>
                <option value="경제학과">경제학과</option>
                <option value="고고문화인류학과">고고문화인류학과</option>
                <option value="고고학과">고고학과</option>
                <option value="공공인재학부">공공인재학부</option>
                <option value="관광경영학과">관광경영학과</option>
                <option value="교육학과">교육학과</option>
                <option value="금융보험학과">금융보험학과</option>
                <option value="기계공학과">기계공학과</option>
                <option value="기계공학심화트랙">기계공학심화트랙</option>
                <option value="기계ㆍ신소재공학과">기계ㆍ신소재공학과</option>
                <option value="기초과학부">기초과학부</option>
                <option value="도시및지역개발학과">도시및지역개발학과</option>
                <option value="독일언어문화학과">독일언어문화학과</option>
                <option value="무역학과">무역학과</option>
                <option value="문화인류학과">문화인류학과</option>
                <option value="물리학과">물리학과</option>
                <option value="미래사회공학부">미래사회공학부</option>
                <option value="미술학과">미술학과</option>
                <option value="사회과학부">사회과학부</option>
                <option value="사회복지학과">사회복지학과</option>
                <option value="생명과학과">생명과학과</option>
                <option value="생활과학부">생활과학부</option>
                <option value="스마트운송기계ㆍ신소재공학부">스마트운송기계ㆍ신소재공학부</option>
                <option value="식품공학과">식품공학과</option>
                <option value="식품영양트랙">식품영양트랙</option>
                <option value="식품영양학과">식품영양학과</option>
                <option value="신소재공학과">신소재공학과</option>
                <option value="신소재공학트랙">신소재공학트랙</option>
                <option value="아동학과">아동학과</option>
                <option value="에너지ICT공학부">에너지ICT공학부</option>
                <option value="영어영문학과" ">영어영문학과</option>
                <option value="원예과학과">원예과학과</option>
                <option value="원예생명과학트랙">원예생명과학트랙</option>
                <option value="융합소프트웨어학과">융합소프트웨어학과</option>
                <option value="인문학부">인문학부</option>
                <option value="일어일문학과">일어일문학과</option>
                <option value="전기공학과">전기공학과</option>
                <option value="전기및제어공학과">전기및제어공학과</option>
                <option value="전자상거래학과">전자상거래학과</option>
                <option value="전자ㆍ정보통신공학과">전자ㆍ정보통신공학과</option>
                <option value="정보보호학과">정보보호학과</option>
                <option value="정보전자공학과">정보전자공학과</option>
                <option value="정보전자공학심화트랙">정보전자공학심화트랙</option>
                <option value="정보통신공학과">정보통신공학과</option>
                <option value="정보통신공학심화트랙">정보통신공학심화트랙</option>
                <option value="정치언론홍보학과">정치언론홍보학과</option>
                <option value="제어로봇공학과">제어로봇공학과</option>
                <option value="조경학과">조경학과</option>
                <option value="조선공학과">조선공학과</option>
                <option value="조선해양공학과">조선해양공학과</option>
                <option value="조선해양생산트랙">조선해양생산트랙</option>
                <option value="조선해양설계트랙">조선해양설계트랙</option>
                <option value="중국언어와문화학과">중국언어와문화학과</option>
                <option value="지적학과">지적학과</option>
                <option value="체육학과">체육학과</option>
                <option value="친환경바이오융합학과">친환경바이오융합학과</option>
                <option value="컴퓨터공학과">컴퓨터공학과</option>
                <option value="컴퓨터ㆍ정보보호학부">컴퓨터ㆍ정보보호학부</option>
                <option value="토목공학과">토목공학과</option>
                <option value="토목공학트랙">토목공학트랙</option>
                <option value="패션의류학과">패션의류학과</option>
                <option value="한약자원트랙">한약자원트랙</option>
                <option value="한약자원학과">한약자원학과</option>
                <option value="해양수산자원트랙">해양수산자원트랙</option>
                <option value="해양수산자원학과">해양수산자원학과</option>
                <option value="해양시스템공학과">해양시스템공학과</option>
                <option value="화학과">화학과</option>
                <option value="환경공학과">환경공학과</option>
				</select>
			</div>
            <div class="wrName">
            <input type="text" name="teamname" placeholder="팀명" value=${teamname} required size="10">
			</div>
			<div class="wrName">
				<input type="text" name="professor" value=${professor} placeholder="지도교수" required>
			</div>
			<div class="wrSubject">
				<input type="text" name="title" value=${title} placeholder="제목" required>
			</div>
            <div class="wrContent">
			    <textarea id="summernote" name="editordata">${content}</textarea>
			</div>
            <input type=hidden name='check' id='check' value=0>
            <input type=hidden name='check2' id='check2' value=0> 
            <input type=hidden name='check3' id='check3' value=0> 
            <input type=hidden name='check4' id='check4' value=0>  
            <script type="text/javascript">
                window.onload = function () {
                    var check= document.getElementById('check');
                    var reset = document.getElementById('reset');
                    var image = document.getElementById("image");
                    var modify_image = document.getElementById("modify_image");

                    var check2= document.getElementById('check2');
                    var reset2 = document.getElementById('reset2');
                    var file2 = document.getElementById("file2");
                    var modify_file2 = document.getElementById("modify_file2");

                    var check3= document.getElementById('check3');
                    var reset3 = document.getElementById('reset3');
                    var file3 = document.getElementById("file3");
                    var modify_file3 = document.getElementById("modify_file3");
                    
                    var check4= document.getElementById('check4');
                    var reset4 = document.getElementById('reset4');
                    var file4 = document.getElementById("file4");
                    var modify_file4 = document.getElementById("modify_file4");

                    reset.onclick = function () {
                        image.style.display='none';
                        modify_image.style.display='block';
                        check.value+=1;
                    }
                    reset2.onclick = function () {
                        file2.style.display='none';
                        modify_file2.style.display='block';
                        check2.value+=1;
                    }
                    reset3.onclick = function () {
                        file3.style.display='none';
                        modify_file3.style.display='block';
                        check3.value+=1;
                    }
                    reset4.onclick = function () {
                        file4.style.display='none';
                        modify_file4.style.display='block';
                        check4.value+=1;
                    }
                }
            </script>
            
            <div class="wrFile">
                <c:choose>
                    <c:when test="${not empty file1}">
                        <style>
                            .modify_image{
                                display:none;
                            }
                        </style>
                    </c:when>
                    <c:when test="${empty file1}">
                        <style>
                            .image{
                                display:none;
                            }
                        </style>
                    </c:when>
                </c:choose>

                <span id="modify_image" class="modify_image">              
                    썸네일이미지 <input type="file" name="f1">
                </span>

                <span id="image" class="image">              
                    썸네일이미지 <font color="#999999">${file1}</font>
                    <input type="button" id="reset" value="초기화" name="reset">
                </span>
            </div>

			<div class="wrFile"> 
                <c:choose>
                    <c:when test="${not empty file2}">
                        <style>
                            .modify_file2{
                                display:none;
                            }
                        </style>
                    </c:when>
                    <c:when test="${empty file2}">
                        <style>
                            .file2{
                                display:none;
                            }
                        </style>
                    </c:when>
                </c:choose>

                <span id="modify_file2" class="modify_file2">              
                    첨부파일1 <input type="file" name="f2">
                </span>

                <span id="file2" class="file2">              
                    첨부파일1 <font color="#999999">${file2}</font>
                    <input type="button" id="reset2" value="초기화" name="reset2">
                </span>
			</div>

			<div class="wrFile">
                <c:choose>
                    <c:when test="${not empty file3}">
                        <style>
                            .modify_file3{
                                display:none;
                            }
                        </style>
                    </c:when>
                    <c:when test="${empty file3}">
                        <style>
                            .file3{
                                display:none;
                            }
                        </style>
                    </c:when>
                </c:choose>

                <span id="modify_file3" class="modify_file3">              
                    첨부파일2 <input type="file" name="f3">
                </span>

                <span id="file3" class="file3">              
                    첨부파일2 <font color="#999999">${file3}</font>
                    <input type="button" id="reset3" value="초기화" name="reset3">
                </span>
			</div>

			<div class="wrFile"> 
                <c:choose>
                    <c:when test="${not empty file4}">
                        <style>
                            .modify_file4{
                                display:none;
                            }
                        </style>
                    </c:when>
                    <c:when test="${empty file4}">
                        <style>
                            .file4{
                                display:none;
                            }
                        </style>
                    </c:when>
                </c:choose>

                <span id="modify_file4" class="modify_file4">              
                    첨부파일3 <input type="file" name="f4">
                </span>

                <span id="file4" class="file4">              
                    첨부파일3 <font color="#999999">${file4}</font>
                    <input type="button" id="reset4" value="초기화" name="reset4">
                </span>
			</div>

            <div class="boardWriteBtn"> 
            <a href="javascript: document.board2write.submit();">
				<button id="write"><i class="fa fa-cog" aria-hidden="true"></i> 수정하기</button>
				</a>
				<a href="./outcome.jsp">
				<button id="cancel" type="button"><i class="fa fa-list" aria-hidden="true"></i>목록으로</button>
				</a> 
            </div>
		</form>
    </div> 
    </div>
     <footer id="footer" class="footer">
                <div class="foo-top">
                    <div class="wrapper">
                        <ul class="clfix">
                            <li><a href="/spb3/gourl.php?k=sub1_1_intro">사업단소개</a></li>
                            <li><a href="/spb3/gourl.php?k=license">이용약관</a></li>
                            <li><a href="/spb3/gourl.php?k=privacy">개인정보처리방침</a></li>
                            <!--li><a href="/spb3/sjoin/email.php">이메일무단수집거부</a></li-->
                            <li><a href="/spb3/gourl.php?k=sub1_3_intro">찾아오시는길</a></li>
                        </ul>
                        <div class="rel-site">
                            <select>
                                <option value="http://www.mokpo.ac.kr">목포대학교</option>
                            </select>
                            <a href="#none" class="btn-go"><img src="./image/btn_go.png" alt=""></a>
                        </div>
                    </div>
                </div>
                <address>
                    <div class="wrapper">
                        <div class="foo-bottom">
                            <h2><a href="#none"><img src="./image/foo_logo_mobile.png" alt="" class="mobile-img" width="66"></a></h2>
                            <div class="copy">
                                <p>58554 전남 무안군 청계면 영산로 1666  산학협력 선도대학(LINC+) 육성사업단</p>
                                <p>TEL : 061) 450-6407 / FAX : 0303) 0949-6149<!-- / 사업자등록번호 : 411-82-08251--></p>
                                <p>Copyright (c) lincplus.mokpo.ac.kr All rights reserved.</p>
                            </div>
                            <ul class="sns clfix">
                                <li><a href="#none" target="_blank"><img src="./image/icon_sns01.png" alt=""></a></li>
                                <li><a href="#none" target="_blank"><img src="./image/icon_sns02.png" alt=""></a></li>
                                <li><a href="#none" target="_blank"><img src="./image/icon_sns03.png" alt=""></a></li>
                                <li><a href="#none" target="_blank"><img src="./image/icon_sns04.png" alt=""></a></li>
                            </ul>
                        </div>
                    </div>
                </address>
            </footer>
    </div>
    </body>
</html>