<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="asset/css/main.css">
<style>
.content{
  position: relative;
  margin-top: 50px;
  width: 500px;
  height: 400px;
  background-color: white;
  padding-top: 20px;
  padding-left: 7%;
  border: 7px double green;
  border-radius: 10px;
  float: left;
}
</style>
<title>※받은 쪽지</title>
</head>
<body>

<jsp:include page = "/Header.jsp"></jsp:include>
	
<aside class='left'>
</aside>
		
<div class='content'>
<h4>= 받은 쪽지 =</h4>
<table border=1>
	<tr>
		<td width=50>번호</td>
		<td width=150>제목</td>
		<td width=130>보낸이</td>
	</tr>
	
	<c:choose>
		<c:when test="${MEMO_LIST.listSize == 0}">
			받은 쪽지가 없습니다.
		</c:when>
		<c:when test="${MEMO_LIST.listSize != 0}">
		<c:forEach var="cnt" begin="0" end="${MEMO_LIST.listSize-1}" step="1">
			<tr>
				<td>${MEMO_LIST.mnum[cnt]}</td>
				<td><a href='MemoContent.jsp?SEQ_NO=${MEMO_LIST.mnum[cnt]}'>${MEMO_LIST.title[cnt]}</a></td>
				<td>${MEMO_LIST.sender[cnt]}</td>
			</tr>
		</c:forEach>
		</c:when>
	</c:choose>
</table>
	<c:if test="${!MEMO_LIST.lastPage}">
		<a href='MemoListing?LAST_SEQ_NO=${MEMO_LIST.mnum[MEMO_LIST.listSize-1]}'>다음 페이지</a>
	</c:if>
	<br><br>
<h3>매칭된 사람</h3>

<form action="input.jsp?">
<c:choose>
	<c:when test="${MEMO_LIST.listSize == 0}">
		받은 그린라이트가 없습니다.
	</c:when>
	<c:when test="${MEMO_LIST.listSize != 0}">
<select name="receiver">
	<c:forEach var="cnt" begin="0" end="${MEMO_LIST.listSize-1}" step="1">
		<option>${MEMO_LIST.sender[cnt]}</option>
	</c:forEach>
</select>
	</c:when>
</c:choose>
&nbsp;&nbsp;<input type="submit" value="쪽지보내기">
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