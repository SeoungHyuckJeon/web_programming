<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%-- 검색 --%>
<%
    String search_type = request.getParameter("sc_column");
    String search_text = request.getParameter("sc_string");
    if(search_text==null || search_text=="") search_text=null;
%>
<c:set var="searchType" value="<%=search_type%>"/>
<c:set var="searchText" value="<%=search_text%>"/>

<%-- 현재 페이지 --%>
<% 
    String curpage = request.getParameter("page");
    if(curpage==null) curpage="1";
%>
<c:set var="curpage" value="<%=curpage%>"/>

<%-- 범위를 벗어난 page 예외 처리 --%>
<c:if test="${curpage < '1'}">
    <c:set var="curpage" value="1"/>
    <script type="text/javascript">
        alert('없는 페이지 입니다.'); 
        location.href="./notice.jsp?page=1";
    </script>
</c:if>

<sql:query var="dbcheck" dataSource="jdbc/mydb">
    select EXISTS (select * from notice) as success;
</sql:query>

<sql:query var="todaypost" dataSource="jdbc/mydb">
    select COUNT(postdate) as count from notice 
        where date_format(postdate,'%Y-%m-%d')=curdate();
</sql:query>
<c:forEach var="today" items="${todaypost.rows}">
    <c:set var="tdpost" value="${today.count}"/>
</c:forEach>

<sql:query var="atotalpost" dataSource="jdbc/mydb">
    select COUNT(*) as count from notice;
</sql:query>
<c:forEach var="total" items="${atotalpost.rows}">
    <c:set var="attpost" value="${total.count}"/>
</c:forEach>

<%-- 검색할 때 페이지 수 --%>
<c:choose>
    <c:when test='${searchText!=null && searchType=="title"}'>
        <sql:query var="totalpost" dataSource="jdbc/mydb">
            select COUNT(*) as count from notice where title like ?;
            <sql:param value='%${searchText}%'/>
        </sql:query>
    </c:when>
    <c:when test='${searchText!=null && searchType=="content"}'>
        <sql:query var="totalpost" dataSource="jdbc/mydb">
            select COUNT(*) as count from notice where content like ?;
            <sql:param value='%${searchText}%'/>
        </sql:query>
    </c:when>
    <c:when test='${searchText!=null && searchType=="manager"}'>
        <sql:query var="totalpost" dataSource="jdbc/mydb">
            select COUNT(*) as count from notice where manager like ?;
            <sql:param value='%${searchText}%'/>
        </sql:query>
    </c:when>
    <c:otherwise>
        <sql:query var="totalpost" dataSource="jdbc/mydb">
            select COUNT(*) as count from notice;
        </sql:query>
    </c:otherwise>
</c:choose>
<c:forEach var="total" items="${totalpost.rows}">
    <c:set var="ttpost" value="${total.count}"/>
</c:forEach>

<%-- 전체 페이지 수 --%>
<fmt:parseNumber var="totalPage" value="${ttpost/15+1}" integerOnly="true"/>

<%-- 현재 페이지 앞에 나온 게시글 수 --%>
<c:choose> 
    <c:when test="${curpage==1}">
        <c:set var="forwardpost" value="${0}"/>
    </c:when>
    <c:otherwise>
        <c:set var="forwardpost" value="${(curpage-1)*15}"/>    
    </c:otherwise>
</c:choose>
<%-- 게시글 번호 지정 --%>
<c:set var="startpost" value="${ttpost-forwardpost}"/>
<c:set var="endpost" value="${startpost-14}"/>
<c:if test="${endpost<=0}">
    <c:set var="endpost" value="${1}"/>
</c:if>

<c:choose>
    <c:when test='${searchText!=null && searchType=="title"}'>
        <sql:query var="rs" dataSource="jdbc/mydb">
            select no, title, manager, date_format(postdate,'%Y-%m-%d %H:%i:%s') as postdate,
                views, file1, file2, file3 from notice where title like ?
                order by no DESC limit ?, 15;
            <sql:param value='%${searchText}%'/>
            <sql:param value='${forwardpost}'/>
        </sql:query>
    </c:when>
    <c:when test='${searchText!=null && searchType=="content"}'>
        <sql:query var="rs" dataSource="jdbc/mydb">
            select no, title, manager, date_format(postdate,'%Y-%m-%d %H:%i:%s') as postdate,
                views, file1, file2, file3 from notice where content like ?
                order by no DESC limit ?, 15;
            <sql:param value='%${searchText}%'/>
            <sql:param value='${forwardpost}'/>
        </sql:query>
    </c:when>
    <c:when test='${searchText!=null && searchType=="manager"}'>
        <sql:query var="rs" dataSource="jdbc/mydb">
            select no, title, manager, date_format(postdate,'%Y-%m-%d %H:%i:%s') as postdate,
                views, file1, file2, file3 from notice where manager like ?
                order by no DESC limit ?, 15;
            <sql:param value='%${searchText}%'/>
            <sql:param value='${forwardpost}'/>
        </sql:query>
    </c:when>
    <c:otherwise>
        <sql:query var="rs" dataSource="jdbc/mydb">
            select no, title, manager, date_format(postdate,'%Y-%m-%d %H:%i:%s') as postdate,
                views, file1, file2, file3 from notice
                order by no DESC limit ?, 15;
            <sql:param value="${forwardpost}"/>
        </sql:query>
    </c:otherwise>
</c:choose>

<%-- 범위를 벗어난 page 예외 처리 --%>
<c:if test="${curpage < 1 || curpage > totalPage}">
     <script type="text/javascript">
                alert('없는 페이지 입니다.'); 
                location.href="./notice.jsp?page=1";
    </script>
</c:if>

<html>
<head>
    <link rel="stylesheet" type="text/css" href="./css/style_notice.css" />
    <link rel="stylesheet" type="text/css" href="./css/style_header.css" />
    <link rel="stylesheet" type="text/css" href="./css/style_footer.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/earlyaccess/notosanskr.css">
    <title>목포대학교 링크플러스사업단</title>
<head>
<body>

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

    <div id="content">
        <div class="sub-right">
            <h3>캡스톤디자인</h3>
            <hr color="#e5e5e5" size="0px">

    <%-- 카테고리 --%>
            <div class="sub7_tab_menu" style="text-align: center;">
    	    	<a class="sub7_tab" href="./introduce.jsp" style="display: inline-block;">소개</a>
    	    	<a class="sub7_tab check" href="./notice.jsp?page=1" style="display: inline-block;">공지사항</a>
    	    	<a class="sub7_tab" href="./format.jsp?page=1" style="display: inline-block;">서식</a>
    	    	<a class="sub7_tab" href="./outcome.jsp?page=1" style="display: inline-block;">성과</a>
    	    </div>	

    <%-- 검색 --%>
            <div class="board-search">
                <form name="board3search" style="margin:0;"  action="./notice.jsp?page=1&sc_column=${searchType}&sc_string=${searchText}" method="get">
                    <div class="search-con">
                        <select name="sc_column">
                            <option value="title" <c:if test="${searchType eq 'title'}">selected</c:if>>제목</option>
                            <option value="content"  <c:if test="${searchType eq 'content'}">selected</c:if>>내용</option>
                            <option value="manager"  <c:if test="${searchType eq 'manager'}">selected</c:if>>작성자</option>
                        </select>
                    </div>
                    <div class="search-input">
                        <input type="text" name="sc_string" value="<c:if test="${searchText!=NULL}">${searchText}</c:if>" placeholder="검색 내용을 입력해주세요">
                        <button id="btn_search" type="submit"><i class="fa fa-search"></i> 검색</button>
                    </div>
                </form>
    	    	<div class="page-info">
    	    		<span>오늘 : <strong>
                            ${tdpost}
                        </strong> 건
                    </span>
    	    		<span>총 : <strong>
                            ${attpost}
                        </strong> 건
                    </span>
    	    	</div>
            </div>

    <%-- 게시글 목록 --%>
            <div class="responsive-table">
                <ul class="normal">
                    <li class="table-head">
                        <div class="th th-cell01 w5">NO</div>
                        <div class="th th-cell02">제목</div>
                        <div class="th th-cell03 w10">작성자</div>
                        <div class="th th-cell04 w20">등록일</div>
                        <div class="th th-cell05 w10">조회수</div>
                        <div class="th th-cell06 w5">첨부</div>
                    </li>
                    <c:forEach var="check" items="${dbcheck.rows}">
                        <c:choose>
                            <c:when test="${check.success=='0'}">
                                </ul>
                                    <div class="empty">게시물이 없습니다.</div>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="row" items="${rs.rows}">
                                    <li class="table-body-row">
                                        <div class="td td-cell01 w5">${startpost}</div>
                                        <div class="td td-cell02"><a href="./post.jsp?db=notice&no=${row.no}" class="ntsviewBtn" method="post">${row.title}</a></div>
                                        <div class="td td-cell03 w10">${row.manager}</div>
                                        <div class="td td-cell04 w20">${row.postdate}</div>
                                        <div class="td td-cell05 w10">
                                            <c:choose>
                                                <c:when test="${row.views == null}">0</c:when>
                                                <c:otherwise>${row.views}</c:otherwise>
                                            </c:choose>
                                        </div>
                                        <div class="td td-cell06 w5"> 
                                            <c:choose>
                                                <c:when test="${row.file1 == null && row.file2==null && row.file3==null}">
                                                </c:when>
                                                <c:when test= "${row.file1 != null}">
                                                    <a href='${row.file1}' target='_self' download><img src="./image/icon_file.png"></a>
                                                </c:when>
                                                <c:when test= "${row.file2 != null}">
                                                    <a href='${row.file2}' target='_self' download><img src="./image/icon_file.png"></a>
                                                </c:when>
                                                <c:otherwise><a href='${row.file3}' target='_self' download><img src="./image/icon_file.png"></a></c:otherwise>
                                            </c:choose>
                                        </div>
                                    </li>
                                    <c:set var="startpost" value="${startpost-1}"/>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </ul>
            </div>

            <div class="board-btn">
                <c:if test="${admin==true}">
                    <a href="./postwrite_fotice.jsp?db=notice">
                        <button id="write"><i class="fa fa-pencil" aria-hidden="true"></i>글쓰기</button>
                    </a>   
                </c:if>
                
    <%-- 다음 페이 지 --%>
                <c:choose>
                    <c:when test="${searchText!=null}">
                        <div class="page">
                            <div class="pagePrev">
                                <c:choose>
                                    <c:when test="${curpage==1}">
                                        <span class="pageDoubleLeft">
                                            <span style="font-size:11px; color:#999999;">
                                                <i class="fa fa-angle-double-left">
                                                </i>
                                            </span>
                                        </span>
                                        <span class="pageLeft">
                                            <span style="font-size:11px; color:#999999;">
                                                <i class="fa fa-angle-left">
                                                </i>
                                            </span>
                                        </span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="pageDoubleLeft">
                                            <span style="font-size:11px; color:#999999;">
                                                <i class="fa fa-angle-double-left">
                                                </i>
                                            </span>
                                        </span>
                                        <span class="pageLeft">
                                            <a href='./notice.jsp?page=${curpage-1}&sc_column=${searchType}&sc_string=${searchText}'>
                                                <span style="font-size:11px; color:#999999;">
                                                    <i class="fa fa-angle-left">
                                                    </i>
                                                </span>
                                            </a>
                                        </span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <ul>
                                <c:forEach var="i" begin="1" end="${totalPage}">
                                    <c:choose>
                                        <c:when test="${curpage==i}">
                                            <li class="on" style="color:white"><a href='./notice.jsp?page=${i}&sc_column=${searchType}&sc_string=${searchText}'>${i}
                                            </a></li>
                                        </c:when>
                                        <c:otherwise>
                                            <li style="color:white"><a href='./notice.jsp?page=${i}&sc_column=${searchType}&sc_string=${searchText}'>${i}
                                            </a></li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </ul>
                            <div class="pageNext">
                                <c:choose>
                                    <c:when test="${curpage==totalPage}">
                                        <span class="pageRight">
                                            <span style="font-size:11px; color:#999999;">
                                                <i class="fa fa-angle-right">
                                                </i>
                                            </span>
                                        </span>
                                        <span class="pageDoubleRight">
                                            <span style="font-size:11px; color:#999999;">
                                                <i class="fa fa-angle-double-right">
                                                </i>
                                            </span>
                                        </span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="pageRight">
                                            <a href="./notice.jsp?page=${curpage+1}&sc_column=${searchType}&sc_string=${searchText}">
                                            <span style="font-size:11px; color:#999999;">
                                                <i class="fa fa-angle-right">
                                                </i>
                                            </span>
                                            </a>
                                        </span>
                                        <span class="pageDoubleRight">
                                            <span style="font-size:11px; color:#999999;">
                                                <i class="fa fa-angle-double-right">
                                                </i>
                                            </span>
                                        </span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="page">
                            <div class="pagePrev">
                                <c:choose>
                                    <c:when test="${curpage==1}">
                                        <span class="pageDoubleLeft">
                                            <span style="font-size:11px; color:#999999;">
                                                <i class="fa fa-angle-double-left">
                                                </i>
                                            </span>
                                        </span>
                                        <span class="pageLeft">
                                            <span style="font-size:11px; color:#999999;">
                                                <i class="fa fa-angle-left">
                                                </i>
                                            </span>
                                        </span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="pageDoubleLeft">
                                            <span style="font-size:11px; color:#999999;">
                                                <i class="fa fa-angle-double-left">
                                                </i>
                                            </span>
                                        </span>
                                        <span class="pageLeft">
                                            <a href='./notice.jsp?page=${curpage-1}'>
                                                <span style="font-size:11px; color:#999999;">
                                                    <i class="fa fa-angle-left">
                                                    </i>
                                                </span>
                                            </a>
                                        </span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <ul>
                                <c:forEach var="i" begin="1" end="${totalPage}">
                                    <c:choose>
                                        <c:when test="${curpage==i}">
                                            <li class="on" style="color:white"><a href='./notice.jsp?page=${i}'>${i}
                                            </a></li>
                                        </c:when>
                                        <c:otherwise>
                                            <li style="color:white"><a href='./notice.jsp?page=${i}'>${i}
                                            </a></li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </ul>
                            <div class="pageNext">
                                <c:choose>
                                    <c:when test="${curpage==totalPage}">
                                        <span class="pageRight">
                                            <span style="font-size:11px; color:#999999;">
                                                <i class="fa fa-angle-right">
                                                </i>
                                            </span>
                                        </span>
                                        <span class="pageDoubleRight">
                                            <span style="font-size:11px; color:#999999;">
                                                <i class="fa fa-angle-double-right">
                                                </i>
                                            </span>
                                        </span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="pageRight">
                                            <a href="./notice.jsp?page=${curpage+1}">
                                            <span style="font-size:11px; color:#999999;">
                                                <i class="fa fa-angle-right">
                                                </i>
                                            </span>
                                            </a>
                                        </span>
                                        <span class="pageDoubleRight">
                                            <span style="font-size:11px; color:#999999;">
                                                <i class="fa fa-angle-double-right">
                                                </i>
                                            </span>
                                        </span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>

    <footer id="footer" class="footer">
        <div class="foo-top">
            <div class="wrapper">
                <ul class="clfix">
                    <li><a href="https://lincplus.mokpo.ac.kr/sub1/sub1_1.php">사업단소개</a></li>
                    <li><a href="https://lincplus.mokpo.ac.kr/spb3/sjoin/license.php">이용약관</a></li>
                    <li><a href="https://lincplus.mokpo.ac.kr/spb3/sjoin/privacy.php">개인정보처리방침</a></li>
                    <li><a href="https://lincplus.mokpo.ac.kr/sub1/sub1_3.php">찾아오시는길</a></li>
                </ul>
                <div class="rel-site">
                    <select name="site">
                        <option value="https://www.mokpo.ac.kr">목포대학교</option>
                    </select>
                    <a href="https://www.mokpo.ac.kr" class="btn-go"><img src="./image/btn_go.png" alt=""></a>
                </div>
            </div>
        </div>
        <address>
            <div class="wrapper">
                <div class="foo-bottom">
                    <h2><a href="introduce.jsp" ><img src="/capstone/image/foo_logo_mobile.png" alt="" class="mobile-img" width="66"></a></h2>
                    <div class="copy">
                        <p>58554 전남 무안군 청계면 영산로 1666  산학협력 선도대학(LINC+) 육성사업단</p>
                        <p>TEL : 061) 450-6407 / FAX : 0303) 0949-6149</p>
                        <p>Copyright (c) lincplus.mokpo.ac.kr All rights reserved.</p>
                    </div>
                    <ul class="sns clfix">
                        <li><a href="https://www.facebook.com/MNU.LINCPLUS/?ref=py_c" target="_blank"><img src="./image/icon_sns01.png" alt=""></a></li>
                        <li><a href="https://twitter.com/mnulinc" target="_blank"><img src="./image/icon_sns02.png" alt=""></a></li>
                        <li><a href="https://www.google.com/search?q=목포대학교+링크플러스사업단&oq=목포대학교+링크플러스사업단&aqs=chrome..69i57j69i61l3.3996j0j1&sourceid=chrome&ie=UTF-8" target="_blank"><img src="./image/icon_sns03.png" alt=""></a></li>
                        <li><a href="https://www.youtube.com/channel/UCxm4lw_qATcnrFNboXcjkiA" target="_blank"><img src="./image/icon_sns04.png" alt=""></a></li>
                    </ul>
                </div>
            </div>
        </address>
    </footer>
</body>
</html>