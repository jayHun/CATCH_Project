<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="dbconn.LoadRcvDAO" %>
    <%@ page import="dbconn.LoadRcvDTO" %>
    <%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="kor">

	<head>
	<title>객패프로젝트 UI</title>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<link rel="stylesheet" type="text/css" href="asset/css/main.css">
		<link rel="stylesheet" type="text/css" href="asset/css/content.css">
	</head>
	<%
	
	request.setCharacterEncoding("UTF-8");
	
	String stdNum = (String)session.getAttribute("STD_NUM");
	LoadRcvDAO dao = new LoadRcvDAO();
	ArrayList<LoadRcvDTO> list = dao.getSend(stdNum);
	int n = 0;
	%>
	<body>
		<jsp:include page = "/Header.jsp"></jsp:include>
		
		<aside class='left'>
		</aside>
		
		<div class='content'>
		보낸 기록<br>
	    <%for(n=0;n < list.size();n++){
	    			%>
			<div class='content3'>
			
				
		이름 : <%=list.get(n).getName() %> <br>
		학번 : <%=list.get(n).getStd_num() %><br>   
		
	    </div>		
	    <%
	    	}
	    %> 
	    <%if(n==0) {%>
	    	<font size = '30'>없음</font>
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