<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <link rel="stylesheet" type="text/css" href="asset/css/main.css">
      <title>쪽지보내기</title>
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
   </head>
   <body>
   	  <jsp:include page = "/Header.jsp"></jsp:include>
		
		<aside class='left'>
		</aside>
	  <div class='content'>	
      <%    
         String id = (String)session.getAttribute("ID");
         String receiver = (String)request.getParameter("receiver");
      %>
      <center><h3>쪽지 보내기</h3></center>
      <form method ="post" action ="MemoServlet?actionMode=INS"> 
          <table border = "1" width = "500">   
              <tr>
                  <td width = "70">제목</td>
                  <td><input type = "text" name = "title" ></td>
              </tr>
              <tr>
                  <td height = "100">내용</td>
                  <td><textarea name = "content" cols = "50" rows = "7" ></textarea></td>
              </tr>
              <tr>
                  <td>보낸이</td>
                  <td><input type = "text" name = "sender" value=<%=id %>></td>
              </tr>
              <tr>
                 <td>받는이</td>
                 <td><input type="text" name="receiver" value=<%=receiver%>></td>
              </tr>
              <tr>
                  <td colspan="2" align = "center">
                  <input type = "submit" value = "입력하기" >
                  <input type = "reset" value = "다시 쓰기"></td>
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
