<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>11</title>
    <link type="text/css" href="/project1982/resources/css/2_login.css" rel="stylesheet"/>
    <script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>

</head>
<script>
	//현재 시간 데이터 세션에 넣기
	var now = new Date().getTime();
	sessionStorage.setItem("nowTime",now);
	

	window.onload = function(){
		document.getElementById('Submit').onclick = check;	
	}
	
	function check(){
		if(document.loginform.ownerid.value==""){
			alert("ID를 입력하세요.")
			document.loginform.ownerid.focus();
			return false;
		}
		
		if(document.loginform.ownerpass.value==""){
			alert("패스워드를 입력하세요.")
			document.loginform.ownerpass.focus();
			return false;
		}
		
		document.loginform.submit();//전송
		
		
	}
	$(function(){
		$("#searchPassword").click(function(){
			window.open("searchPassword.do","childForm","width=520, height=700, resizable = no, scrollbars = no");
		})
	})
</script>
<body>
<section class="section1" id="section1">
    <form action="login.do" method="post" id="login-form" name="loginform">
        <h1>1982 사업자</h1>
        <input name="ownerid" type="text" placeholder="OwnerId" />
        <input name="ownerpass" type="password" placeholder="Password" />
        <input type="submit" name="Submit" id="Submit" value="로그인" />
        
        <!-- <div class="login_article">
            <a href="#">아이디 |</a>
            <a href="#" id="searchPassword">비밀번호찾기 |</a>
            <a href="owner_register.do">회원가입</a>
        </div>     -->
        <div class="login_article">
            <a href="#" onclick="window.open('missId.do', '아이디찾기','width=500;, height=500, resizable = no, scrollbars = no'); return false">아이디 |</a>
            <a href="#" onclick="window.open('searchPassword.do', '비밀번호찾기','width=500;, height=500, resizable = no, scrollbars = no'); return false">비밀번호찾기 |</a>
            <a href="owner_register.do">회원가입</a>
        </div>           
    </form>
    </section>
</body>
</html>