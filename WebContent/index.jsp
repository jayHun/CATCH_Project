<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="kor">

	<head>
	<title>Catch</title>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<link rel="stylesheet" type="text/css" href="asset/css/main.css">
		<link rel="stylesheet" type="text/css" href="asset/css/content.css">
	</head>
	
	<body>
		<jsp:include page = "/Header.jsp"></jsp:include>
		
		<aside class='left'>
		</aside>
		
		<div class='content'>
	    	<h3>로그인</h3><br/><br/><br/>
	    	<form action="loginDAO" method="post">
	      	ID : <input type="text" size="14" name="ID" placeholder="아이디" required="required"><br><br>
	     	PW : <input type="password" size="14" name="PW" placeholder="비밀번호" required="required" /><br><br>
	    	<button type="submit">로그인</button>&nbsp;
	    	<a href="Signup.jsp">회원가입</a>
	      	</form>
	  	</div>
	  
	  	<aside class='right'>
	  	</aside>
	  
	  	<footer>
	  		All Rights Reserved <br>
	  		Catholic Univ.
	  	</footer>
  </body>
</html>