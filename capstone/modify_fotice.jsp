<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%
    String db = request.getParameter("db");
    String no = request.getParameter("no");
%>
<c:set var="dbname" value= "<%=db%>"/>
<sql:query var="rs" dataSource="jdbc/mydb">
  select *from <%=db%> where no = <%=no%>;
</sql:query>
<html>  
<head>
    <c:if test="${dbname eq 'format'}">
        <c:forEach var="row" items="${rs.rows}">
            <c:set var="type" value="${row.type}" />
            <c:set var="title" value="${row.title}" />
            <c:set var="content" value="${row.content}" />

            <c:set var="file1" value="${row.file1}" />
            <c:set var="file2" value="${row.file2}" />
            <c:set var="file3" value="${row.file3}" />

            <c:set var="userid" value="${row.userid}" />
        </c:forEach>
    </c:if>
    <c:if test="${dbname eq 'notice'}">
        <c:forEach var="row" items="${rs.rows}">
            <c:set var="title" value="${row.title}" />
            <c:set var="content" value="${row.content}" />

            <c:set var="file1" value="${row.file1}" />
            <c:set var="file2" value="${row.file2}" />
            <c:set var="file3" value="${row.file3}" />

            <c:set var="userid" value="${row.userid}" />
        </c:forEach>
    </c:if>
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
        <form name="postwrite" style="margin:0;" method='post' action="postupdate_<%=db%>.jsp?db=outcome&no=<%=no%>" enctype="multipart/form-data">
             <c:if test="${ dbname == 'format'}">
                <div class="wrName">
                <select name="class" id="class" required>
                    <option value="서식">서식</option>
                    </select>
                </div>
            </c:if> 
            <div class="wrSubject">
				<input type="text" name="title" value="${title}" placeholder="제목" required>
			</div>
            <div class="wrContent">
			    <textarea id="summernote" name="editordata">${content}</textarea>
			</div>
            <input type=hidden name='check1' id='check1' value=0>
            <input type=hidden name='check2' id='check2' value=0> 
            <input type=hidden name='check3' id='check3' value=0> 
            <script type="text/javascript">
                window.onload = function () {

                    var check1= document.getElementById('check1');
                    var reset1 = document.getElementById('reset1');
                    var file1 = document.getElementById("file1");
                    var modify_file1 = document.getElementById("modify_file1");

                    var check2= document.getElementById('check2');
                    var reset2 = document.getElementById('reset2');
                    var file2 = document.getElementById("file2");
                    var modify_file2 = document.getElementById("modify_file2");
                    
                    var check3= document.getElementById('check3');
                    var reset3 = document.getElementById('reset3');
                    var file3 = document.getElementById("file3");
                    var modify_file3 = document.getElementById("modify_file3");

                    reset1.onclick = function () {
                        file1.style.display='none';
                        modify_file1.style.display='block';
                        check1.value+=1;
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
                }
            </script>
            
			<div class="wrFile"> 
                <c:choose>
                    <c:when test="${not empty file1}">
                        <style>
                            .modify_file1{
                                display:none;
                            }
                        </style>
                    </c:when>
                    <c:when test="${empty file1}">
                        <style>
                            .file1{
                                display:none;
                            }
                        </style>
                    </c:when>
                </c:choose>

                <span id="modify_file1" class="modify_file1">              
                    첨부파일1 <input type="file" name="f1">
                </span>

                <span id="file1" class="file1">              
                    첨부파일1 <font color="#999999">${file1}</font>
                    <input type="button" id="reset1" value="초기화" name="reset1">
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
                    첨부파일2 <input type="file" name="f2">
                </span>

                <span id="file2" class="file2">              
                    첨부파일2 <font color="#999999">${file2}</font>
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
                    첨부파일3 <input type="file" name="f3">
                </span>

                <span id="file3" class="file3">              
                    첨부파일3 <font color="#999999">${file3}</font>
                    <input type="button" id="reset3" value="초기화" name="reset3">
                </span>
			</div>

            <div class="boardWriteBtn"> 
            <a href="javascript: document.board2write.submit();">
				<button id="write"><i class="fa fa-cog" aria-hidden="true"></i> 수정하기</button>
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