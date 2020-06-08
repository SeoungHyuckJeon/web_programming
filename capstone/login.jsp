<%@ page contentType="text/html;charset=UTF-8" %>


<html>
	<head>
		<link rel="stylesheet" type="text/css" href="./css/style_header.css" />
    	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
		<link rel="stylesheet" type="text/css" href="./css/style_login.css" />
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<title>
			목포대학교 링크플러스사업단
		</title>
	</head>

	<body>
		<div id="header">        
			<div class="title">
				<div class="logo" onclick="location.href='./introduce.jsp';"></div>
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

					<div class="sub-right">
						<h3>로그인</h3>
							<div class="login">
								<div class="wrapper">

									<form name="loginpage" id="loginpage"  method='post' action='./login_on.jsp'>
										<input type='hidden' name='goto' value=''>
										<input type='hidden' name='mode' value='login'>
										<div class="loginbox">
											<div class="loginInput">
												<input type="text" name="userid" class="userid" placeholder="아이디">
												<input type="password" name="passwd" class="passwd" placeholder="비밀번호">
											</div>
											<div class="loginSubmit">
												<input type="submit" value="로그인" class="submit">
											</div>
										</div>
									</form>
			
			
									<div class="join">
										<p>회원가입을 하시면 다양하고 특별한 혜택이 준비되어 있습니다.</p>
										<a href="./register.jsp" class="memberJoin">회원가입 <i class="fa fa-angle-right" aria-hidden="true"></i></a>
									</div>
								</div>
							</div>
					</div>
				</div>
			</div>
		</div>

	</body>
</html>