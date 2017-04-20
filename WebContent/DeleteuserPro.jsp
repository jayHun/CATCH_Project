<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="dbconn.SignupDAO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="asset/css/main.css">
<title>회원 탈퇴 결과</title>

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

<%
	String id = (String)session.getAttribute("ID");
	String passwd = request.getParameter("PASSWD");
	SignupDAO manager = SignupDAO.getInstance();
	
	int check = manager.deleteMember(id, passwd);
	
	if(check == 1)
	{
		session.invalidate();
%>

<body>

	<jsp:include page="Header.jsp" />
	
	<aside class='left'>
	</aside>

	<div class="content">
		<form method="post" action="index.jsp" name="userinput">
			<table width="270" border="0" cellspacint="0" cellpadding="5" align="center">
				<tr>
					<td height="40" align="center">
						<font size="+1"><b>회원 정보가 삭제되었습니다.</b></font>
					</td>
				</tr>
				
				<tr>
					<td align="center">
						<p>bye~
						<meta http-equiv="Refresh" content="5;url=index.jsp">
					</td>
				</tr>
				
				<tr>
					<td align="center">
						<input type="submit" value="확인">
					</td>
				</tr>
				
			</table>
		</form>	
	</div>
<%
	}
	else
	{
%>	
	<script>
		alert("비밀번호가 틀립니다.");
		history.go(-1);
	</script>	
<%
	}
%>

	<aside class='right'>
	</aside>
	
	<footer>
		All Rights Reserved <br>
	  	Catholic Univ.
	</footer>

</body>
</html>