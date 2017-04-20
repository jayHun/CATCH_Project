<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("UTF-8");%>

<html lang="kor">

	<head>
	<title>쪽지 내용</title>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<link rel="stylesheet" type="text/css" href="asset/css/main.css">
<style>
.content{
  position: relative;
  margin-top: 50px;
  width: 500px;
  height: 400px;
  background-color: white;
  padding: 50px 30px 0px 70px;
  border: 7px double green;
  border-radius: 10px;
  float: left;
}
</style>
	</head>
	
	<body>
		<jsp:include page = "/Header.jsp"></jsp:include>
		
		<aside class='left'>
		</aside>
		
		<div class='content'>
	    <h4>쪽지 읽기</h4>
	   	    
	    <jsp:useBean id="memcontent" class="dbconn.MemoDTO" />
	    <jsp:setProperty name="memcontent" property="num" value="${param.SEQ_NO}" />
	    <% memcontent.readDB(); %>
	    
	    [제 목] ${memcontent.title} <br>
	    [보낸이] ${memcontent.sender}<br>
	    ==============================<br><br>
	    [내 용]<br><br>
	    ${memcontent.content}
	    <br><br><br>
		<a href='input.jsp?receiver=${memcontent.sender}'><input type="button" value="답장하기"></a>
	  	</div>
	  
	  	<aside class='right'>
	  	</aside>
	  
	  	<footer>
	  		All Rights Reserved <br>
	  		Catholic Univ.
	  	</footer>
  </body>
</html>