<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
    <%@page import="java.util.*"%>
    <%@page import="dbconn.SignupDTO" %>
    <%
    	request.setCharacterEncoding("UTF-8");
    	
    	String stdNum = (String)session.getAttribute("STD_NUM");
    
    	
    	SignupDTO e= new SignupDTO();
    	e=(SignupDTO)request.getAttribute("Dto");
    	int n = 0;
    	
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>
	<title>객패프로젝트 UI</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link rel="stylesheet" type="text/css" href="asset/css/main.css">
		<link rel="stylesheet" type="text/css" href="asset/css/content.css">
	</head>
	
	<body>
		<jsp:include page = "/Header.jsp"></jsp:include>
		<aside class='left'>
		</aside>
		<div class='content'>
		<h3>상대방 정보</h3>
		
			<div class='content2'>
		<form>
		이름 : <%=e.getName()%><br>
		학번 : <%=e.getStd_num()%><br>
		번호 : <%=e.getHp()%><br>
		나이 : <%=e.getAge()%><br>
		생일 : <%=e.getBirth()%><br>
		닉네임 : <%=e.getNick()%><br>
		취미 : <%=e.getHobby()%><br>
		종교 : <%=e.getReligion()%><br>
		소개글 : <%=e.getIntroduce()%><br>
		사는 지역 : <%=e.getSector()%><br>
		</form>
	    <form action="input.jsp?receiver=<%=e.getId()%>" method="post">
	    	이사람에게 쪽지 보내기
	    	<input type = "hidden" name = "stdnum" value = "${STD_NUM }">
	    	<input type = "hidden" name = "stdNum" value = "<%=e.getStd_num() %>">
	    	<button type = "submit" name = "bt01" >전송</button>
	    </form>
	    </div>		
	  </div>
	  <aside class='right'>
		</aside>
	  
	  <footer>
		All Rights Reserved <br>
	  	Catholic Univ.
	</footer>
	  
  </body>
</html>