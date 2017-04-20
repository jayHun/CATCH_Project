<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@page import="java.util.*" %>

<%
	request.setCharacterEncoding("UTF-8");
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
	    <h3>이름으로 찾기</h3><br/><br/>
	    <form action="searchName" method="post">
	      	이름 : <input type="text" size="14" name="name" placeholder="이름"><br><br>
	      	<input type= "hidden" name="type" value=0>
	      <button type="submit" name="btn01">찾기</button>
	    <br>
	    </form>
	    <form action="searchName" method="post">
	    <h3>학번으로 찾기</h3><br><Br>
	    	학번 : <input type="text" size="20" name="std" placeholder="학번"><br><BR>
	    	<input type="hidden" name="type" value= 1>
	    	<button type="submit" name="btn02">찾기</button>
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