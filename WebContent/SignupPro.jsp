<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
<%@ page import="dbconn.SignupDAO" %>
<% request.setCharacterEncoding("euc-kr"); %>

<jsp:useBean id="signupdto" class="dbconn.SignupDTO">
	<jsp:setProperty name="signupdto" property="name" param="NAME" />
	<jsp:setProperty name="signupdto" property="std_num" param="STD_NUM" />
	<jsp:setProperty name="signupdto" property="hp" param="HP" />
	<jsp:setProperty name="signupdto" property="age" param="AGE" />
	<jsp:setProperty name="signupdto" property="birth" param="BIRTH" />
	<jsp:setProperty name="signupdto" property="nick" param="NICK" />
	<jsp:setProperty name="signupdto" property="photo" param="PHOTO" />
	<jsp:setProperty name="signupdto" property="hobby" param="HOBBY" />
	<jsp:setProperty name="signupdto" property="religion" param="RELIGION" />
	<jsp:setProperty name="signupdto" property="introduce" param="INTRODUCE" />
	<jsp:setProperty name="signupdto" property="sector" param="SECTOR" />
	<jsp:setProperty name="signupdto" property="passwd" param="PASSWD" />
	<jsp:setProperty name="signupdto" property="id" param="ID" />
</jsp:useBean>
<jsp:useBean id="signupdao" class="dbconn.SignupDAO" />

<%
	if(signupdao.insertMember(signupdto)>0){
		out.print("<script>");
		out.print("alert('������ ���ϵ帳�ϴ�.');");
		out.print("location.href='index.jsp';");
		out.print("</script>");
	}else{
		out.print("<script>");
		out.print("alert('ȸ�������� ���������� �Ϸ���� �ʾҽ��ϴ�.');");
		out.print("history.back();");
		out.print("</script>");
	}
%>