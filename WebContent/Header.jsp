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
          <a href='Search.jsp'>�˻�</a>
        </li>
        <li class='active sub'>
          <a href='#'>�� ����</a>
          <ul>
            <li class='sub'>
              <a href='#'>�׸�����Ʈ ���</a>
              <ul>
                <li>
                  <a href='Rec_rvGL.jsp'>���� ���</a>
                </li>
                <li class='last'>
                  <a href='Rec_sdGL.jsp'>���� ���</a>
                </li>
              </ul>
            </li>
            <li>
              <a href='Deleteuser.jsp'>ȸ�� Ż��</a>
            </li>
          </ul>
        </li>
        <li>
        </li>
        <%
        	if(id!=null){
        		out.println(id+"��");
        %>
        	<button onclick="location='Logout.jsp'">�α׾ƿ�</button>
        	<a href='MemoListing?ID=${ID}'><font size=3>���� ������</font></a>
        <%	
        	}
        %>
      </ul>
    </div>


