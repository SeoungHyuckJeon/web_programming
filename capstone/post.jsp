<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page import="java.io.*" %>
<%
    String db = request.getParameter("db");
    String no = request.getParameter("no");
    int next_no = Integer.parseInt(no)+1;
    int pre_no = Integer.parseInt(no)-1;
%>
<c:set var="dbname" value= "<%=db%>"/>
<sql:query var="rs" dataSource="jdbc/mydb">
    select *from <%=db%> where no = <%=no%>;
</sql:query>
<sql:query var="date" dataSource="jdbc/mydb">
    SELECT date_format(postdate,'%Y-%m-%d %H:%i:%s') as postdate from <%=db%> where no = <%=no%>;
</sql:query>
<c:forEach var="row" items="${rs.rows}">
        <c:set var="department" value="${row.department}" />
        <c:set var="teamname" value="${row.teamname}" />
        <c:set var="professor" value="${row.advisor}" />
        <c:set var="title" value="${row.title}" />
        <c:set var="content" value="${row.content}" />
        <%-- <c:set var="postdate" value="${row.postdate}" /><--%> 
        <c:set var="views" value="${row.views}" />

        <c:set var="file1" value="${row.thumbnail}" />
        <c:set var="file2" value="${row.file1}" />
        <c:set var="file3" value="${row.file2}" />
        <c:set var="file4" value="${row.file3}" />
        <c:set var="views" value="${row.views}" />
        <c:set var="userid" value="${row.userid}" />
    </c:forEach>
    <c:forEach var="row" items="${date.rows}">
        <c:set var="postdate" value="${row.postdate}" />
</c:forEach>
<%-- 다음 게시글 --%>
<sql:query var="rs_next" dataSource="jdbc/mydb">
    select * from <%=db%> where no = (select min(no) from <%=db%> where no><%=no%>);
 <%-- select *from <%=db%> where no = "<%=next_no%>"; --%>
</sql:query>
<c:forEach var="row" items="${rs_next.rows}">
    <c:set var="next_title" value="${row.title}" />
    <c:set var="next_no" value="${row.no}" />
</c:forEach>
<%-- 이전 게시글 --%>
<sql:query var="rs_pre" dataSource="jdbc/mydb">
    select * from <%=db%> where no = (select max(no) from <%=db%> where no<<%=no%>);
</sql:query>
<c:forEach var="row" items="${rs_pre.rows}">
    <c:set var="pre_title" value="${row.title}" />
    <c:set var="pre_no" value="${row.no}" />
</c:forEach>
<%-- 조회수 증가 --%>
<c:forEach var="db" items="${rs.rows}">
    <c:set var="views" value="${db.views}"/>
</c:forEach>
<sql:update dataSource="jdbc/mydb">
    update <%=db%> set views=?+1 where no = <%=no%>;
    <sql:param value="${views}"/>
</sql:update>
<html>  
<head>
    <c:choose>           
        <c:when test="${empty sessionid}">
            <style>
                .viewBtn{
                    display:none;
                }
            </style>
        </c:when>
        <c:when test="${userid ne sessionid}">
            <style>
                .viewBtn{
                    display:none;
                }
            </style>
        </c:when>
    </c:choose>
    <title>목포대학교 링크플러스사업단</title>
	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/earlyaccess/notosanskr.css">
    <link rel="stylesheet" type="text/css" href="./css/reset.css" />

    <!-- include bootstrapcdn -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>  
<body onresize="parent.resizeTo(500,400)" onload="parent.resizeTo(500,400)">
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
        <c:choose>
            <c:when test="${ dbname == 'introduce'}">
                <a class="sub7_tab check" href="./introduce.jsp" style="display: inline-block;">소개</a>
                <a class="sub7_tab" href="./notice.jsp" style="display: inline-block;">공지사항</a>
                <a class="sub7_tab" href="./format.jsp" style="display: inline-block;">서식</a>
                <a class="sub7_tab" href="./outcome.jsp" style="display: inline-block;">성과</a>
            </c:when> 
            <c:when test="${ dbname == 'notice'}">
                <a class="sub7_tab" href="./introduce.jsp" style="display: inline-block;">소개</a>
                <a class="sub7_tab check" href="./notice.jsp" style="display: inline-block;">공지사항</a>
                <a class="sub7_tab" href="./format.jsp" style="display: inline-block;">서식</a>
                <a class="sub7_tab" href="./outcome.jsp" style="display: inline-block;">성과</a>
            </c:when> 
            <c:when test="${ dbname == 'format'}">
                <a class="sub7_tab" href="./introduce.jsp" style="display: inline-block;">소개</a>
                <a class="sub7_tab" href="./notice.jsp" style="display: inline-block;">공지사항</a>
                <a class="sub7_tab check" href="./format.jsp" style="display: inline-block;">서식</a>
                <a class="sub7_tab" href="./outcome.jsp" style="display: inline-block;">성과</a>
            </c:when> 
            <c:when test="${ dbname == 'outcome'}">
                <a class="sub7_tab" href="./introduce.jsp" style="display: inline-block;">소개</a>
                <a class="sub7_tab" href="./notice.jsp" style="display: inline-block;">공지사항</a>
                <a class="sub7_tab" href="./format.jsp" style="display: inline-block;">서식</a>
                <a class="sub7_tab check" href="./outcome.jsp" style="display: inline-block;">성과</a>
            </c:when> 
        </c:choose>
    </div>
	<div class="board-view">
		<div class="viewBoard">
			<div class="viewSubject"> <c:out value="${title}" /> </div>
			<div class="viewInfo"> 
            <c:choose>           
                <c:when test="${ dbname == 'outcome'}">
                    <span>학과 : ${department} </span> 
                    <span>팀명 : ${teamname} </span>
                    <span>지도교수 : ${professor} </span> 
                </c:when>
                <c:when test="${ dbname eq 'format' || dbname eq 'notice'}">
                    <span>작성 : 관리자 </span> 
                </c:when>
            </c:choose>               
                <span>작성일 : ${postdate}</span> 
                <span>조회수 : ${views}</span></div>
			<div class="viewContent"> 
				<div class="viewContent-body cke_editable ">
                    <center><a href="./upload/${file1}" target="_blank"><img src="./upload/${file1}" alt=""></a>
                    </a><br><br><br></center>
                    <span> ${content} </span> 
				</div>
				<hr class="hr1"> - 첨부파일
                <c:if test="${not empty file2}">
                    <br><a href="./upload/${file2}" target="_self">
                    <img src="./image/icon_file.png">&nbsp;<font color="#999999">${file2}</font></a>
                </c:if>
                <c:if test="${not empty file3}">
                    <br><a href="./upload/${file3}" target="_self">
                    <img src="./image/icon_file.png">&nbsp;<font color="#999999">${file3} </font></a>     
				</c:if>
                <c:if test="${not empty file4}">
                    <br><a href="./upload/${file4}" target="_self">
                    <img src="./image/icon_file.png">&nbsp;<font color="#999999">${file4} </font></a>
				</c:if>
                <hr class="hr2">
				<div class="viewList">
					<div class="viewPrev"><span><i class="fa fa-angle-up" aria-hidden="true"></i> 
						<c:choose>           
                            <c:when test="${not empty pre_title}">
                                <a href="./post.jsp?db=<%=db%>&no=${pre_no}">이전글</a></span><a href=""></a>
                                <a href="./post.jsp?db=<%=db%>&no=${pre_no}">${pre_title}</a>
                            </c:when>
                            <c:when test="${empty pre_title}">
                                <a>이전글</a></span><a></a>
                                이전 게시물이 없습니다.
                            </c:when> 
                        </c:choose>    
					</div>
					<div class="viewNext"><span><i class="fa fa-angle-down" aria-hidden="true"></i>		
						<c:choose>           
                            <c:when test="${not empty next_title}">
                                <a href="./post.jsp?db=<%=db%>&no=${next_no}">다음글</a></span>
                                <a href="./post.jsp?db=<%=db%>&no=${next_no}">${next_title}</a>
                            </c:when>
                            <c:when test="${empty next_title}">
                                <a>다음글</a></span><a></a>
                                다음 게시물이 없습니다.
                            </c:when> 
                        </c:choose>
					</div>
				</div>
			</div>
            </script>
			<div class="viewWrite"> 
                <span class="viewListBtn"> 
                    <a href="./<%=db%>.jsp"><i class="fa fa-list" aria-hidden="true"></i> 목록</a> </span> <span class="viewBtn"> 
                <span class="viewBtn">
                    <c:choose>           
                            <c:when test="${dbname == 'outcome'}">
                                <a href="./modify_outcome.jsp?db=outcome&no=<%=no%>"><i class="fa fa-cog"></i> 수정하기</a>
                            </c:when>
                            <c:when test="${dbname != 'outcome'}">
                                <a href="./modify_fotice.jsp?db=<%=db%>&no=<%=no%>"><i class="fa fa-cog"></i> 수정하기</a>
                            </c:when>
                    </c:choose> 
                    <a href="./delete.jsp?db=<%=db%>&no=<%=no%>" onClick="javascript: return confirm('정말 삭제하시겠습니까?');">
                    <i class="fa fa-trash-o" aria-hidden="true"></i> 삭제하기</a> 
                </span> </div>
		    </div>
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