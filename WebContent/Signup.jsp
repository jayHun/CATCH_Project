<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="kor">
<head>
<meta charset="utf-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="asset/css/main.css">
</head>

<style>
.content{
  position: relative;
  margin-top: 50px;
  width: 500px;
  height: 550px;
  background-color: white;
  padding-left: 8%;
  border: 7px double green;
  border-radius: 10px;
  float: left;
}
</style>


<body>
	<jsp:include page="/Header.jsp" ></jsp:include>
	
	<aside class='left'>
	</aside>
	
    <div class='content'>
    <h3>※ 회원 가입</h3>
		<form action="SignupPro.jsp" method="post" name="userinput" onSubmit="return checkIt()">
		<table border="1" bgcolor="wheat">
			<tr>
				<td><font color="red">*</font>아이디</td>
				<td><input type="text" name="ID"><input type="button" name="confirm_id" value="ID중복확인" onclick="openConfirmid(this.form)"></td>
			</tr>
			<tr>
				<td><font color="red">*</font>비밀번호</td>
				<td><input type="password" name="PASSWD"></td>
			</tr>
			<tr>
				<td><font color="red">*</font>비밀번호 확인</td>
				<td><input type="password" name="PASSWD2">&nbsp;*동일한 암호 입력</td>
			</tr>
			<tr>
				<td><font color="red">*</font>닉네임</td>
				<td><input type="text" name="NICK"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="NAME"></td>
			</tr>
			<tr>
				<td><font color="red">*</font>학번</td>
				<td><input type="text" name="STD_NUM"></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="number" name="AGE"></td>
			</tr>
			<tr>
				<td>취미</td>
				<td><input type="text" size="10" name="HOBBY"></td>
			</tr>
			<tr>
				<td>생일</td>
				<td><input type="date" name="BIRTH" placeholder="주민등록번호 앞 6글자"></td>
			</tr>
			<tr>
				<td>지역</td>
				<td>
					<select name="SECTOR">
						<option>서울</option>
						<option>인천</option>
						<option>대구</option>
						<option>부산</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>종교</td>
				<td><input type="text" size="20" name="RELIGION"></td>
			</tr>
			<tr>
				<td>핸드폰 번호</td>
				<td><input type="number" name="HP" placeholder="- 빼고 입력"></td>
			</tr>
			<tr>
				<td>프로필 사진</td>
				<td><input type="file" name="PHOTO"></td>
			</tr>
			<tr>
				<td>간단한 소개 글</td>
				<td><input type="text" size="40" name="INTRODUCE"></td>
			</tr>
		</table><br><br>
		<font color="red">*</font><font size="2">는 필수기입항목</font>&nbsp;&nbsp;
		<input type="submit" value="가  입">&nbsp;<input type="reset" value="초기화">
		</form>
	</div>
	
	<aside class='right'>
	</aside>
	  
	<footer>
		All Rights Reserved <br>
	  	Catholic Univ.
	</footer>
	
	
<script language="javaScript">
	function checkIt()
	{
		var userinput = eval("document.userinput");
		
		if(!userinput.ID.value) {
			alert("ID를 입력하세요!")
			return false;
		}
		
		if(!userinput.PASSWD.value) {
			alert("비밀번호를 입력하세요!");
			return false;
		}
		
		if(userinput.PASSWD.value != 
			document.userinput.PASSWD2.value){
			alert("비밀번호를 동일하게 입력하세요!");
			return false;
		}
		
		if(!userinput.NICK.value){
			alert("닉네임을 입력하세요!");
			return false;
		}
		
		if(!userinput.STD_NUM.value){
			alert("학번을 입력하세요!");
			return false;
		}
	}
	
	function openConfirmid(userinput)
	{
		if(userinput.ID.value == ""){
			alert("중복확인에러: 아이디를 입력하세요");
			return;
		}
		url="confirmId.jsp?id=" + userinput.ID.value;
		open(url, "confirm", "toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=300, height=200");
	}
</script>
</body>
</html>
