<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="asset/css/main.css">
<title>���� ������ �Ϸ�</title>
</head>

<style>
.content{
  position: relative;
  margin-top: 50px;
  width: 500px;
  height: 400px;
  background-color: white;
  padding: 50px 30px 0px 30px;
  border: 7px double green;
  border-radius: 10px;
  float: left;
}
</style>

<% request.setCharacterEncoding("utf-8"); %>

<body>
<jsp:include page = "/Header.jsp"></jsp:include>
	
<aside class='left'>
</aside>
		
<div class='content'>
	������ ���������� ���������ϴ�! <br><br>
	<a href="Search.jsp">
		<input type="button" value="�˻�����">
	</a>
</div>

<aside class='right'>
</aside>
	  
<footer>
	All Rights Reserved <br>
	Catholic Univ.
</footer>
</body>
</html>