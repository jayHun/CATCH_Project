<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="asset/css/main.css">
<title>회원탈퇴</title>

<%
	String id = (String)session.getAttribute("ID");
	session.setAttribute("ID", id);
%>

<style>
.content{
  position: relative;
  margin-top: 50px;
  width: 500px;
  height: 300px;
  background-color: white;
  padding-top: 10%;
  border: 7px double green;
  border-radius: 10px;
  float: left;
}
</style>

</head>
<body onload="begin()">
	<jsp:include page="Header.jsp"></jsp:include>
	
	<aside class='left'>
	</aside>
	
	<div class='content'>
		<form action="DeleteuserPro.jsp" method="post" name="myform" onSubmit="return checkIt()">
			<table width="350" border="0" align="center" bgcolor="ccffff">
				<tr height="45" align="center" >
					<td colspan="2"><b>회원 탈퇴 </b></td>
				</tr>
				
				<tr height="45">
					<td width="150" align="right">비밀번호 :</td>
					<td width="200" align="left">
						<input type="password" name="PASSWD" size="20">
					</td>
				</tr>
				
				<tr height="60">
					<td colspan="2" align="middle">
						<input type="submit" value="회원 탈퇴">
						<input type="reset" value="취 소">
					</td>
				</tr>
				
				<tr height="45">
					<td colspan="2"><b>※회원 탈퇴시 모든 정보가 삭제됩니다.</b></td>
				</tr>
				
			</table>
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

<script language="javascript">
	function begin(){
		document.myform.passwd.focus();
	}
	
	function checkIt(){
		if(!document.myform.passwd.value){
			alert("비밀번호를 입력하세요!");
			document.myform.passwd.focus();
			return false;
		}
	}
</script>
