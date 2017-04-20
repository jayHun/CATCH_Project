<%@page import="dbconn.loginDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page contentType="text/html; charset=EUC-KR" import="java.sql.*"%>
<% 	
	 String id = (String)session.getAttribute("ID");
%>
    <div class='menu'>
      <ul>
        <li>
          <a href='index.jsp'>
          	<div class='logo'>CAT.CH</div>
          </a>
        </li>
        <li>
          <a href='Search.jsp'>검색</a>
        </li>
        <li class='active sub'>
          <a href='#'>내 정보</a>
          <ul>
            <li class='sub'>
              <a href='#'>그린라이트 기록</a>
              <ul>
                <li>
                  <a href='Rec_rvGL.jsp'>받은 기록</a>
                </li>
                <li class='last'>
                  <a href='Rec_sdGL.jsp'>보낸 기록</a>
                </li>
              </ul>
            </li>
            <li>
              <a href='Deleteuser.jsp'>회원 탈퇴</a>
            </li>
          </ul>
        </li>
        <li>
        </li>
        <%
        	if(id!=null){
        		out.println(id+"님");
        %>
        	<button onclick="location='Logout.jsp'">로그아웃</button>
        	<a href='MemoListing?ID=${ID}'><font size=3>받은 쪽지함</font></a>
        <%	
        	}
        %>
      </ul>
    </div>


