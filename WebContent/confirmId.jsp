<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
<%@ page import="dbconn.SignupDAO" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ID �ߺ�Ȯ��</title>
</head>

<% request.setCharacterEncoding("euc-kr"); %>
<%
	String id = request.getParameter("id");
	SignupDAO signupdao = SignupDAO.getInstance();
	
	int check = signupdao.confirmId(id);
%>
<body>
<%
	if(check == 1){%>
	<b><font color="red"><%= id %></font>�� �̹� ������� ���̵��Դϴ�.</b>
	<form name="checkForm" method="post" action="confirmId.jsp">
	<b>�ٸ� ���̵� �����ϼ���.</b><br /><br />
		<input type="text" name="id" />
		<input type="submit" value="ID�ߺ�Ȯ��" />
	</form>
	<%
	}else{
	%>
	<b>�Է��� <font color="red"><%= id %></font>��<br />
				��� �����մϴ�. </b><br /><br />
	<input type="button" value="�ݱ�" onclick="setid()">
	<%}%>
</body>
</html>
<script>
	function setid(){
		opener.document.userinput.ID.value="<%= id %>";
		self.close();
	}
</script>