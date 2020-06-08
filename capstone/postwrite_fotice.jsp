<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="errorpage.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page import="java.io.*" %>
<%
    String db = request.getParameter("db");
    String no = request.getParameter("no");
%>
<c:set var="dbname" value= "<%=db%>"/>
<html>  
<head>
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
            $('#summernote').summernote({
                height: 300,                 // 에디터 높이
                minHeight: null,             // 최소 높이
                maxHeight: null,             // 최대 높이
                focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
                lang: "ko-KR",					// 한글 설정
                placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
            });
        });
    </script>
</head>  
<body>
 <div class="top-main"> 
    <div id="header">        
        <div class="title">
            <div class="logo" onclick="location.href='./introduce.jsp';"></div>

                    <div class="logout" onclick="location.href='./logout.jsp';">
                        로그아웃
                    </div>                

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
        <c:choose>
            <c:when test="${ dbname == 'notice'}">
		        <a class="sub7_tab check" href="./notice.jsp" style="display: inline-block;">공지사항</a>
		        <a class="sub7_tab" href="./format.jsp" style="display: inline-block;">서식</a>
            </c:when> 
            <c:when test="${ dbname == 'format'}">
                <a class="sub7_tab" href="./notice.jsp" style="display: inline-block;">공지사항</a>
                <a class="sub7_tab check" href="./format.jsp" style="display: inline-block;">서식</a>
            </c:when> 
        </c:choose>
		<a class="sub7_tab" href="./outcome.jsp" style="display: inline-block;">성과</a>
	</div>
   

    <div class="write-board">
        <form name="postwrite" style="margin:0;" method='post' action="./postupload_<%=db%>.jsp" enctype="multipart/form-data">
            <c:if test="${ dbname == 'format'}">
                <div class="wrName">
                <select name="class"" id="class" required>
                    <option value="서식">서식</option>
                    </select>
                </div>
            </c:if> 
			<div class="wrSubject">
				<input type="text" name="title" value="" placeholder="제목" required>
			</div>
            <div class="wrContent">
			    <textarea id="summernote" name="editordata"></textarea>
			</div>
			<div class="wrFile"> <span class="fileTitle">첨부파일1</span>
				<input type="file" name="f1">
			</div>
			<div class="wrFile"> <span class="fileTitle">첨부파일2</span>
				<input type="file" name="f2">
			</div>
			<div class="wrFile"> <span class="fileTitle">첨부파일3</span>
				<input type="file" name="f3">
			</div>

            <div class="boardWriteBtn"> 
            <a href="javascript: document.board2write.submit();">
				<button id="write"><i class="fa fa-pencil" aria-hidden="true"></i> 글쓰기</button>
				</a>
				<a href="./<%=db%>.jsp">
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