<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="kor">
<head>
<meta charset="utf-8">
<title>ȸ������</title>
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
    <h3>�� ȸ�� ����</h3>
		<form action="SignupPro.jsp" method="post" name="userinput" onSubmit="return checkIt()">
		<table border="1" bgcolor="wheat">
			<tr>
				<td><font color="red">*</font>���̵�</td>
				<td><input type="text" name="ID"><input type="button" name="confirm_id" value="ID�ߺ�Ȯ��" onclick="openConfirmid(this.form)"></td>
			</tr>
			<tr>
				<td><font color="red">*</font>��й�ȣ</td>
				<td><input type="password" name="PASSWD"></td>
			</tr>
			<tr>
				<td><font color="red">*</font>��й�ȣ Ȯ��</td>
				<td><input type="password" name="PASSWD2">&nbsp;*������ ��ȣ �Է�</td>
			</tr>
			<tr>
				<td><font color="red">*</font>�г���</td>
				<td><input type="text" name="NICK"></td>
			</tr>
			<tr>
				<td>�̸�</td>
				<td><input type="text" name="NAME"></td>
			</tr>
			<tr>
				<td><font color="red">*</font>�й�</td>
				<td><input type="text" name="STD_NUM"></td>
			</tr>
			<tr>
				<td>����</td>
				<td><input type="number" name="AGE"></td>
			</tr>
			<tr>
				<td>���</td>
				<td><input type="text" size="10" name="HOBBY"></td>
			</tr>
			<tr>
				<td>����</td>
				<td><input type="date" name="BIRTH" placeholder="�ֹε�Ϲ�ȣ �� 6����"></td>
			</tr>
			<tr>
				<td>����</td>
				<td>
					<select name="SECTOR">
						<option>����</option>
						<option>��õ</option>
						<option>�뱸</option>
						<option>�λ�</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>����</td>
				<td><input type="text" size="20" name="RELIGION"></td>
			</tr>
			<tr>
				<td>�ڵ��� ��ȣ</td>
				<td><input type="number" name="HP" placeholder="- ���� �Է�"></td>
			</tr>
			<tr>
				<td>������ ����</td>
				<td><input type="file" name="PHOTO"></td>
			</tr>
			<tr>
				<td>������ �Ұ� ��</td>
				<td><input type="text" size="40" name="INTRODUCE"></td>
			</tr>
		</table><br><br>
		<font color="red">*</font><font size="2">�� �ʼ������׸�</font>&nbsp;&nbsp;
		<input type="submit" value="��  ��">&nbsp;<input type="reset" value="�ʱ�ȭ">
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
			alert("ID�� �Է��ϼ���!")
			return false;
		}
		
		if(!userinput.PASSWD.value) {
			alert("��й�ȣ�� �Է��ϼ���!");
			return false;
		}
		
		if(userinput.PASSWD.value != 
			document.userinput.PASSWD2.value){
			alert("��й�ȣ�� �����ϰ� �Է��ϼ���!");
			return false;
		}
		
		if(!userinput.NICK.value){
			alert("�г����� �Է��ϼ���!");
			return false;
		}
		
		if(!userinput.STD_NUM.value){
			alert("�й��� �Է��ϼ���!");
			return false;
		}
	}
	
	function openConfirmid(userinput)
	{
		if(userinput.ID.value == ""){
			alert("�ߺ�Ȯ�ο���: ���̵� �Է��ϼ���");
			return;
		}
		url="confirmId.jsp?id=" + userinput.ID.value;
		open(url, "confirm", "toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=300, height=200");
	}
</script>
</body>
</html>
