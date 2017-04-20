<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
    <%@page import="java.util.*"%>
    <%@page import="dbconn.SignupDTO" %>
    <%
    	request.setCharacterEncoding("UTF-8");
    	
    	String stdNum = (String)session.getAttribute("STD_NUM");
    	
    	ArrayList<SignupDTO> list = (ArrayList<SignupDTO>)request.getAttribute("List");
    	SignupDTO e= new SignupDTO();
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
		<h3>검색 결과</h3>
		<%
			for(n= 0; n < list.size() ;n++)
				{
				%>
			<div class='content2'>
		<form>
		이름 : <%=list.get(n).getName()%><br>
		학번 : <%=list.get(n).getStd_num()%><br>
		번호 : <%=list.get(n).getHp()%><br>
		나이 : <%=list.get(n).getAge()%><br>
		생일 : <%=list.get(n).getBirth()%><br>
		닉네임 : <%=list.get(n).getNick()%><br>
		취미 : <%=list.get(n).getHobby()%><br>
		종교 : <%=list.get(n).getReligion()%><br>
		소개글 : <%=list.get(n).getIntroduce()%><br>
		사는 지역 : <%=list.get(n).getSector()%><br>
		</form>   
	    <form action="SendGL" method="post">
	    	이사람에게 그린라이트 보내기
	    	<input type = "hidden" name = "stdnum" value = "${STD_NUM }">
	    	<input type = "hidden" name = "stdNum" value = "<%=list.get(n).getStd_num() %>">
	    	<button type = "submit" name = "bt01" >전송</button>
	    </form>
	    </div>		
		<%	
				}
		%>
	  </div>
	  <aside class='right'>
		</aside>
	  
	  <footer>
		All Rights Reserved <br>
	  	Catholic Univ.
	</footer>
	  
  </body>
</html>