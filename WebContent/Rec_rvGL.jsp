<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="dbconn.LoadRcvDAO" %>
    <%@ page import="dbconn.LoadRcvDTO" %>
    <%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="kor">

	<head>
	<title>����������Ʈ UI</title>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<link rel="stylesheet" type="text/css" href="asset/css/main.css">
		<link rel="stylesheet" type="text/css" href="asset/css/content.css">
	</head>
	<%
	
	request.setCharacterEncoding("UTF-8");
	
	String stdNum = (String)session.getAttribute("STD_NUM");
	LoadRcvDAO dao = new LoadRcvDAO();
	ArrayList<LoadRcvDTO> list = dao.getLoad(stdNum);
	int n = 0;
	%>
	<body>
		<jsp:include page = "/Header.jsp"></jsp:include>
		
		<aside class='left'>
		</aside>
		
		<div class='content'>
	    			<h3>���� ���</h3>
	    			<%for(n=0;n < list.size();n++){
	    			%>
			<div class='content3'>
			
				
		�̸� : <%=list.get(n).getName() %> <br>
		�й� : <%=list.get(n).getStd_num() %><br>   
		<table align="center">
		<tr>
		<td> 
		<form action="accept" method="post">
		<input type='hidden' name='stdNum' value=<%=list.get(n).getStd_num() %>>
		<input type='hidden' name='pickNum' value=<%=stdNum %>>
	    	<button type = "submit" name = "bt01" >����</button>
	    </form>
	    </td>
	    <td><form action="reject" method="post">
	    <input type='hidden' name='StdNum' value=<%=list.get(n).getStd_num() %>>
	    <input type='hidden' name='pickNum' value=<%=stdNum %>>
	    	<button type = "submit" name = "bt02" >����</button>
	    </form>
	    </td>
	    </tr>
	   
	    
	    </table>
	    </div>		
	    <%
	    	}
	    %>
	    <%if(n==0) {%>
	    	<span style = "font-size : 2cm">�����...�Ф�</span>
	    <%} %>
	  	</div>
	  	
	  	<aside class='right'>
	  	</aside>
	  
	  	<footer>
	  		All Rights Reserved <br>
	  		Catholic Univ.
	  	</footer>
  </body>
</html>