<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<sql:query var="rs" dataSource="jdbc/mydb">
    select no, type, eventname, capacity,
        date_format(receptionstart,'%y-%m-%d'),
        date_format(receptionend,'%y-%m-%d'),
        date_format(progressstart,'%y-%m-%d'),
        date_format(progressend,'%y-%m-%d'),
        manager, file1, file2, file3 from introduce
</sql:query>

<sql:query var="dbcheck" dataSource="jdbc/mydb">
    select EXISTS (select * from introduce) as success;
</sql:query>

<sql:query var="totalpost" dataSource="jdbc/mydb">
    select COUNT(no) as count from introduce 
        where no;
</sql:query>
<c:forEach var="total" items="${totalpost.rows}">
    <c:set var="ttpost" value="${total.count}"/>
</c:forEach>

<html>
<head>
    <link rel="stylesheet" type="text/css" href="./css/style_introduce.css" />
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
            <hr color="#e6e6e6" size="0px">
    
            <%-- 카테고리 --%>
            <div class="sub7_tab_menu" style="text-align: center;">
    	    	<a class="sub7_tab check" href="./introduce.jsp" style="display: inline-block;">소개</a>
    	    	<a class="sub7_tab" href="./notice.jsp?page=1" style="display: inline-block;">공지사항</a>
    	    	<a class="sub7_tab" href="./format.jsp?page=1" style="display: inline-block;">서식</a>
    	    	<a class="sub7_tab" href="./outcome.jsp?page=1" style="display: inline-block;">성과</a>
    	    </div>
    
            <div class="board-btn">
                <a href="https://lincplus.mokpo.ac.kr/sub7/milejoin/listall.php?sc_column2=catetitle&sc_string2=캡스톤디자인">
                    <button id="write">캡스톤<br>디자인신청</button>
                </a>
            </div>
    
            <%-- 게시글 목록 --%>
            <div class="responsive-table">
                <ul class="normal">
                    <li class="table-head">
                        <div class="th th-cell01 w10">구분</div>
                        <div class="th th-cell02">행사명</div>
                        <div class="th th-cell03 w10">정원</div>
                        <div class="th th-cell04 w20">접수기간</div>
                        <div class="th th-cell05 w10">진행일</div>
                        <div class="th th-cell06 w10">진행담당</div>
                        <div class="th th-cell07 w5">첨부</div>
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
                                        <div class="td td-cell01 w10">${row.no}</div>
                                        <div class="td td-cell02"><a href="./post.jsp?db=introduce&no=${row.no}" class="ntsviewBtn">${row.eventname}</a></div>
                                        <div class="td td-cell03 w10">${row.capacity}</div>
                                        <div class="td td-cell04 w20">${row.receptionstart}~${row.receptionend}</div>
                                        <div class="td td-cell05 w10">${row.progressstart}</div>
                                        <div class="td td-cell06 w10">${row.manager}</div>
                                        <div class="td td-cell07 w5"> 
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
                                    <c:set var="ttpost" value="${ttpost-1}"/>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </ul>
            </div>

            <%-- 소개문 --%>
            <div class="sub-right-content"> 
                <div class="sub-right-title"><img class="headermarker" src="./image/headermarker.png" alt="headermarker">캡스톤디자인</div>	
                <div class="sub-sec-title"><div class="img-sub-marker"><img src="./image/headermarker_sub.png"></div>기업/기관의 어려움을 창의적으로 해결해 드립니다.</div>
                <div class="sub-div-st intro">
                    <table class="sub-inner-div-st capstone table intro" cellpadding="0" cellspacing="0">
                        <colgroup>
                            <col width="4%">
                            <col width="96%">
                        </colgroup>
                        <tr class="sub-sec-list">
                            <td><div class="square"></div></td>
                            <td>기업/기관의 요구사항을 반영하여 교수와 학생들의 기획-설계-제작을 통해 창의적인 해결책을 도출하는 교과과정</td>
                        </tr>
                        <tr class="sub-sec-list">
                            <td><div class="square"></div></td>
                            <td>학기 중 상시 운영</td>
                        </tr>
                        <tr class="sub-sec-list">
                            <td><div class="square"></div></td>
                            <td>기업/기관 혜택 : 기업/기관에 필요한 창의적 해결책, 전문가 자문비 지원 등</td>
                        </tr>
                    </table>
                    <div class="sub-inner-div-st capstone img intro">
                        <img src="./image/sub2_3_picture1.png" alt="picture1">
                    </div>
                </div>
                <div class="sub-sec-title"><div class="img-sub-marker"><img src="./image/headermarker_sub.png"></div>지원대상</div>
                <ul class="sub-sec-list" >
                    <li>LINC+ 참여학과 3~4학년</li>
                </ul>
                <div class="sub-sec-title"><div class="img-sub-marker"><img src="./image/headermarker_sub.png"></div>지원자격</div>
                <ul class="sub-sec-list" >
                    <li>학과에서 개설한 교과목 중 종합설계 또는 Capstone Design으로 표기된 교과목을 수강하는 학부생 3인 이상으로 구성된 팀</li>
                </ul>
                <div class="sub-sec-title"><div class="img-sub-marker"><img src="./image/headermarker_sub.png"></div>지원내용</div>
                <ul class="sub-sec-list" >
                    <li>과제 수행에 필요한 경비(회의비, 재료비, 시제품제작비 등)</li>
                    <li>특허 출원&middot;등록 비용(지원금 외 별도 지원)</li>
                </ul>
                <div class="sub-sec-title"><div class="img-sub-marker"><img src="./image/headermarker_sub.png"></div>지원절차</div>
                <div class="sub-inner-div-st capstone img">
                        <img src="./image/support_process.png" alt="process">
                    </div>
                <div class="sub-sec-title" style="margin-bottom:0;"><div class="img-sub-marker"><img src="./image/headermarker_sub.png"></div>유형</div>
                <div class="sub-div-st linner">
                    <div class="sub-inner-div-st capstone img">
                        <img src="./image/sub2_3_picture2.png" alt="picture2">
                    </div>
                    <table class="sub-inner-div-st capstone table" cellpadding="0" cellspacing="0">
                        <colgroup>
                            <col width="4%">
                            <col width="96%">
                        </colgroup>
                        <tr class="sub-sec-list">
                            <td><div class="img-sub-marker"><img src="./image/headermarker_sub.png"></div></td>
                            <td class="table-sub-title">기업/지역사회연계형 캡스톤디자인</td>
                        </tr>
                        <tr class="sub-sec-list">
                            <td></td>
                            <td>기업/지역사회에서 제안한 주제에 대한 작품제작을 추진하고 기업/지역사회 전문가와 함께 작품을 지도하는 캡스톤 디자인</td>
                        </tr>
                    </table>
                </div>
                <div class="sub-div-st linner">
                    <div class="sub-inner-div-st capstone img">
                        <img src="./image/sub2_3_picture3.png" alt="picture3">
                    </div>
                    <table class="sub-inner-div-st capstone table" cellpadding="0" cellspacing="0">
                        <colgroup>
                            <col width="4%">
                            <col width="96%">
                        </colgroup>
                        <tr class="sub-sec-list">
                            <td><div class="img-sub-marker"><img src="./image/headermarker_sub.png"></div></td>
                            <td class="table-sub-title">성과집중형 캡스톤디자인</td>
                        </tr>
                        <tr class="sub-sec-list">
                            <td></td>
                            <td>직접적 성과 창출이 가능한 주제를 선정하여 특허, 기술이전, 창업 등 성과를 도출하는 성과집중형 캡스톤디자인<br><strong>특허출원, 기술이전, 시제품 등 성과 필수</strong></td>
                        </tr>
                    </table>
                </div>
                <div class="sub-div-st linner">
                    <div class="sub-inner-div-st capstone img">
                        <img src="./image/sub2_3_picture4.png" alt="picture4">
                    </div>
                    <table class="sub-inner-div-st capstone table" cellpadding="0" cellspacing="0">
                        <colgroup>
                            <col width="4%">
                            <col width="96%">
                        </colgroup>
                        <tr class="sub-sec-list">
                            <td><div class="img-sub-marker"><img src="./image/headermarker_sub.png"></div></td>
                            <td class="table-sub-title">창의적아이디어형 캡스톤디자인</td>
                        </tr>
                        <tr class="sub-sec-list">
                            <td></td>
                            <td>창의적인 아이디어나 창업 아이템을 도출하는 캡스톤디자인</td>
                        </tr>
                    </table>
                </div>
                <div class="sub-div-st">
                    <div class="sub-inner-div-st capstone img">
                        <img src="./image/sub2_3_picture5.png" alt="picture5">
                    </div>
                    <table class="sub-inner-div-st capstone table" cellpadding="0" cellspacing="0">
                        <colgroup>
                            <col width="4%">
                            <col width="96%">
                        </colgroup>
                        <tr class="sub-sec-list">
                            <td><div class="img-sub-marker"><img src="./image/headermarker_sub.png"></div></td>
                            <td class="table-sub-title">미래연계형 캡스톤디자인</td>
                        </tr>
                        <tr class="sub-sec-list">
                            <td></td>
                            <td>기존 캡스톤디자인 결과를 업그레이드하여 진행하는 캡스톤디자인</td>
                        </tr>
                    </table>
                </div>
            </div>
            <p style="width:100%;text-align: center;color: #2d2d2d;">담당자 : LINC+사업단 박은진 &nbsp;&nbsp;&nbsp; 연락처 : 061)450-6407&nbsp;&nbsp;&nbsp; 이메일 : capstone@mokpo.ac.kr</p>
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