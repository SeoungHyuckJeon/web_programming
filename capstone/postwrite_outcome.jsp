<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="errorpage.jsp"%>
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
                placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
              
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
		<a class="sub7_tab" href="./notice.jsp" style="display: inline-block;">공지사항</a>
		<a class="sub7_tab" href="./format.jsp" style="display: inline-block;">서식</a>
		<a class="sub7_tab check" href="./outcome.jsp" style="display: inline-block;">성과</a>
	</div>
   
    <div class="write-board">
        <form name="postwrite" style="margin:0;" method='post' action="./postupload_outcome.jsp" enctype="multipart/form-data">
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
                <option value="영어영문학과" selected="selected">영어영문학과</option>
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
            <input type="text" name="teamname" placeholder="팀명" required size="10">
			</div>
			<div class="wrName">
				<input type="text" name="professor" value="" placeholder="지도교수" required>
			</div>
			<div class="wrSubject">
				<input type="text" name="title" value="" placeholder="제목" required>
			</div>
            <div class="wrContent">
			    <textarea id="summernote" name="editordata"></textarea>
			</div>
            <div class="wrFile"> <span class="fileTitle">썸네일이미지</span>
				<input type="file" name="f1">
			</div>
			<div class="wrFile"> <span class="fileTitle">첨부파일1</span>
				<input type="file" name="f2">
			</div>
			<div class="wrFile"> <span class="fileTitle">첨부파일2</span>
				<input type="file" name="f3">
			</div>
			<div class="wrFile"> <span class="fileTitle">첨부파일3</span>
				<input type="file" name="f4">
			</div>

            <div class="boardWriteBtn"> 
        
            <a href="javascript: document.board2write.submit();">
           
				<button id="write"><i class="fa fa-pencil" aria-hidden="true"></i> 글쓰기</button>
				</a>
				<a href="./outcome.jsp">
				<button id="cancel" type="button"><i class="fa fa-list" aria-hidden="true"></i>목록으로</button>
				</a>  
            </div>
		</form>
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
    </div>
    </body>
</html>